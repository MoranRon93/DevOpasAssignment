
$Location = 'eastus'
$ResourceGroup = 'morans-storage'
$StorageAccountName = 'moransstorage1'
$StorageAccount = Get-AzStorageAccount -ResourceGroupName $ResourceGroup -Name $StorageAccountName
$Ctx = $StorageAccount.Context
$ContainerName = 'morancontainer'
for ($num = 1 ; $num -le 100 ; $num++){
    New-AzStorageContainer -Name (-join($ContainerName, $num)) -Context $Ctx -Permission Blob
    $Blob = @{
    File             = 'C:\temp\'+$num+'.txt'
    Container        = $ContainerName
    Blob             = "$num.txt"
    Context          = $Ctx
    StandardBlobTier = 'Hot'
  }
  Set-AzStorageBlobContent @Blob
}
