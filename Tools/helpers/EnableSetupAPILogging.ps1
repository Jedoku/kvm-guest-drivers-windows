
$RegistryPath = "HKLM:\Software\Microsoft\Windows\CurrentVersion\Setup"
$ValueName = "LogMask"
$ValueData = 0xFFFFFFFF
$ValueDataDEcimal = 4294967295

if (-Not (Test-Path $RegistryPath)) {
    New-Item -Path $RegistryPath -Force | Out-Null
}

Set-ItemProperty -Path $RegistryPath -Name $ValueName -Value $ValueData -Type DWord

$SetValue = Get-ItemProperty -Path $RegistryPath -Name $ValueName

if ($SetValue.LogMask -eq $ValueDataDEcimal) {
    Write-Output "Successfully set LogMask registry value to 0x$($ValueData.ToString('X'))"
} else {
    Write-Output "Failed to set LogMask registry value."
}
