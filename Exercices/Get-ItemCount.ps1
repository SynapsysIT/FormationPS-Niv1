﻿function Get-ItemCount 
{
    [CmdletBinding()]
    param 
    (
        [Parameter(mandatory = $true)]
        [string]$Folder
    )

    $List = Get-ChildItem $Folder -Recurse

    $Directory = $List | Where-Object { $_.Mode -like "d*" }
    $FileExe = $List | Where-Object { $_.Extension -eq ".exe" }
    $FileNotExe = $List | Where-Object { ($_.Extension -ne ".exe") -AND ($_.mode -like "-a*") }

    $result = [PSCustomObject]@{
        Directory = $Directory.Count
        Exe       = $FileExe.Count
        PAsExe    = $FileNotExe.Count 
    }
    return $result
}

