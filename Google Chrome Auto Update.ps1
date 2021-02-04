#Setup Auto update on Google Chrome
#Call the registry value to see if it exists, if it does modify it, if it doesnt create it.
#This control has been depreciated and removed from Intune.  ADMX control is used in lieu
#Updated 04-02-2021


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

