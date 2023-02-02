[DSCLocalConfigurationManager()]
configuration LCMConfig
{
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

LCMConfig -OutputPath D:\ 
Set-DscLocalConfigurationManager -Path D:\ -ComputerName localhost -Verbose
