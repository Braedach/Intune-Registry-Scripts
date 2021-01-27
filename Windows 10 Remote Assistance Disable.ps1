#Disable Configure Offer of Remote Assistance - User can still request assistance
#Call the registry value at and then set the value

If (Get-ItemProperty -Path 'Registry::HKLM\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services')
    {
    #If the key already exists just set the value
    Write-Output "True"
    Set-Itemproperty -Path Registry::HKLM\SOFTWARE\Policies\Microsoft\Windows\Installer\ -Name 'fAllowUnsolicited' -value '0'
    Get-ItemProperty -Path Registry::HKLM\SOFTWARE\Policies\Microsoft\Windows\Installer\ -Name fAllowUnsolicited
    }
    else
    {
     #If the key doesnt exist then the program is not installed and doesnt need rectification
     Write-Output "False"
     }
