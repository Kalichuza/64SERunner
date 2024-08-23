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

        # Read the script content
        $scriptContent = Get-Content -Path $ScriptPath -Raw
        
        # Encode the script content
        $base64String = [Convert]::ToBase64String([System.Text.Encoding]::UTF8.GetBytes($scriptContent))
        
        # Generate the new file path with .64SE appended before the extension
        $encodedFilePath = [System.IO.Path]::ChangeExtension($ScriptPath, ".64SE" + [System.IO.Path]::GetExtension($ScriptPath))
        
        # Write the Base64 string to the new file
        [System.IO.File]::WriteAllText($encodedFilePath, $base64String)

        Write-Output "Encoded file created at $encodedFilePath"
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
        [string]$ScriptPath,

        [Parameter(Position = 1)]
        [hashtable]$ScriptArgs
    )

    process {
        if (-not (Test-Path $ScriptPath)) {
            Write-Error "Script not found: $ScriptPath"
            return
        }

        # Encode the script
        Encode-ScriptToBase64 -ScriptPath $ScriptPath

        # Generate the path for the encoded script with .64SE before the extension
        $encodedScriptPath = [System.IO.Path]::ChangeExtension($ScriptPath, ".64SE" + [System.IO.Path]::GetExtension($ScriptPath))

        # Read the Base64 encoded content
        $base64EncodedScript = Get-Content -Path $encodedScriptPath -Raw
        
        # Decode the Base64 string
        $decodedScript = [System.Text.Encoding]::UTF8.GetString([Convert]::FromBase64String($base64EncodedScript))

        # Prepare the arguments string
        $argsString = ""
        if ($ScriptArgs) {
            foreach ($key in $ScriptArgs.Keys) {
                $argsString += " -$key '$($ScriptArgs[$key])'"
            }
        }

        # Use Invoke-Command to run the decoded script with arguments
        Invoke-Command -ScriptBlock ([ScriptBlock]::Create($decodedScript)) -ArgumentList ($argsString.Split())
    }
}







# Exporting functions
Export-ModuleMember -Function Encode-ScriptToBase64, Run-Base64EncodedScript, EncodeAndRun-Script
