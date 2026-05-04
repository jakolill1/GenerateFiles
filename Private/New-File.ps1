function New-File {
    param(
        $Folder,
        $Name,
        $SizeKB
    )

    $path = Join-Path $Folder $Name
    $content = New-Content -SizeKB $SizeKB
    Set-Content -Path $path -Value $content -Encoding UTF8
}