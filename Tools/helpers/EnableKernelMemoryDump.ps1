$RegistryPath = "HKLM:\System\CurrentControlSet\Control\CrashControl"
$ValueName = "AlwaysKeepMemoryDump"
$ValueData = 1

if (-Not (Test-Path $RegistryPath)) {
    New-Item -Path $RegistryPath -Force | Out-Null
}

Set-ItemProperty -Path $RegistryPath -Name $ValueName -Value $ValueData -Type DWord

$SetValue = Get-ItemProperty -Path $RegistryPath -Name $ValueName

if ($SetValue.AlwaysKeepMemoryDump -eq $ValueData) {
    Write-Output "Successfully set AlwaysKeepMemoryDump registry value  to $ValueData"
} else {
    Write-Output "Failed to set AlwaysKeepMemoryDump registry value."
}
