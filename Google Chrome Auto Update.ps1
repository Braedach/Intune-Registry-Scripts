#Setup Auto update on Google Chrome
#Call the registry value to see if it exists, if it does modify it, if it doesnt create it.
#Setup Auto update on Google Chrome
#Test to see if the key exists, if it does change it, if it doesnt do nothing - not installed
#Updated 03-03-2021


If (Test-Path -Path 'Registry::HKLM\SOFTWARE\Policies\Google\Update')
    {
    #If the key already exists just set the value
    #Write-Output "True"
    Set-Itemproperty -Path 'Registry::HKLM\SOFTWARE\Policies\Google\Update' -Name 'Updatedefault' -value '3'
    Set-ItemProperty -Path 'Registry::HKLM\SOFTWARE\Policies\Google\Update' -Name 'AutoUpdateCheckPeriod' -value '180'
    Get-ItemProperty -Path 'Registry::HKLM\SOFTWARE\Policies\Google\Update'
    }
    else
    {
     ##If the key doesnt exist then the program is not installed and doesnt need rectification
     Write-Output "False"
     }
