#  This script enables the "Always Keep Memory Dump" feature in Windows
#  by setting the appropriate registry key.

#  Copyright (c) 2024 Red Hat, Inc. and/or its affiliates. All rights reserved.

#  Redistribution and use in source and binary forms, with or without
#  modification, are permitted provided that the following conditions
#  are met:
#  1. Redistributions of source code must retain the above copyright
#     notice, this list of conditions and the following disclaimer.
#  2. Redistributions in binary form must reproduce the above copyright
#     notice, this list of conditions and the following disclaimer in the
#     documentation and/or other materials provided with the distribution.
#  3. Neither the names of the copyright holders nor the names of their contributors
#     may be used to endorse or promote products derived from this software
#     without specific prior written permission.
#  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
#  ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
#  IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
#  ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDERS OR CONTRIBUTORS BE LIABLE
#  FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
#  DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
#  OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
#  HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
#  LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
#  OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
#  SUCH DAMAGE.


#  Ensure the script runs with an unrestricted execution policy (for Windows 10 and Windows Server 2016)
#  Set-ExecutionPolicy -ExecutionPolicy Unrestricted -Scope Process -Force

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
