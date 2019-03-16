# Download OSquery agent
Invoke-WebRequest https://pkg.osquery.io/windows/osquery-3.3.2.msi -OutFile %USERPROFILE%\AppData\Local\osquery-3.3.2.msi

# CD into user's TEMP folder
cd %USERPROFILE%\AppData\Local

# Install OSquery
.\osquery-3.3.2.msi /quiet

# Download Windows osquery.flag

# Download Windows osquery.conf

# Restart service
Restart-Service -Name osqueryd