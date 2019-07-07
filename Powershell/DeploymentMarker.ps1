
Function DPMARKER()
{
    

    $deployment = @{
        "revision" = $env:RELEASE_RELEASENAME
        "changelog" = $env:SYSTEM_DEFINITIONNAME
        "description" = $env:SYSTEM_DEFINITIONNAME
        "user" = $env:RELEASE_REQUESTEDFOREMAIL
    }

    $Body = @{
        "deployment" = $deployment
    }

    $JSON = $Body | convertto-json

    

    $header = @{

    "X-Api-Key" = $env:NewRelicAPIKey

    }

    $appid = $env:APPID

    Invoke-WebRequest  https://api.newrelic.com/v2/applications/$appid/deployments.json -Method POST -Headers $header -ContentType 'application/json' -Body $JSON 

}

DPMARKER
