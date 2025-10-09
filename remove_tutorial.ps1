# PowerShell Script to update tutorialStep in Modrinth options.txt

# Set the default Modrinth path
$defaultPath = "$env:APPDATA\ModrinthApp\profiles"

# Check if default exists; otherwise prompt
if (Test-Path $defaultPath) {
    $modrinthBase = $defaultPath
} else {
    Write-Host "Default path not found: $defaultPath"
    $modrinthBase = Read-Host "Enter the full path to your Modrinth 'profiles' folder"
    
    while (-not (Test-Path $modrinthBase)) {
        Write-Host "That path does not exist. Try again."
        $modrinthBase = Read-Host "Enter a valid folder path"
    }
}

# Get profile folders
$profileDirs = Get-ChildItem -Path $modrinthBase -Directory

foreach ($profile in $profileDirs) {
    $optionsPath = Join-Path $profile.FullName "options.txt"

    if (Test-Path $optionsPath) {
        $lines = Get-Content $optionsPath
        $found = $false
        $newLines = @()

        foreach ($line in $lines) {
            if ($line -like "tutorialStep:*") {
                $newLines += "tutorialStep:none"
                $found = $true
            } else {
                $newLines += $line
            }
        }

        if (-not $found) {
            $newLines += "tutorialStep:none"
        }

        # Write new file
        $newLines | Set-Content -Path $optionsPath -Encoding UTF8
        Write-Host "Updated tutorialStep in: $optionsPath"
    } else {
        Write-Host "No options.txt found in $($profile.Name), skipping..."
    }
}
