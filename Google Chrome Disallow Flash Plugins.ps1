#Remediation for Disable Flash Plugins in Google Chrome
#Call the registry value at and then set the value.  If the value doesnt exist it will need to be created.
#Tested 24-01-2021 - Working on machine with Chrome installed.


If (Get-ItemProperty -Path 'Registry::HKLM\SOFTWARE\Policies\Google\Chrome\')
    {
    #If the key already exists just set the value
    Write-Output "True"
    Set-Itemproperty -Path 'Registry::HKLM\SOFTWARE\Policies\Google\Chrome\' -Name 'DefaultPluginsSetting' -value '3'
    Get-ItemProperty -Path 'Registry::HKLM\SOFTWARE\Policies\Google\Chrome\' -Name DefaultPluginsSetting
    }
    else
    {
     #If the key doesnt exist then the program is not installed and doesnt need rectification
     Write-Output "False"
     New-Item -Path 'Registry::HKLM\SOFTWARE\Policies\Google\Chrome\' -Force
     New-ItemProperty -Path 'Registry::HKLM\SOFTWARE\Policies\Google\Chrome\' -Name 'DefaultPluginsSetting' -value '3'

     }
