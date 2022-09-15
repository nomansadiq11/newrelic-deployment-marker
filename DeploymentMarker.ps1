
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
    [Net.ServicePointManager]::SecurityProtocol = "tls12, tls11" # TLS1.0 is deprecated from NewRelic incoming API calls.
    Invoke-RestMethod  https://api.newrelic.com/v2/applications/$appid/deployments.json -Method POST -Headers $header -ContentType 'application/json' -Body $JSON 

}

DPMARKER
