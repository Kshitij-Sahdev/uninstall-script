# PowerShell script to uninstall coding-related software
# Run as Administrator for best results

Write-Host "Starting uninstallation of coding-related software..." -ForegroundColor Green
Write-Host "This script will remove development tools, IDEs, and programming languages." -ForegroundColor Yellow
Write-Host ""

# Function to uninstall via winget
function Uninstall-WingetPackage {
    param($PackageId, $DisplayName)
    Write-Host "Do you want to uninstall $DisplayName? (y/n): " -ForegroundColor Yellow -NoNewline
    $response = Read-Host
    if ($response -eq "y" -or $response -eq "Y") {
        Write-Host "Uninstalling $DisplayName..." -ForegroundColor Cyan
        try {
            winget uninstall --id $PackageId --silent --accept-source-agreements
            Write-Host "✓ Successfully uninstalled $DisplayName" -ForegroundColor Green
        }
        catch {
            Write-Host "✗ Failed to uninstall $DisplayName" -ForegroundColor Red
        }
    } else {
        Write-Host "⊘ Skipped $DisplayName" -ForegroundColor Gray
    }
}

# Function to uninstall MSIX packages
function Uninstall-MSIXPackage {
    param($PackageName, $DisplayName)
    Write-Host "Do you want to uninstall $DisplayName? (y/n): " -ForegroundColor Yellow -NoNewline
    $response = Read-Host
    if ($response -eq "y" -or $response -eq "Y") {
        Write-Host "Uninstalling $DisplayName..." -ForegroundColor Cyan
        try {
            Get-AppxPackage -Name "*$PackageName*" | Remove-AppxPackage
            Write-Host "✓ Successfully uninstalled $DisplayName" -ForegroundColor Green
        }
        catch {
            Write-Host "✗ Failed to uninstall $DisplayName" -ForegroundColor Red
        }
    } else {
        Write-Host "⊘ Skipped $DisplayName" -ForegroundColor Gray
    }
}

# Development Tools & IDEs
Write-Host "=== Development Tools & IDEs ===" -ForegroundColor Magenta
Uninstall-WingetPackage "Microsoft.VisualStudioCode" "Visual Studio Code"
Uninstall-WingetPackage "Anysphere.Cursor" "Cursor"
Uninstall-WingetPackage "JetBrains.IntelliJIDEA.Community" "IntelliJ IDEA Community"
Uninstall-WingetPackage "Microsoft.VisualStudio.2019.BuildTools" "Visual Studio Build Tools 2019"

# Android Development
Write-Host "`n=== Android Development ===" -ForegroundColor Magenta
Write-Host "Do you want to uninstall Android Studio manually? (y/n): " -ForegroundColor Yellow -NoNewline
$androidResponse = Read-Host
if ($androidResponse -eq "y" -or $androidResponse -eq "Y") {
    Write-Host "Please uninstall Android Studio manually from Settings > Apps > Android Studio" -ForegroundColor Cyan
    Write-Host "Press any key after uninstalling Android Studio..." -ForegroundColor Yellow
    $null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
} else {
    Write-Host "⊘ Skipped Android Studio" -ForegroundColor Gray
}

# Programming Languages & Runtimes
Write-Host "`n=== Programming Languages & Runtimes ===" -ForegroundColor Magenta
Uninstall-WingetPackage "Python.Python.3.13" "Python 3.13"
Uninstall-WingetPackage "Python.Python.3.12" "Python 3.12"
Uninstall-WingetPackage "Python.Launcher" "Python Launcher"
Uninstall-WingetPackage "GoLang.Go" "Go Programming Language"
Uninstall-WingetPackage "OpenJDK.OpenJDK" "OpenJDK"
Uninstall-WingetPackage "Microsoft.OpenJDK.17" "Microsoft JDK 17"
Uninstall-WingetPackage "Oracle.JDK.17" "Oracle JDK"
Uninstall-WingetPackage "Oracle.JavaRuntimeEnvironment" "Java Runtime Environment"

