Get-Service 명령어로 컴퓨터내 실행 중인 프로세스 확인<br>
Get-Service -Name xxx | Select-Object -Propert * 로 Stopped 상태인 특정 프로세스의 속성 확인<br>
ServiceCheck DSC를 실행하여 Stopped 상태인 프로세스를 Running 상태로 변경
