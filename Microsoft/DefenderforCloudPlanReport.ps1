# Requirement Install-Module -Name Az.Security -RequiredVersion 1.1.1

$subs = Get-AzSubscription 

#File name and File path
$filename = "ascreport" + "-" + (get-date).ToString('yyyy-MM-dd') + ".csv" 
$outputFile = "D:\temp\$filename"

# write out headers of CSV
$ascstring = "SubscriptionName,SubscriptionId,ServiceName,PricingTier,FreeTrialTimeRemaining"
$ascstring | Out-File $outputFile -append -Encoding utf8 -force

# For each subscription lookup the ASC Pricing information and 
ForEach ($sub in $subs) {

    # Set the current subscription context
    Set-AzContext -Subscription $sub.Id

    # get the asc pricing information for services on subscription
    $azsecprices = Get-AzSecurityPricing

    # for each asc service within subscription write the information into report
    foreach ($azsecprice in $azsecprices) {
        
        #Generate the string of data for the asc service and pricing information
        $ascstring = "$($sub.Name),$($sub.Id),$($azsecprice.Name),$($azsecprice.PricingTier),$($azsecprice.FreeTrialRemainingTime)"

        #Write into and append into output file
        $ascstring | Out-File $outputFile -append -Encoding utf8 -force
    }
}
