configuration ServerConfigurationCheck
{
    Import-DscResource -ModuleName PSDesiredStateConfiguration
    Node localhost
    {
        WindowsFeatureSet WindowsFeatureSetExample
        {
            Name                    = @("SMTP-Server", "Web-Server")
            Ensure                  = 'Present'
            IncludeAllSubFeature    = $true
        }
    }
}