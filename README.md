# Plug-n-Copy

Plug-n-Copy is a powershell script that allows you to secretly copy files from a USB drive to a destination folder when it's plugged in.

---

## Project Structure

```
scripts
├── register.ps1
└── unregister.ps1
```

---

## Usage

1. **Run the `register.ps1`** script to start monitoring for USB drive connection and automatically copy its contents to a destination folder.

```powershell
cd .\scripts\
.\register.ps1 -Destination "C:\Destination"
```

The `-Destination` parameter specifies the destination folder where the files will be copied. The `-ShowMessage` flag can be used to display the file copied message on terminal.

2. **Plug in a USB drive.** The script will detect the connection & copy the files to the specified destination folder.

3. When you're done, **run the `unregister.ps1`** script to stop monitoring for USB drive connection & clean up some variables set by the script.

```powershell
.\unregister.ps1
```

That's it! Enjoy using Plug-n-Copy!

---

For more details, run

```powershell
Get-Help .\register.ps1 -Detailed
```
