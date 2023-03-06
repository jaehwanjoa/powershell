function SecurityEvent {
    <#
    .synopsis
    이 파일은 Windows 이벤트 로깅 펑션 파일입니다.
    .description
    1. 이벤트ID를 입력합니다. 이벤트ID는 'eventviewer'에서 조회할 수 있습니다. 2. Application or System or Security 로그를 선택합니다.
    .parameter $ComputerName
    $env:COMPUTERNAME은 로컬 컴퓨터 네임으로 자동 변환됩니다.
    .example
    'SecurityEvent'라고 커멘드를 입력하면 자동으로 실행됩니다. *Log type이 Security인 경우 특별한 권한이 필요함
    #>
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
