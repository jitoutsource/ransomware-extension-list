$decryptreadme = (Invoke-WebRequest "https://raw.githubusercontent.com/jitoutsource/ransomware-extension-list/master/filename-exclusions").Content

$fileexts = (Invoke-WebRequest "https://raw.githubusercontent.com/jitoutsource/ransomware-extension-list/master/extension-list").Content

$filescreengroup = @()

foreach($line in $decryptreadme.Split("`r`n")){ if ($line -ne "") {$filescreengroup += $line} }
  foreach($line in $fileexts.Split("`r`n")){ if ($line -ne "") {$filescreengroup += $line} }

Get-FsrmFileGroup "Known Ransomware Files" | Set-FsrmFileGroup -IncludePattern $filescreengroup
