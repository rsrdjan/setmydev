$file = Get-Content -Path .\extensions.devenv

Write-Output "Installing extensions..."

foreach ($extension in $file)
{
    Write-Output $extension
    code --install-extension $extension
    Write-Output "Done."
}