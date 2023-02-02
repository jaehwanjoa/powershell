[DSCLocalConfigurationManager()]
configuration LCMConfig
{
#pram (
#[parameter(Mandatory=$true)]
#[string[]]$computername
#)
    Node localhost
    {
        Settings
        {
            ConfigurationMode = 'ApplyOnly'
#            ConfigurationModeFrequencyMins = 20
#            RebootNodeIfNeeded = $true

        }
    }
}

#$computername = 'RDC1', 'RDC2', 'RDC3'
LCMConfig -OutputPath D:\ 
#Set-DscLocalConfigurationManager -Path D:\ -ComputerName $computername -Verbose
Set-DscLocalConfigurationManager -Path D:\ -ComputerName localhost -Verbose
