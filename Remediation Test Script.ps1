# Define Variables
# See if Adobe Acrobat is installed and look for Javascript Enabled Key

try {
    $gpResult = [datetime]::FromFileTime(([Int64] ((Get-ItemProperty -Path "Registry::HKLM\SOFTWARE\Policies\Adobe\Acrobat Reader\DC\FeatureLockDown\").startTimeHi) -shl 32) -bor ((Get-ItemProperty -Path "Registry::HKLM\SOFTWARE\Policies\Adobe\Acrobat Reader\DC\FeatureLockDown\").startTimeLo))
    $lastGPUpdateDate = Get-Date ($gpResult[0])
    [int]$lastGPUpdateDays = (New-TimeSpan -Start $lastGPUpdateDate -End (Get-Date)).Days
        
    if ($lastGPUpdateDays -gt 7){
        #Exit 1 for Intune. We want it to be within the last 7 days "Match" to remediate in SCCM
        Write-Host "Match"
        exit 1
    }
    else {
        #Exit 0 for Intune and "No_Match" for SCCM, only remediate "Match"
        Write-Host "No_Match"            
        exit 0
    }
}
catch {
    $errMsg = $_.Exception.Message
    return $errMsg
    exit 1
}
