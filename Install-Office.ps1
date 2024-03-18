Invoke-WebRequest -Uri "https://raw.githubusercontent.com/ArxhentBreznica/OSDeployDEV/main/Office.zip" -OutFile C:\bdotmp\Office.zip
Expand-Archive -Path C:\bdotmp\Office.zip -DestinationPath C:\bdotmp\Office -Force
Start-Process -FilePath "C:\bdotmp\Office\Deploy-Application.exe"
