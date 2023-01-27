configuration ServerConfigurationCheck
{
    Import-DscResource -ModuleName PSDesiredStateConfiguration
    Node localhost
    {
        WindowsFeatureSet WindowsFeatureSetExample
        {
            Name                    = @("WINS", "Web-Server")
            Ensure                  = 'Present'
            IncludeAllSubFeature    = $true
        }
    }
}