# .NET Runtimes
Write-Host "`n=== .NET Runtimes ===" -ForegroundColor Magenta
Uninstall-WingetPackage "Microsoft.DotNet.Runtime.8" ".NET Runtime 8"
Uninstall-WingetPackage "Microsoft.DotNet.AspNetCore.8" "ASP.NET Core Runtime 8"
Uninstall-WingetPackage "Microsoft.DotNet.DesktopRuntime.8" ".NET Desktop Runtime 8"
Uninstall-WingetPackage "Microsoft.DotNet.Runtime.3_1" ".NET Core Runtime 3.1"

# Version Control
Write-Host "`n=== Version Control ===" -ForegroundColor Magenta
Uninstall-WingetPackage "Git.Git" "Git"
Uninstall-WingetPackage "GitHub.GitHubDesktop" "GitHub Desktop"

# Development Databases
Write-Host "`n=== Development Databases ===" -ForegroundColor Magenta
Uninstall-WingetPackage "Oracle.MySQL" "MySQL Installer"
Uninstall-WingetPackage "Oracle.MySQLWorkbench" "MySQL Workbench"
Write-Host "Do you want to uninstall MySQL Server instances manually? (y/n): " -ForegroundColor Yellow -NoNewline
$mysqlResponse = Read-Host
if ($mysqlResponse -eq "y" -or $mysqlResponse -eq "Y") {
    Write-Host "Please uninstall the following MySQL components manually from Settings > Apps:" -ForegroundColor Cyan
    Write-Host "- MySQL Server 8.3" -ForegroundColor White
    Write-Host "- MySQL Server 8.0" -ForegroundColor White
    Write-Host "- MySQL Shell" -ForegroundColor White
    Write-Host "- MySQL Router 8.0" -ForegroundColor White
    Write-Host "- MySQL Documents" -ForegroundColor White
    Write-Host "Press any key after uninstalling MySQL components..." -ForegroundColor Yellow
    $null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
} else {
    Write-Host "⊘ Skipped MySQL Server components" -ForegroundColor Gray
}

# Development Tools
Write-Host "`n=== Development Tools ===" -ForegroundColor Magenta
Uninstall-WingetPackage "Docker.DockerDesktop" "Docker Desktop"
Uninstall-WingetPackage "Postman.Postman" "Postman"
Uninstall-WingetPackage "Kitware.CMake" "CMake"

# Data Science & Analysis
Write-Host "`n=== Data Science & Analysis ===" -ForegroundColor Magenta
Uninstall-WingetPackage "RProject.R" "R for Windows"
Uninstall-WingetPackage "Posit.RStudio" "RStudio"
Uninstall-WingetPackage "Anaconda.Miniconda3" "Miniconda3"

# Windows SDKs & Build Tools
Write-Host "`n=== Windows SDKs & Build Tools ===" -ForegroundColor Magenta
Uninstall-WingetPackage "Microsoft.WindowsSDK.10.0.19041" "Windows SDK"

# Visual C++ Redistributables (Keep these as they're needed by many applications)
Write-Host "`n=== Visual C++ Redistributables ===" -ForegroundColor Magenta
Write-Host "Do you want to uninstall Visual C++ Redistributables? (NOT RECOMMENDED) (y/n): " -ForegroundColor Red -NoNewline
$vcredistResponse = Read-Host
if ($vcredistResponse -eq "y" -or $vcredistResponse -eq "Y") {
    Write-Host "WARNING: This may break other applications!" -ForegroundColor Red
    Uninstall-WingetPackage "Microsoft.VCRedist.2015+.x64" "Visual C++ 2015-2022 Redistributable (x64)"
    Uninstall-WingetPackage "Microsoft.VCRedist.2015+.x86" "Visual C++ 2015-2022 Redistributable (x86)"
    Uninstall-WingetPackage "Microsoft.VCRedist.2013.x64" "Visual C++ 2013 Redistributable (x64)"
    Uninstall-WingetPackage "Microsoft.VCRedist.2013.x86" "Visual C++ 2013 Redistributable (x86)"
    Uninstall-WingetPackage "Microsoft.VCRedist.2012.x64" "Visual C++ 2012 Redistributable (x64)"
    Uninstall-WingetPackage "Microsoft.VCRedist.2012.x86" "Visual C++ 2012 Redistributable (x86)"
    Uninstall-WingetPackage "Microsoft.VCRedist.2010.x64" "Visual C++ 2010 Redistributable (x64)"
    Uninstall-WingetPackage "Microsoft.VCRedist.2010.x86" "Visual C++ 2010 Redistributable (x86)"
    Uninstall-WingetPackage "Microsoft.XNARedist" "Microsoft XNA Framework Redistributable"
} else {
    Write-Host "✓ Keeping Visual C++ Redistributables (RECOMMENDED)" -ForegroundColor Green
}

