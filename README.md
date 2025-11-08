# Disable Minecraft Tutorial for Modrinth Profiles

![Tutorial Screenshot](https://raw.githubusercontent.com/cerxil/disable-minecraft-tutorial-for-modrinth/refs/heads/main/Tutorial.png)

This script disables the Minecraft tutorial across all your Modrinth profiles by modifying each profile’s `options.txt` file.

## How It Works

* Checks the default Modrinth installation path:
  `%APPDATA%\ModrinthApp\profiles`

* If the default path is not found, the script prompts you to enter a custom installation path.
  Example: `G:\Modrinth App\Data\profiles`

* It then scans all profile folders within the directory.
  Example:
  `1.7.0`
  `1.12.0`
  `1.20.0`

* In each profile, it modifies (or creates) the `options.txt` file to include:
  `tutorialStep:none`

## How to Run

You have two options:

### 1. Download and Run Manually (Offline)

* Download `remove_tutorial.ps1` from this repository.
* Right-click the file and select **Run with PowerShell** (or run it in PowerShell manually).

### 2. One-Time Execution via PowerShell

You can run the script directly from GitHub using this command in PowerShell:

```powershell
irm https://raw.githubusercontent.com/cerxil/disable-minecraft-tutorial-for-modrinth/main/remove_tutorial.ps1 | iex
```

Note: You may need to allow script execution by running:
```powershell
Set-ExecutionPolicy -Scope CurrentUser RemoteSigned
```

## Troubleshooting

If you encounter errors:

* Ensure PowerShell is run with sufficient permissions (try **Run as Administrator**).
* Double-check that your Modrinth profiles folder exists.
* If using a custom path, verify that it’s typed correctly and points to the folder containing your profiles.

---

If something doesn’t work as expected, feel free to [open an issue](https://github.com/cerxil/disable-minecraft-tutorial-for-modrinth/issues).
