#Disable always install with evevated privileges
#Call the registry value at and then set the value
#Updated and tested 24-01-2021 - Working in MDM

If (Get-ItemProperty -Path 'Registry::HKLM\SOFTWARE\Policies\Microsoft\Windows\Installer')
    {
    #If the key already exists just set the value
    Write-Output "True"
    Set-Itemproperty -Path Registry::HKLM\SOFTWARE\Policies\Microsoft\Windows\Installer\ -Name 'AlwaysInstallElevated' -value '0'
    Get-ItemProperty -Path Registry::HKLM\SOFTWARE\Policies\Microsoft\Windows\Installer\ -Name AlwaysInstallElevated
    }
    else
    {
     #If the key doesnt exist create it and set the value
     Write-Output "False"
     New-Item -Path Registry::HKLM\SOFTWARE\Policies\Microsoft\Windows\Installer
     New-Itemproperty -Path Registry::HKLM\SOFTWARE\Policies\Microsoft\Windows\Installer\ -Name 'AlwaysInstallElevated' -value '0' -Force
     Get-ItemProperty -Path Registry::HKLM\SOFTWARE\Policies\Microsoft\Windows\Installer\ -Name AlwaysInstallElevated
     }
