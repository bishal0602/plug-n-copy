<#
.SYNOPSIS
    This script detects the connection of a USB drive and automatically copies its contents to a specified destination folder.

.DESCRIPTION
    The script registers an event to monitor USB drive connection using CIM and copies the files from the connected USB drive to the specified destination folder.

.PARAMETER Destination
    Specifies the destination folder where the files from the USB drive will be copied to.

.PARAMETER QuietMode
    Use this flag to hide the message on file copy.

.EXAMPLE
    .\USBFileCopy.ps1 -Destination "C:\Destination" -QuietMode

    This example runs the script, specifying the destination folder "C:\Destination" and hides the message on file copy.
#>

[CmdletBinding()]
param (
    [Parameter(Mandatory=$true, HelpMessage="Destination folder")]
    [Alias("d")]
    [string]$Destination,

    [Parameter(HelpMessage="Use this flag to hide file copied message")]
    [Alias("q")]
    [switch]$QuietMode
)

# Assigning the parameters to global variables for access within the event action script block
$global:plug_n_copy_destination = $Destination
$global:plug_n_copy_quiet = $QuietMode

if (!(Test-Path -Path $Destination -PathType 'Container')) {
    $errorMessage = "The path does not lead to a directory. Please specify a directory."
    Write-Output $errorMessage
    exit 1
}

# Unregistering the event handler in case it's already registered
Unregister-Event -SourceIdentifier NewUSBEvent -ErrorAction SilentlyContinue

$USBConnectedAction = {
    $destinationFolder = $plug_n_copy_destination
    $quiet = $plug_n_copy_quiet

    # Get the connected USB drive using CIM
    $usbDrive = Get-CimInstance -Class Win32_LogicalDisk | Where-Object { $_.DriveType -eq 2 }
    if ($usbDrive) {
        $sourcePath = Join-Path -Path $usbDrive.DeviceID -ChildPath "*"
        Copy-Item -Path $sourcePath -Destination $destinationFolder -Recurse -Force
        if (!$quiet) {
            Write-Host "Files copied from USB $($usbDrive.VolumeName) to $destinationFolder"
        }
    }
}

# Register the CIM event to detect USB drive connection and invoke the action script block
Register-CimIndicationEvent -Namespace "root\CIMV2" -Query "SELECT * FROM Win32_VolumeChangeEvent WHERE EventType = 2" -SourceIdentifier NewUSBEvent -Action $USBConnectedAction
