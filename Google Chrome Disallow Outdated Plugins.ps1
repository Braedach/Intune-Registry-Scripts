#Remediation for Disable outdated plugins in Google Chrome
#Call the registry value to see if exists, if so set the value, if not create the value
#This registry entry may or may not exist even with Google Chrome Installed
#Updated 24-01-2021


If (Get-ItemProperty -Path 'Registry::HKLM\SOFTWARE\Policies\Google\Chrome\')
    {
    #If the key already exists just set the value
    Write-Output "True"
    Set-Itemproperty -Path 'Registry::HKLM\SOFTWARE\Policies\Google\Chrome\' -Name 'AllowOutdatedPlugins' -value '0'
    Get-ItemProperty -Path 'Registry::HKLM\SOFTWARE\Policies\Google\Chrome\' -Name AllowOutdatedPlugins
    }
    else
    {
     #If the key doesnt exist then the program is not installed and doesnt need rectification
     Write-Output "False"
     New-Item 'Registry::HKLM\SOFTWARE\Policies\Google\Chrome\' -Force
     New-Itemproperty -Path 'Registry::HKLM\SOFTWARE\Policies\Google\Chrome\' -Name 'AllowOutdatedPlugins' -value '0'
     Get-ItemProperty -Path 'Registry::HKLM\SOFTWARE\Policies\Google\Chrome\' -Name AllowOutdatedPlugins

     }

