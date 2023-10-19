# Download Azure Lighthouse ARM
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/Azure/Azure-Lighthouse-samples/master/templates/delegated-resource-management/subscription/subscription.json" -OutFile "git_subscription.json"
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/Azure/Azure-Lighthouse-samples/master/templates/delegated-resource-management/subscription/subscription.parameters.json" -OutFile "git_subscription_parameters.json"

# Select Managed Customer SubscriptionID
Set-AzContext -SubscriptionID "{SubscriptionID}"

# Deploy Azure Resource Manager template using template and parameter file locally
New-AzSubscriptionDeployment -Name TestLightHouse `
                 -Location koreacentral `
                 -TemplateFile <pathToTemplateFile> `
                 -Verbose

# Confirm successful onboarding for Azure Lighthouse 
Get-AzManagedServicesDefinition 
Get-AzManagedServicesAssignment
