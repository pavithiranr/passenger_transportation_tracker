$protocPath = "C:\Users\USER\protoc\bin"
$protocExe = Join-Path $protocPath "protoc.exe"

# Verify protoc.exe exists
if (-not (Test-Path $protocExe)) {
    Write-Host "protoc.exe not found at $protocExe" -ForegroundColor Red
    exit 1
}

# Get the current PATH
$currentPath = [Environment]::GetEnvironmentVariable("Path", "Machine")

# Check if protoc path is already in PATH
if ($currentPath -notlike "*$protocPath*") {
    # Add to PATH
    $newPath = "$currentPath;$protocPath"
    [Environment]::SetEnvironmentVariable("Path", $newPath, "Machine")
    Write-Host "Added protoc to PATH" -ForegroundColor Green
} else {
    Write-Host "protoc already in PATH" -ForegroundColor Yellow
}

# Refresh environment variables
$env:Path = [Environment]::GetEnvironmentVariable("Path", "Machine")

# Test protoc
try {
    $version = & $protocExe --version
    Write-Host "protoc installed successfully. Version: $version" -ForegroundColor Green
} catch {
    Write-Host "Error running protoc: $_" -ForegroundColor Red
}