$sub - Get-AzSubscription
Set-AzContext -Subscription $sub.Id

$appGateway = Get-AzApplicationGateway -Name ApplicationGatewayName -ResourceGroupName ResourceGroupName
Start-AzApplicationGateway -ApplicationGateway $appGateway
# Stop-AzApplicationGateway -ApplicationGateway $appGateway
