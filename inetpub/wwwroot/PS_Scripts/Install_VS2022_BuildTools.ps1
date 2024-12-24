#Do the initial installation from the web hosted layout onto the client in an elevated PowerShell script
    
    #ADMIN CONFIGURATION
    #Enter layout URI here
    $LayoutUri = "C:\VS2022\BuildTools"

    #Enter bootstrapper name which is present in layout.
    $BootstrapperName = "vs_BuildTools.exe"

    #Add any arguments which you intend to send to bootstrapper.
    $Arguments = "--all --IncludeRecommended --IncludeOptional --downloadThenInstall --noWeb"

    #SCRIPT FUNCTIONALITY
    #Forming URI for bootstrapper
    Write-Verbose "LayoutUri: $LayoutUri"
    $BootstrapperUri = "$LayoutUri\$BootstrapperName"
    Write-Verbose "BootstrapperUri: $BootstrapperUri"
    
    $Arguments += " --layoutUri $LayoutUri"
    Write-Verbose "Arguments: $Arguments"

    #Creating temp folder and download bootstrapper
    #NOTE - You only get one shot per install per foldername so I get a random folder name for multiple installs...
    $TempFolderName = [System.IO.Path]::GetFileNameWithoutExtension([System.IO.Path]::GetRandomFileName())
    $VSLayoutFolderPath = Join-Path -Path $env:TEMP -ChildPath $TempFolderName
    $BootstrapperFile = Join-Path -Path $VSLayoutFolderPath -ChildPath $BootstrapperName
    Write-Verbose "The bootstrapper path is: $BootstrapperFile"

    if (Test-Path $VSLayoutFolderPath)
    {
    Write-Verbose "The directory exists - $VSLayoutFolderPath"
    if (Test-Path $BootstrapperFile)
    {
    Write-Verbose "Deleting file - $BootstrapperFile"
    Remove-Item $BootstrapperFile
    }
    }
    else
    {
    Write-Verbose "Creating folder - $VSLayoutFolderPath"
    New-Item -ItemType Directory -Path $VSLayoutFolderPath
    }

    Write-Verbose "Downloading bootstrapper from - $BootstrapperUri to $BootstrapperFile"
    Invoke-WebRequest -Uri $BootstrapperUri -OutFile $BootstrapperFile
    
    Write-Verbose "Starting bootstrapper -$BootstrapperFile with arguments $Arguments"
    start-process $BootstrapperFile $Arguments
# SIG # Begin signature block
# MIIFnQYJKoZIhvcNAQcCoIIFjjCCBYoCAQExCzAJBgUrDgMCGgUAMGkGCisGAQQB
# gjcCAQSgWzBZMDQGCisGAQQBgjcCAR4wJgIDAQAABBAfzDtgWUsITrck0sYpfvNR
# AgEAAgEAAgEAAgEAAgEAMCEwCQYFKw4DAhoFAAQUF/7cASI48FcwF9QmxakVIMTT
# QvigggMoMIIDJDCCAgygAwIBAgIQeMF2K6jRYYZCqmsh/6JpDzANBgkqhkiG9w0B
# AQsFADAqMSgwJgYDVQQDDB9WaXN1YWwgU3R1ZGlvIDIwMjIgU2lnbmluZyBDZXJ0
# MB4XDTI0MTAxMTA1MjEwNFoXDTI1MTAxMTA1NDEwNFowKjEoMCYGA1UEAwwfVmlz
# dWFsIFN0dWRpbyAyMDIyIFNpZ25pbmcgQ2VydDCCASIwDQYJKoZIhvcNAQEBBQAD
# ggEPADCCAQoCggEBAMZvI7WF7wVwNpihI9zoo/WoN8ltfKI1QqXEoetP0jW7rqK5
# Rzn/m1H3zK3E8CiW+Gs3A0ko8Lwlgnbxdsak8RfwowATV8glPOZtGiG2LtT0U9Fl
# sPzkUQ9E+My3crSr7AgH46KMFFEbt77ZqRuyamGqnJHQSt4ifVcR2IvTPu/nRwww
# 8BIHdz7+mkoVdq00LQ7WrBjcpyvqjTTUQ5XHAbmpTxRh7K+1DdEEm+O2X5xUXZIU
# XoBpT40/e1736p/bk5K/1KumcOH1Bb+pJdCpo1wvnMht+DJtRwV2nSYV2GlGV+AG
# DwMzA/j6UILF1A9bfhwFDA0N443XFWpaPj1Bg1kCAwEAAaNGMEQwDgYDVR0PAQH/
# BAQDAgeAMBMGA1UdJQQMMAoGCCsGAQUFBwMDMB0GA1UdDgQWBBS0f9cL7etin6xR
# 9fNuepEmq+O4LzANBgkqhkiG9w0BAQsFAAOCAQEAjDui9MnPWzI7bV01WowmdPfk
# TDACtEHGYedbAfVtkBjS3ZE4Whp/ekuqL8NrjuwZiBGi1pOCuO/h1ZQ1BTCKA+jw
# sx/RCJ0WosDu8GmsZwjg5b8L2WFQn08ZleoTKlJMKDeTououReGzygQmjNi6Ctg5
# 4tX6hVW/1W0e9DazTzkJCo6ja8dTlZ6M+R+DMof4xzAtdLRNOF6nNsxGHmx6HGfl
# q3v+Qe9aJug4Lr/vehAFXLOx28KzuwvFm2mm3PUMQqGqgwScvDj3oLbU7jo1mdIw
# bSpweJzYRqIv0MjaM9r8WzX64vqsqu6RRCkdcHocIY2s8p0gRKz6yblCLHaYsjGC
# Ad8wggHbAgEBMD4wKjEoMCYGA1UEAwwfVmlzdWFsIFN0dWRpbyAyMDIyIFNpZ25p
# bmcgQ2VydAIQeMF2K6jRYYZCqmsh/6JpDzAJBgUrDgMCGgUAoHgwGAYKKwYBBAGC
# NwIBDDEKMAigAoAAoQKAADAZBgkqhkiG9w0BCQMxDAYKKwYBBAGCNwIBBDAcBgor
# BgEEAYI3AgELMQ4wDAYKKwYBBAGCNwIBFTAjBgkqhkiG9w0BCQQxFgQU94ukORDz
# XIeu7VOU5exU6f/hZnowDQYJKoZIhvcNAQEBBQAEggEAAtN8nt5sdcgfAq/HqXl6
# ldHBvd9GUdHUBScpFK0WvuGmcTqdUkm3kx3EH9KIowUnukRg0s6c6dQbsTlEGkHT
# 8QI3k6f2h75l93K2RCNp4Z0kiUdaA3yfcv3OCyS4pzvPwqFL9iwojnPNFxH3ubjc
# TjAGZ7Didy+7BwZnNCqDmquMV3WGdxfPVPKnpSzVTFCvvSJQE2Uuf3FCMZAjhjMR
# sOnK2zAgPjc6TLOWtjl4F79nAng9KCR0z68ykSuiCBxaEGgsClFTdhlTTjW3uDuT
# wNxbo7qW1YYtveEkCxmq8zprKdGnFyWsGRBgKUCByGHpaUY8HckB/IZ3Exb6wA8C
# MQ==
# SIG # End signature block
