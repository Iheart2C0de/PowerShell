#REST Setup
#user="svc.api.ars_dev"
#$user="svc.api.ars_test"
$user="svc.api.Uipath_dev"
$pass='rqjh:S?C+XQWU3<Hns**<Ubau2}0bIxo-Bk:T#H+'
#$pass=''
#$pass=Get-Content 'D:\Mark\PROD_Scheduled_Tasks\SNOW_Account_Creation\securestring.txt' | ConvertTo-SecureString | ConvertFrom-SecureString -AsPlainText
$userAgent="SNOW-api-powershell"

#Build auth header
$base64AuthInfo=[Convert]::ToBase64String([Text.Encoding]::ASCII.GetBytes(("{0}:{1}" -f $user, $pass)))

#Set proper headers
$headers=New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
$headers.Add('Authorization',('Basic {0}' -f $base64AuthInfo))
$headers.Add('Accept','application/json')

#Specify endpoint uri
#$uri=https://vcccdev.vita.virginia.gov/api/now/table/u_new_user_onboarding
#$uri=https://vccctest.vita.virginia.gov/api/now/table/u_new_user_onboarding
$uri="https://vcccdev.vita.virginia.gov/api/now/table/alm_entitlement_user"
$Result=(Invoke-RestMethod -Uri $uri -Method GET -Headers $headers -UserAgent $userAgent).result 
