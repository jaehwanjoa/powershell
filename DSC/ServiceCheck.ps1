Configuration ServiceCheck
{
    param
    (
        [parameter(Mandatory)]
        [String]
        $ServiceName,
        [ValidateSet("Running","Stopped")]
        [String]
        $State="Running",
        [String]
        $ComputerName="localhost"
    )

    # It is best practice to explicitly import any required resources or modules.
    Import-DSCResource -ModuleName PSDesiredStateConfiguration

    Node $ComputerName
    {
        Service $ServiceName
        {
            Name = $ServiceName
            State = $State
        }
    }
}

ServiceCheck -OutputPath D:\dsc 
Start-DscConfiguration -Path D:\dsc -Wait -Force -Verbose
