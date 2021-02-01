#Setup Disable Domain Credentials
#Call the registry value at and then set the value
#Updated 24-01-2021 - tested and working MDM


If (Get-ItemProperty -Path Registry::HKLM\SYSTEM\CurrentControlSet\Control\Lsa\)
    {
    #If the key already exists just set the value
    Write-Output "True"
    Set-Itemproperty -Path Registry::HKLM\SYSTEM\CurrentControlSet\Control\Lsa\ -Name 'DisableDomainCredentials' -value '1'
    Get-ItemProperty -Path Registry::HKLM\SYSTEM\CurrentControlSet\Control\Lsa\ -Name DisableDomainCredentials
    }
    else
    {
     #If the key doesnt exist create it and set the value
     Write-Output "False"
     New-Item -Path Registry::HKLM\SYSTEM\CurrentControlSet\Control\Lsa\
     New-Itemproperty -Path Registry::HKLM\SYSTEM\CurrentControlSet\Control\Lsa\ -Name 'DisableDomainCredentials' -value '1' -Force
     Get-ItemProperty -Path Registry::HKLM\SYSTEM\CurrentControlSet\Control\Lsa\ -Name DisableDomainCredentials
     }
