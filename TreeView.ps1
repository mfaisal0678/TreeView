$folder = 'C:\Program Files (x86)'
$size = 0
$decimalPlaces = 2

$output = @()

Get-ChildItem -Directory $folder | ForEach-Object {
    $size += (Get-ChildItem -Recurse $_.FullName | Measure-Object -Property Length -Sum).Sum
    $output += New-Object PSObject -Property @{
        Folder = $_.FullName
        Size = "{0:N$decimalPlaces} MB" -f ((Get-ChildItem -Recurse $_.FullName | Measure-Object -Property Length -Sum).Sum / 1MB)
    }
}

$output | Out-GridView #Format-Table -AutoSize

"Total size: {0:N$decimalPlaces} MB" -f ($size / 1MB)
