Start-Transcript -Path  C:\Temp\InstallLanguage.txt
Install-Language -Language de-de -CopyToSettings
Copy-UserInternationalSettingsToSystem
Stop-Transcript
