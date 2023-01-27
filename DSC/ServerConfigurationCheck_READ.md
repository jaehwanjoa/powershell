1. Get-WindowsFeature|Out-GridView 명령어로 Available되어있는 WindowsFeature list 확인. 코드에서는 'WINS'로 한정했음. 추가적으로 Display Name이 아니고, Name을 확인할 것
2. mof로 컴파일된 파일을 대상 서버에서 실행 ex)Start-DscConfiguration -Path D:\ForlderName -Verbose -Wait -Force
3. DSC configuration이 완료되면 대상 WindowsFeature가 installed로 설치되는 것을 확인할 수 있음
