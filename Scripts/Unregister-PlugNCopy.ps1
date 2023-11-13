<#
.SYNOPSIS
    Unregister-PlugNCopy: Unregisters the event handler and clears global variables.

.DESCRIPTION
    This function unregisters the event handler that was previously set up to monitor USB drive connections using WMI. It also clears global variables starting with "plug_n_copy_" to remove any residual data related to USB file copying.

.EXAMPLE
    Unregister-PlugNCopy

    This example runs the function to unregister the USB drive connection event handler and clear global variables.
#>
function Unregister-PlugNCopy {
    # Unregister the event handler and clear global variables
    Unregister-Event -SourceIdentifier NewUSBEvent
    Clear-Variable -Name plug_n_copy_* -Scope Global
}

# Register the function to make it available when the module is imported
Export-ModuleMember -Function 'Unregister-PlugNCopy'
