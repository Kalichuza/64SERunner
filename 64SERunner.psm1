# 64SERunner.psm1

function Encode-ScriptToBase64 {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true, Position = 0)]
        [string]$ScriptPath
    )

    process {
        if (-not (Test-Path $ScriptPath)) {
            Write-Error "Script not found: $ScriptPath"
            return
        }

        # Use 64SE to encode the script to Base64
        Import-Module 64SE
        Encode-FileToBase64 -FilePath $ScriptPath
    }
}

function Run-Base64EncodedScript {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true, Position = 0)]
        [string]$EncodedScriptPath
    )

    process {
        if (-not (Test-Path $EncodedScriptPath)) {
            Write-Error "Encoded script file not found: $EncodedScriptPath"
            return
        }

        # Read the Base64 encoded content
        $base64EncodedScript = Get-Content -Path $EncodedScriptPath -Raw
        
        # Decode the Base64 string
        $decodedScript = [System.Text.Encoding]::UTF8.GetString([Convert]::FromBase64String($base64EncodedScript))

        # Run the decoded script
        Invoke-Expression $decodedScript
    }
}

function EncodeAndRun-Script {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true, Position = 0)]
        [string]$ScriptPath
    )

    process {
        if (-not (Test-Path $ScriptPath)) {
            Write-Error "Script not found: $ScriptPath"
            return
        }

        # Encode the script
        Encode-ScriptToBase64 -ScriptPath $ScriptPath

        # Generate the path for the encoded script
        $encodedScriptPath = "$ScriptPath.64SE"

        # Run the encoded script
        Run-Base64EncodedScript -EncodedScriptPath $encodedScriptPath
    }
}

# Exporting functions
Export-ModuleMember -Function Encode-ScriptToBase64, Run-Base64EncodedScript, EncodeAndRun-Script
