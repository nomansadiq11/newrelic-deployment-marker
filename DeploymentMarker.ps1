




Function Marker([string]$revision)
{
    Invoke-WebRequest -Uri https://api.newrelic.com/v2/applications/APPID/deployments.json -Method POST -Headers @{'X-Api-Key'='APIKey'} -ContentType 'application/json' -Body '{
        "deployment": {
        "revision": $revision,
        "changelog": "testing",
        "description": "testing",
        "user": "noman.sadiq@osn.com"
    }
    }'
}