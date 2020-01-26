[CmdletBinding()] 
param() 
 
Trace-VstsEnteringInvocation $MyInvocation 
try { 
    
    
    # Get inputs. 
    $APIKey = Get-VstsInput -Name 'APIKey' -Require 
    $APPID = Get-VstsInput -Name 'APPID' -Require 
    $Revision = Get-VstsInput -Name 'Revision' -Require 
    $changelog = Get-VstsInput -Name 'changelog' -Require 
    $description = Get-VstsInput -Name 'description' -Require 


    $deployment = @{
        "revision" = $Revision
        "changelog" = $changelog
        "description" = $description
        "user" = $env:RELEASE_REQUESTEDFOREMAIL
    }

    $Body = @{
        "deployment" = $deployment
    }

    $JSON = $Body | convertto-json

    

    $header = @{

    "X-Api-Key" = $APIKey

    }

    $appid = $APPID
    [Net.ServicePointManager]::SecurityProtocol = "tls12, tls11" # TLS1.0 is deprecated from NewRelic incoming API calls.
    Invoke-WebRequest  https://api.newrelic.com/v2/applications/$appid/deployments.json -Method POST -Headers $header -ContentType 'application/json' -Body $JSON 
     
    



} finally { 
    Trace-VstsLeavingInvocation $MyInvocation 
}