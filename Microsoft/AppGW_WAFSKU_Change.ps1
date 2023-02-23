$sub = Get-AzSubscription
Set-AzContext -Subscription $sub.Id

$appgw = Get-AzApplicationGateway -Name ApplicationGatewayName -ResourceGroupName ResourceGroupName
$appgw.FirewallPolicy = $null
$appgw.Sku.Name = 'Standard_v2'
$appgw.Sku.Tier = 'Standard_v2'
$appgw.WebApplicationFirewallConfiguration = $null
$appgw.ForceFirewallPolicyAssociation =$true
$appgw.ForceFirewallPolicyAssociation = $true
Set-AzApplicationGateway -ApplicationGateway $appgw     
