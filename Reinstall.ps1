    Param(
       [parameter(Mandatory=$true)][String]$RdsRegistrationInfotoken
    )

    $MyApp = Get-WmiObject -Class Win32_Product | Where-Object{$_.Name -like "*remote Desktop Services*"}
    $MyApp.Uninstall()
    $MyApp2 = Get-WmiObject -Class Win32_Product | Where-Object{$_.Name -like "*remote Desktop agent*"}
    $MyApp2.Uninstall()

    $RootFolder = "C:\windows\temp"
    $WVDAgentInstaller = $RootFolder+"WVD-Agent.msi"
    $WVDBootLoaderInstaller = $RootFolder+"WVD-BootLoader.msi"

    $files = @(
        @{url = "https://query.prod.cms.rt.microsoft.com/cms/api/am/binary/RWrmXv"; path = $WVDAgentInstaller}
        @{url = "https://query.prod.cms.rt.microsoft.com/cms/api/am/binary/RWrxrH"; path = $WVDBootLoaderInstaller}
    )
    $workers = foreach ($f in $files)
    { 
        $wc = New-Object System.Net.WebClient
        Write-Output $wc.DownloadFileTaskAsync($f.url, $f.path)
    }
    $workers.Result

    Start-Process -FilePath "msiexec.exe" -ArgumentList "/i $WVDAgentInstaller", "/quiet", "/qn", "/norestart", "/passive", "REGISTRATIONTOKEN=$RdsRegistrationInfotoken", "/l* C:\Users\AgentInstall.txt" | Wait-process

    Start-Process -FilePath "msiexec.exe" -ArgumentList "/i $WVDBootLoaderInstaller", "/quiet", "/qn", "/norestart", "/passive", "/l* C:\Users\AgentBootLoaderInstall.txt" | Wait-process
