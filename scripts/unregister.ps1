<#
.SYNOPSIS
    This script unregisters the event handler and clears global variables.

.DESCRIPTION
    The script unregisters the event handler that was previously set up to monitor USB drive connections using WMI. It also clears global variables starting with "plug_n_copy_" to remove any residual data related to USB file copying.

.EXAMPLE
    .\unregister.ps1

    This example runs the script to unregister the USB drive connection event handler and clear global variables.

#>

Unregister-Event -SourceIdentifier NewUSBEvent
Clear-Variable -Name plug_n_copy_* -Scope Global
