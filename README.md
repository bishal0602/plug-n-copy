# Plug-n-Copy

Plug-n-Copy allows you to secretly copy files from a USB drive to a destination folder when it's plugged in.

---

## Project Structure

```
Plug-n-Copy
├── Scripts
├   ├── Register-PlugNCopy.ps1
├   ├── Unregister-PlugNCopy.ps1
├── Plug-n-Copy.psd1
├── Plug-n-Copy.psm1
├── README.md
```

---

## Usage

1. **Import the Plug-n-Copy module** by running the following command:

```powershell
Import-Module -Name "Plug-n-Copy"
```

2. **Register USB monitoring and file copying**:

```powershell
Register-PlugNCopy -Destination "C:\Destination"
```

The `-Destination` parameter specifies the destination folder where the files will be copied. The `-ShowMessage` switch can be used to display the file copied message on the terminal.

3. **Plug in a USB drive.** The module will detect the connection and copy the files to the specified destination folder.

4. When you're done, **unregister USB monitoring** and clean up variables:

```powershell
Unregister-PlugNCopy
```

Enjoy using Plug-n-Copy!

## Additional Details

For more details on the parameters and usage, run:

```powershell
Get-Help Register-PlugNCopy -Detailed
```
