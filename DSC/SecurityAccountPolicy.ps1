configuration AccountPolicies
{
    Import-DscResource -ModuleName SecurityPolicyDsc

    node localhost
    {
        AccountPolicy AccountPolicies
        {
            Name = 'PasswordPolicies'
            Enforce_password_history = 5
            Maximum_Password_Age = 90
#            Minimum_Password_Age = 1
            Minimum_Password_Length = 10
            Password_must_meet_complexity_requirements = 'Enabled'
#            Store_passwords_using_reversible_encryption = 'Disabled'

        }
    }
}

AccountPolicies -OutputPath D:\dsc 
Start-DscConfiguration -Path D:\dsc -Wait -Force -Verbose
