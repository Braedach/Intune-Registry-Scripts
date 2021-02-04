#Setup Auto update on Google Chrome
#Call the registry value and set the value.  This entry needs to be created on other machines as no default policy exists
#Updated 24-01-2021


If (Get-ItemProperty -Path 'Registry::HKLM\SOFTWARE\Policies\Google\Update')
    {
    #If the key already exists just set the value
    #Write-Output "True"
    Set-Itemproperty -Path 'Registry::HKLM\SOFTWARE\Policies\Google\Update' -Name 'Updatedefault' -value '3'
    Get-ItemProperty -Path 'Registry::HKLM\SOFTWARE\Policies\Google\Update' -Name Updatedefault
    }
    else
    {
     ##If the key doesnt exist then the program is not installed and doesnt need rectification
     Write-Output "False"
     New-Item -Path 'Registry::HKLM\SOFTWARE\Policies\Google\Update\' -Force
     New-Item -Path 'Registry::HKLM\SOFTWARE\Policies\Google\Update' -Name 'Updatedefault' -value '3'
     Get-ItemProperty -Path 'Registry::HKLM\SOFTWARE\Policies\Google\Update' -Name Updatedefault
     }

