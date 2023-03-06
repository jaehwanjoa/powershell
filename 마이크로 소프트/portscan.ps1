function Invoke-PortScan {
    <#
    .SYNOPSIS
    Scan IP-Addresses, Ports and HostNames
    .DESCRIPTION
    Scan for IP-Addresses, HostNames and open Ports in your Network.
    .PARAMETER StartAddress
    StartAddress Range
    .PARAMETER EndAddress
    EndAddress Range
    .PARAMETER ResolveHost
    Resolve HostName
    .PARAMETER ScanPort
    Perform a PortScan
    .PARAMETER Ports
    Ports That should be scanned, default values are: 21,22,23,53,69,71,80,98,110,139,111,
    389,443,445,1080,1433,2001,2049,3001,3128,5222,6667,6868,7777,7878,8080,1521,3306,3389,
    5801,5900,5555,5901
    .PARAMETER TimeOut
    Time (in MilliSeconds) before TimeOut, Default set to 100
    .EXAMPLE
    REGEX \b: match할 문자열의 경계를 입력 "\bcat\b" -> "cat"
    .EXAMPLE
    REGEX \d: 임의의 숫자 또는 임의의 문자를 지칭. 숫자만 한정하려면 [0-9]
    .EXAMPLE
    REGEX \.: 마침표를 의미함
    .EXAMPLE
    PS > Invoke-PortScan -StartAddress 192.168.0.1 -EndAddress 192.168.0.254 -ResolveHost -ScanPort
    Use above to do a port scan on default ports.
    .EXAMPLE
    PS > Invoke-PortScan -StartAddress 192.168.0.1 -EndAddress 192.168.0.254 -ResolveHost -ScanPort -TimeOut 500
    .EXAMPLE
    PS > Invoke-PortScan -StartAddress 192.168.0.1 -EndAddress 192.168.10.254 -ResolveHost -ScanPort -Port 80
    .LINK
    https://github.com/jaehwanjoa/powershell/tree/subdir01/Microsoft
    #>
        [CmdletBinding()] Param(
            [parameter(Mandatory = $true, Position = 0)]
            [ValidatePattern("\b\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}\b")]
            [string]
            $StartAddress,
    
            [parameter(Mandatory = $true, Position = 1)]
            [ValidatePattern("\b\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}\b")]
            [string]
            $EndAddress,

            [string]
            $LogPath = "D:\temp\PortScan" + "-" + (Get-Date).ToString('yyyy-MM-dd') + ".txt",
            
            [switch]
            $ResolveHost,
    
            [switch]
            $ScanPort,
    
            [int[]]
            #$Ports = @(21,22,23,53,69,71,80,98,110,139,111,389,443,445,1080,1433,2001,2049,3001,3128,5222,6667,6868,7777,7878,8080,1521,3306,3389,5801,5900,5555,5901),
            $Ports = @(1..10000),

            [int]
            $TimeOut = 100
        )  
        Begin {
        $ping = New-Object System.Net.Networkinformation.Ping
        }
        Process {
        foreach($a in ($StartAddress.Split(".")[0]..$EndAddress.Split(".")[0])) {
            foreach($b in ($StartAddress.Split(".")[1]..$EndAddress.Split(".")[1])) {
            foreach($c in ($StartAddress.Split(".")[2]..$EndAddress.Split(".")[2])) {
                foreach($d in ($StartAddress.Split(".")[3]..$EndAddress.Split(".")[3])) {
                write-progress -activity PingSweep -status "$a.$b.$c.$d" -percentcomplete (($d/($EndAddress.Split(".")[3])) * 100)
                $pingStatus = $ping.Send("$a.$b.$c.$d",$TimeOut)
                if($pingStatus.Status -eq "Success") {
                    if($ResolveHost) {
                    write-progress -activity ResolveHost -status "$a.$b.$c.$d" -percentcomplete (($d/($EndAddress.Split(".")[3])) * 100) -Id 1
                    $getHostEntry = [Net.DNS]::BeginGetHostEntry($pingStatus.Address, $null, $null)
                    }
                    if($ScanPort) {
                    $openPorts = @()
                    for($i = 1; $i -le $ports.Count;$i++) {
                        $port = $Ports[($i-1)]
                        write-progress -activity PortScan -status "$a.$b.$c.$d" -percentcomplete (($i/($Ports.Count)) * 100) -Id 2
                        $client = New-Object System.Net.Sockets.TcpClient
                        $beginConnect = $client.BeginConnect($pingStatus.Address,$port,$null,$null)
                        if($client.Connected) {
                        $openPorts += $port
                        } else {
                        # Wait
                        Start-Sleep -Milli $TimeOut
                        if($client.Connected) {
                            $openPorts += $port
                        }
                        }
                        $client.Close()
                    }
                    }
                    if($ResolveHost) {
                    $hostName = ([Net.DNS]::EndGetHostEntry([IAsyncResult]$getHostEntry)).HostName
                    } 
                    # Return Object
                    New-Object PSObject -Property @{
                    IPAddress = "$a.$b.$c.$d";
                    HostName = $hostName;
                    Ports = $openPorts
                    } | Format-List -Propert * | Out-File $LogPath -Force
                } Write-Host "Port Scan Success!! Check File $LogPath"
                }
            }
            }
        }
        }
        End {
        }
    }
    
    
