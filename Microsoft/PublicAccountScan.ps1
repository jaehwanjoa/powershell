Function Get-PublicAccountScan {
    <#
    .SYNOPSIS
    Azure Storage Account Scan(blop, Container)
    .DESCRIPTION
    Scan for Azure Storage Account(blop, Container) in your Azure Subscriptions.
    .EXAMPLE
    Get-PublicAccountScan
    .EXAMPLE
    출력 결과 txt 저장: Get-PublicAccountScan | Out-File D:\temp\PublicAccountScan.txt
    #> 
    $AllSubscription = Get-AzSubscription | Select-Object -ExcludeProperty Name | Select-Object -ExpandProperty SubscriptionId
    $SubList = @{
        Name = $AllSubscription
    }
    
    ForEach ($Subscription in $SubList.Name){
        $defaultSub = Set-AzContext -SubscriptionID $Subscription
        $StorageAccounts = Get-AzStorageAccount
        Foreach ($StorageAccount in $StorageAccounts) {
            $RGname = $StorageAccount.ResourceGroupName
            $SAname = $StorageAccount.StorageAccountName
            $SubscriptionName =  $defaultSub.Subscription| Select-Object Name
            $Containers = Get-AzRmStorageContainer -ResourceGroupName $RGname -StorageAccountName $SAname
            ForEach ($Container in $Containers) {
                If ($Container.PublicAccess -eq "Blob" -or $Container.PublicAccess -eq "Container") {
                    $Container | Select-Object Name, PublicAccess, LastModifiedTime, StorageAccountNAme, @{l="Subscription";e={$SubscriptionName.Name}}
                }
            }
         }
    }
}
