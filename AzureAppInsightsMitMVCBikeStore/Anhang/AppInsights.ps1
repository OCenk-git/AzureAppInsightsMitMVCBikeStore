#Zufallszahl & Variablen
$random = Get-Random -Maximum 1000 -Minimum 100
$groupname = "aigroup"+$random
$ainame = "myAppIns"+$random


#Gruppe createn
az group create -n $groupname

#Application Insights anlegen
az extension add -n application-insights

az monitor app-insights component create -g $groupname -l westeurope --app $ainame --kind web

#Alle Application Insights Instanzen auflisten
#az monitor app-insights component show -o table#Nur Key$inskey = (az monitor app-insights component show --query [].instrumentationKey --output tsv -g $groupname)
#App Service
$planname = "appplan"+$random

az appservice plan create --name $planname -g $groupname --sku F1

$appname = "appname"+$random

#SQL
$adminuser = "admin0623"$adminpw = "Test123!"$sqlserver = "mysqlserver2"+$random
$dbname = "BikeStores"
az sql server create --resource-group $groupname --name $sqlserver --admin-user $adminuser --admin-password $adminpwaz sql server firewall-rule create -g $groupname -s $sqlserver --name AllowMyOwnIp --start-ip-address 93.202.75.51 --end-ip-address 93.202.75.119az sql db create -g $groupname -s $sqlserver --name $dbname --service-objective S0az sql db show-connection-string -s $sqlserver -n $dbname -c ado.net$sqlconnstring = "Server=tcp:mysqlserver2641.database.windows.net,1433;Initial Catalog=BikeStores;Persist Security Info=False;User ID=admin0623;Password=Test123!;MultipleActiveResultSets=False;Encrypt=true;TrustServerCertificate=False;Connection Timeout=30;"

#in den Pfad der Anwendung...
az webapp up -g $groupname -p $planname -n $appname --launch-browser --logs --sku f1
az webapp browse --name $appname -g $groupname

#prüfen
az appservice plan list -o table