# Node.js
Write-Host "`n=== Node.js ===" -ForegroundColor Magenta
Write-Host "Do you want to uninstall Node.js manually? (y/n): " -ForegroundColor Yellow -NoNewline
$nodeResponse = Read-Host
if ($nodeResponse -eq "y" -or $nodeResponse -eq "Y") {
    Write-Host "Please uninstall Node.js manually from Settings > Programs" -ForegroundColor Cyan
    Write-Host "Press any key after uninstalling Node.js..." -ForegroundColor Yellow
    $null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
} else {
    Write-Host "⊘ Skipped Node.js" -ForegroundColor Gray
}

# Game Development (Tiled)
Write-Host "`n=== Game Development Tools ===" -ForegroundColor Magenta
Uninstall-WingetPackage "Tiled.Tiled" "Tiled Map Editor"

# Terminal Applications
Write-Host "`n=== Terminal Applications ===" -ForegroundColor Magenta
Uninstall-WingetPackage "Microsoft.WindowsTerminal" "Windows Terminal"

# Remote Development Tools
Write-Host "`n=== Remote Development Tools ===" -ForegroundColor Magenta
Uninstall-WingetPackage "Google.ChromeRemoteDesktopHost" "Chrome Remote Desktop Host"
Write-Host "Do you want to uninstall Chrome Remote Desktop? (y/n): " -ForegroundColor Yellow -NoNewline
$chromeRemoteResponse = Read-Host
if ($chromeRemoteResponse -eq "y" -or $chromeRemoteResponse -eq "Y") {
    Write-Host "Please uninstall Chrome Remote Desktop manually from Settings > Programs" -ForegroundColor Cyan
    Write-Host "Press any key after uninstalling Chrome Remote Desktop..." -ForegroundColor Yellow
    $null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
} else {
    Write-Host "⊘ Skipped Chrome Remote Desktop" -ForegroundColor Gray
}

# WSL (Windows Subsystem for Linux)
Write-Host "`n=== Windows Subsystem for Linux ===" -ForegroundColor Magenta
Uninstall-WingetPackage "Canonical.Ubuntu" "Ubuntu"
Uninstall-MSIXPackage "WindowsSubsystemForLinux" "Windows Subsystem for Linux"

# Additional Development Tools
Write-Host "`n=== Additional Development Tools ===" -ForegroundColor Magenta
Write-Host "Do you want to uninstall Oracle VirtualBox manually? (y/n): " -ForegroundColor Yellow -NoNewline
$vboxResponse = Read-Host
if ($vboxResponse -eq "y" -or $vboxResponse -eq "Y") {
    Write-Host "Please uninstall Oracle VirtualBox 7.1.4 manually from Settings > Programs" -ForegroundColor Cyan
    Write-Host "Press any key after uninstalling VirtualBox..." -ForegroundColor Yellow
    $null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
} else {
    Write-Host "⊘ Skipped Oracle VirtualBox" -ForegroundColor Gray
}

# Networking Development Tool
Uninstall-WingetPackage "Cisco.PacketTracer" "Cisco Packet Tracer"

