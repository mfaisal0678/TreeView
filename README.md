# TreeView (Simple PowerShell Script to Display Folders Size)

PowerShell Script to Display Folders Size

You can replace C:\path\to\folder with the path of the directory you want to scan. The script uses the Get-ChildItem cmdlet to recursively retrieve all files and subfolders in the specified directory, and the ForEach-Object cmdlet to iterate through the items and calculate their total size. The size is displayed in megabytes (MB) for readability.

Also you can change the unit of size by changing the divisor in line 7 $( $_.Length / 1MB ) from MB to GB, KB or Bytes

You can also save the output in a file using the Out-File cmdlet like this;

Get-ChildItem -Recurse $folder | ForEach-Object {
    $size += $_.Length
    "$($_.FullName) - $( $_.Length / 1MB ) MB"
} | Out-File "c:\path\to\outputfile.txt"

# Save Output File

Keep in mind that if you want to use the above script to save the output in a file, you will have to use the Out-File cmdlet on the array of objects, like this:

$output | Out-File "c:\path\to\outputfile.txt"

