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