# PlayStation SDK (Game Development)
Write-Host "Do you want to uninstall PlayStation PC SDK Runtime? (y/n): " -ForegroundColor Yellow -NoNewline
$playstationResponse = Read-Host
if ($playstationResponse -eq "y" -or $playstationResponse -eq "Y") {
    Write-Host "Please uninstall PlayStation(R) PC SDK Runtime manually from Settings > Programs" -ForegroundColor Cyan
    Write-Host "Press any key after uninstalling PlayStation SDK..." -ForegroundColor Yellow
    $null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
} else {
    Write-Host "⊘ Skipped PlayStation PC SDK Runtime" -ForegroundColor Gray
}

# CodeTantra (Coding Platform)
Write-Host "Do you want to uninstall CodeTantra SEA? (y/n): " -ForegroundColor Yellow -NoNewline
$codetantraResponse = Read-Host
if ($codetantraResponse -eq "y" -or $codetantraResponse -eq "Y") {
    Write-Host "Please uninstall CodeTantra SEA 3.0.7 manually from Settings > Programs" -ForegroundColor Cyan
    Write-Host "Press any key after uninstalling CodeTantra..." -ForegroundColor Yellow
    $null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
} else {
    Write-Host "⊘ Skipped CodeTantra SEA" -ForegroundColor Gray
}

# Arc Browser (Developer Browser)
Uninstall-WingetPackage "TheBrowserCompany.Arc" "Arc Browser"

# Windows Driver Development Kit components
Write-Host "Do you want to uninstall Windows Driver Development components? (y/n): " -ForegroundColor Yellow -NoNewline
$wdkResponse = Read-Host
if ($wdkResponse -eq "y" -or $wdkResponse -eq "Y") {
    Write-Host "Please uninstall the following manually from Settings > Programs:" -ForegroundColor Cyan
    Write-Host "- X64 Debuggers And Tools" -ForegroundColor White
    Write-Host "- X86 Debuggers And Tools" -ForegroundColor White
    Write-Host "- Windows Driver Testing Framework (WDTF)" -ForegroundColor White
    Write-Host "- Windows SDK AddOn" -ForegroundColor White
    Write-Host "Press any key after uninstalling WDK components..." -ForegroundColor Yellow
    $null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
} else {
    Write-Host "⊘ Skipped Windows Driver Development components" -ForegroundColor Gray
}

# Microsoft Visual Studio Installer
Write-Host "Do you want to uninstall Microsoft Visual Studio Installer? (y/n): " -ForegroundColor Yellow -NoNewline
$vsInstallerResponse = Read-Host
if ($vsInstallerResponse -eq "y" -or $vsInstallerResponse -eq "Y") {
    Write-Host "Please uninstall Microsoft Visual Studio Installer manually from Settings > Programs" -ForegroundColor Cyan
    Write-Host "Press any key after uninstalling VS Installer..." -ForegroundColor Yellow
    $null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
} else {
    Write-Host "⊘ Skipped Microsoft Visual Studio Installer" -ForegroundColor Gray
}

Write-Host "`n=== Cleanup Complete ===" -ForegroundColor Green
Write-Host "Some applications may require manual removal from Settings > Programs or Control Panel" -ForegroundColor Yellow
Write-Host "You may need to restart your computer to complete the uninstallation process" -ForegroundColor Yellow

