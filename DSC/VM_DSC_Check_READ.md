VM_DSC_Check.ps1 파일을 Mof 파일로 컴파일<br>
컴파일은 Configuration 이름 또는 ..\VM_DSC_Check.ps1 or . D:\VM_DSC_Check.ps1<br>
Configuration 이름과 동일한 폴더가 생성되고, 폴더 내 파일 이름은 Node 이름으로 생성<br>
DSC 적용: Start-DscConfiguration -Path D:\FolderName -Verbose -Wait -Force<br>
적용 결과: Test-DscConfiguration ex)True or False return<br>
내용 확인: Get-Content -Path C:\Temp\ForlderName\localhost.txt<br>
