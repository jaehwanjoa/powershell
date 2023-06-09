function Unknown-AzureRole {
    [CmdletBinding()]
    param (
    	[parameter(Mandatory=$false)]
    	[String]$SignInName=(Read-Host "Enter a user SignInName ex)jaehwanjoa@domain.com")    
    )
	$roleassignment = Get-AzRoleAssignment | Where-Object {$_.ObjectType -eq "Unknown" -and $_.SignInName -notlike $SignInName}  
	
	ForEach ($roleList in $roleassignment){
        Remove-AzRoleAssignment -InputObject $roleList
    }
}