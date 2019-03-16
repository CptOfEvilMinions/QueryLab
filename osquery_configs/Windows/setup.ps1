# Command line args
param (
  $osquery_version="3.3.2",
  $osquery_flag_url="https://raw.githubusercontent.com/CptOfEvilMinions/QueryLab/master/osquery_configs/Windows/osquery.flags",
  $osquery_conf_url="https://raw.githubusercontent.com/CptOfEvilMinions/QueryLab/master/osquery_configs/Windows/osquery-windows.conf"
)

Write-Output "Osquery version: $osquery_version"
Write-Output "osquery.flags url: $osquery_flag_url"
Write-Output "osquery.conf url: $osquery_conf_url"

# Download OSquery agent
Write-Output "Downloading OSquery $osquery_version"
Invoke-WebRequest "https://pkg.osquery.io/windows/osquery-$osquery_version.msi" -OutFile $env:TEMP\osquery-$osquery_version.msi


# Install OSquery
Write-Output "Installing OSquery $osquery_version"
Start-Process $env:TEMP\osquery-$osquery_version.msi /quiet -Wait

# Download Windows osquery.conf
Write-Output "Downloading osquery.conf"
Invoke-WebRequest $osquery_conf_url -OutFile C:\ProgramData\osquery\osquery.conf

# Download Windows osquery.flags
Write-Output "Downloading osquery.flags"
Invoke-WebRequest $osquery_flag_url -OutFile C:\ProgramData\osquery\osquery.flags

# Restart service
Write-Output "Restarting OSqueryD service"
Restart-Service -Name osqueryd

# Print service status
Get-Service -Name osqueryd

Write-Output "Done :) - QueryLab"