# Optional: Clean up remaining folders
Write-Host "`nDo you want to clean up remaining program folders? (y/n): " -ForegroundColor Cyan -NoNewline
$cleanup = Read-Host
if ($cleanup -eq "y" -or $cleanup -eq "Y") {
    Write-Host "Cleaning up program folders..." -ForegroundColor Cyan
    $foldersToClean = @(
        # Python folders
        "$env:LOCALAPPDATA\Programs\Python",
        "$env:APPDATA\Python",
        "$env:PROGRAMFILES\Python*",
        # Development tools
        "$env:PROGRAMFILES\Git",
        "$env:LOCALAPPDATA\GitHubDesktop",
        "$env:APPDATA\GitHubDesktop",
        # MySQL folders
        "$env:PROGRAMFILES\MySQL",
        "$env:PROGRAMDATA\MySQL",
        # Docker folders
        "$env:PROGRAMFILES\Docker",
        "$env:APPDATA\Docker",
        "$env:LOCALAPPDATA\Docker",
        # R and RStudio
        "$env:PROGRAMFILES\R",
        "$env:LOCALAPPDATA\RStudio",
        "$env:APPDATA\RStudio",
        # IDEs
        "$env:APPDATA\Code",
        "$env:LOCALAPPDATA\Programs\Microsoft VS Code",
        "$env:APPDATA\cursor",
        "$env:LOCALAPPDATA\Programs\cursor",
        # JetBrains
        "$env:LOCALAPPDATA\JetBrains",
        "$env:APPDATA\JetBrains",
        # Node.js
        "$env:PROGRAMFILES\nodejs",
        "$env:APPDATA\npm",
        "$env:LOCALAPPDATA\npm-cache",
        # Go
        "$env:LOCALAPPDATA\go",
        "$env:APPDATA\go",
        # Android
        "$env:LOCALAPPDATA\Android",
        "$env:APPDATA\Android",
        # VirtualBox
        "$env:PROGRAMFILES\Oracle\VirtualBox",
        "$env:LOCALAPPDATA\VirtualBox",
        # Conda/Miniconda
        "$env:LOCALAPPDATA\miniconda3",
        "$env:LOCALAPPDATA\conda",
        "$env:APPDATA\conda",
        # Cisco Packet Tracer
        "$env:PROGRAMFILES\Cisco Packet Tracer*",
        "$env:LOCALAPPDATA\Cisco",
        # Chrome Remote Desktop
        "$env:LOCALAPPDATA\Google\Chrome Remote Desktop",
        # Arc Browser
        "$env:LOCALAPPDATA\Arc",
        "$env:APPDATA\Arc"
    )
    
    foreach ($folder in $foldersToClean) {
        if (Test-Path $folder) {
            Write-Host "Do you want to delete $folder? (y/n): " -ForegroundColor Yellow -NoNewline
            $folderResponse = Read-Host
            if ($folderResponse -eq "y" -or $folderResponse -eq "Y") {
                try {
                    Remove-Item $folder -Recurse -Force -ErrorAction Stop
                    Write-Host "✓ Cleaned up $folder" -ForegroundColor Green
                }
                catch {
                    Write-Host "✗ Could not clean up $folder - $($_.Exception.Message)" -ForegroundColor Red
                }
            } else {
                Write-Host "⊘ Skipped $folder" -ForegroundColor Gray
            }
        }
    }
}

Write-Host "`n=== FINAL MANUAL CLEANUP CHECKLIST ===" -ForegroundColor Magenta
Write-Host "Please manually verify and remove any remaining items:" -ForegroundColor Yellow
Write-Host "1. Settings > Apps - Search for:" -ForegroundColor Cyan
Write-Host "   - Android Studio" -ForegroundColor White
Write-Host "   - Node.js" -ForegroundColor White
Write-Host "   - MySQL Server 8.3/8.0" -ForegroundColor White
Write-Host "   - MySQL Shell/Router/Documents" -ForegroundColor White
Write-Host "   - Visual Studio Installer" -ForegroundColor White
Write-Host "   - Oracle VirtualBox 7.1.4" -ForegroundColor White
Write-Host "   - Cisco Packet Tracer 8.2.2" -ForegroundColor White
Write-Host "   - PlayStation(R) PC SDK Runtime" -ForegroundColor White
Write-Host "   - CodeTantra SEA 3.0.7" -ForegroundColor White
Write-Host "   - Chrome Remote Desktop" -ForegroundColor White
Write-Host "   - Any remaining Python installations" -ForegroundColor White
Write-Host "2. Environment Variables to clean:" -ForegroundColor Cyan
Write-Host "   - PATH entries for Python, Node.js, Git, Go, etc." -ForegroundColor White
Write-Host "   - JAVA_HOME, PYTHON_PATH, GOPATH variables" -ForegroundColor White
Write-Host "3. Registry cleanup (ADVANCED USERS ONLY):" -ForegroundColor Cyan
Write-Host "   - Run 'regedit' and clean software entries if needed" -ForegroundColor White

Write-Host "`nScript completed! Please restart your computer to complete the cleanup." -ForegroundColor Green
