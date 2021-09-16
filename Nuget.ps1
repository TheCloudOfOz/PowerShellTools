using namespace System.IO
#using namespace System.IO.Compression

# $Parameters = @{
#     Path        = '.\Packages'
#     ErrorAction = 'SilentlyContinue'
# }

foreach ($package in (Get-ChildItem -Path '.\Packages' -Filter '*.nupkg' -ErrorAction SilentlyContinue)) {
    $package | Rename-Item -NewName ([IO.Path]::ChangeExtension($package.Name, 'zip'))
}

foreach ($zip in (Get-ChildItem -Path '.\Packages' -Filter '*.zip' -ErrorAction SilentlyContinue)) {
    $zip | Expand-Archive -DestinationPath ".\Packages\$($zip.BaseName)"
}
