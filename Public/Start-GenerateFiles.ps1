function Start-GenerateFiles {

    $first = Read-Host "Sisesta eesnimi"
    $last  = Read-Host "Sisesta perekonnanimi"
    $path  = Read-Host "Sisesta sihtkaust (Enter = praegune)"

    if ([string]::IsNullOrWhiteSpace($path)) {
        $path = Get-Location
    }

    Write-Host "Kaust: $path"

    $folders = @(
        "Dokumendid","Minu failid","Projektid","Varukoopiad",
        "Pildid","Ajutised","Logid","Ülevaated","Arhiiv","Test"
    )

    $dirs = @()

    foreach ($f in $folders) {
        $d = Join-Path $path $f
        New-Item -ItemType Directory -Path $d -Force | Out-Null
        $dirs += $d
    }

    $rootCount = Get-Random -Minimum 10 -Maximum 30

    for ($i = 0; $i -lt $rootCount; $i++) {
        $file = New-FileName $first $last
        New-File $path $file (Get-Random -Minimum 1 -Maximum 5)
    }

    $totalFiles = Get-Random -Minimum 200 -Maximum 400

    for ($i = 0; $i -lt $totalFiles; $i++) {
        $dir = Get-Random $dirs
        $file = New-FileName $first $last
        New-File $dir $file (Get-Random -Minimum 1 -Maximum 5)
    }

    Write-Host "Valmis! Loodud $totalFiles faili."
}