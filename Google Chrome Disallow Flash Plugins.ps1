#Remediation for Disable Flash Plugins in Google Chrome
#Test the registry value, if it exists, modify.  If not do nothing


If (Test-Path -Path 'Registry::HKLM\SOFTWARE\Policies\Google\Chrome\')
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
    }
