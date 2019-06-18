


$revision = $env:RELEASE_RELEASENAME
$user = $env:RELEASE_REQUESTEDFOREMAIL 



$deployment = @{
    "revision" = $revision
    "changelog" = "some test"
    "description" = "some test"
    "user" = $user
}

$Body = @{
    "deployment" = $deployment
}

$JSON = $Body | convertto-json


$header = @{

"X-Api-Key" = $env:APIKey

}

$appid = $env:APPID

Invoke-WebRequest  https://api.newrelic.com/v2/applications/$appid/deployments.json -Method POST -Headers $header -ContentType 'application/json' -Body $JSON 


