function New-FileName {
    param($FirstName, $LastName)

    $names = "andmed","aruanne","projekt","fail","logi"
    $ext = "txt","csv","json","log","md"

    $name = Get-Random $names
    $name += "_$FirstName_$LastName"
    $name += "."
    $name += Get-Random $ext

    return $name
}