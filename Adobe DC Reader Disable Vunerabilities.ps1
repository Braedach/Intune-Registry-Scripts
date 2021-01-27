#Adobe DC Reader feature lockdown
#Call the registry value and then set the value.  If the value doesnt exit app not installed so exit
#Updated 24-01-2021 and tested on machine with Adobe DC installed


If (Get-ItemProperty -Path 'Registry::HKLM\SOFTWARE\Policies\Adobe\Acrobat Reader\DC\FeatureLockDown')
    {
    #If the key already exists just set the value
    Write-Output "True"
    Set-Itemproperty -Path 'Registry::HKLM\SOFTWARE\Policies\Adobe\Acrobat Reader\DC\FeatureLockDown' -Name 'bDisableJavaScript' -value '1'
    Set-Itemproperty -Path 'Registry::HKLM\SOFTWARE\Policies\Adobe\Acrobat Reader\DC\FeatureLockDown' -Name 'bEnableFlash' -value '0'
    Get-ItemProperty -Path 'Registry::HKLM\SOFTWARE\Policies\Adobe\Acrobat Reader\DC\FeatureLockDown'
    }
    else
    {
     #If the key doesnt exist then the program is not installed and doesnt need rectification
     Write-Output "False"
     }

