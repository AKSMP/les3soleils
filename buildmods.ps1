$prevPwd = $PWD

function buildAndMove([string]$name, [string]$nameFilter = "*all.jar") {
  $modDir = "build/$name"
  $process = Start-Process -FilePath ".\gradlew.bat" -ArgumentList "build" -Wait -NoNewWindow -PassThru
  if($process.ExitCode != 0) {
    Write-Error "Couldn't build mod: $name"
    exit 1
  }
  $fileName = ""
  if($nameFilter -ne "*all.jar") {
    $fileName = $nameFilter
  } else {
    $fileName = "$name$nameFilter"
  }
  $file = (Get-Item "$fileName")
  if($file.Length -eq 0) {
    Write-Error "Couldn't find jar '$fileName' for mod: $name"
    exit 2
  }
  cp "build/libs/$fileName" ../../mods/
  Write-Host "Built $name"
}

try {
  buildAndMove("trackwork")
} finally {
  cd $prevPwd
}
