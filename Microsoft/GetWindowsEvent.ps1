function Get-SecurityEvent {
    [CmdletBinding()]
    param (
        [ValidateNotNullOrEmpty()]
        [String[]]$ComputerName=$env:COMPUTERNAME
    )
    Begin{
        $EventID=Read-Host "이벤트 ID를 입력하세요."
        $Logname=Read-Host "로그 이름을 입력하세요 ex)Application or System or Security"
    }
    process{
        Get-EventLog -ComputerName $ComputerName -LogName $Logname | Where-Object EventID -eq $EventID | Select-Object -First 3 | Format-List
    }
    end{}
}
