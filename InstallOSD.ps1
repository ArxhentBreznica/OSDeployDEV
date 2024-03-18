New-Item -Path C:\ -Name bdotmp -a
Invoke-WebRequest https://github.com/ArxhentBreznica/OSDeployDEV/blob/acfd216ff46f5c72a63beb61a603f5ce6b7e2499/Office365ProPlus_Installation.xml -OutFile C:\bdotmp\Office365ProPlus_Installation.xml
Invoke-WebRequest https://github.com/ArxhentBreznica/OSDeployDEV/blob/acfd216ff46f5c72a63beb61a603f5ce6b7e2499/setup.exe -OutFile C:\bdotmp\setup.exe
Invoke-WebRequest $url -OutFile $path_to_file
Start-Process -Path 
