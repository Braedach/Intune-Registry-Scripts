#EPP Security recommendation
#Call the registry value
Get-ItemProperty -Path Registry::HKLM\SYSTEM\CurrentControlSet\Control\Lsa\ -Name RunAsPPL

#Set the registry value
Set-Itemproperty -Path Registry::HKLM\SYSTEM\CurrentControlSet\Control\Lsa\ -Name 'RunAsPPL' -value '1'