function New-Content {
    param([int]$SizeKB)

    $size = $SizeKB * 1024
    $chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789 õäöüÕÄÖÜ `n"

    -join (1..$size | ForEach-Object {
        $chars[(Get-Random -Minimum 0 -Maximum $chars.Length)]
    })
}