param (
	[string]$name,
	[string]$lambda
)
function ZipFiles( $zipfilename, $sourcedir )
{
	Add-Type -Assembly System.IO.Compression.FileSystem
	$compressionLevel = [System.IO.Compression.CompressionLevel]::Optimal
	[System.IO.Compression.ZipFile]::CreateFromDirectory($sourcedir, $zipfilename, $compressionLevel, $false)
}

if(!$name){
	Write-Error "No name specified."
	exit
}
if(!$lambda){
	Write-Error "No Lambda function specified."
	exit
}

Write-Progress -Activity "Zipping code..."

$dir=(pwd).Path
$UUID = [guid]::NewGuid().Guid
$Temp = (Get-ChildItem Env:Temp).Value

$zipfile = "$Temp\$UUID.zip"
if(Test-Path $zipfile){
	rm $zipfile.zip
}
ZipFiles $zipfile $dir

$output = "$dir\$name.zip"
if(Test-Path $output){
	rm $output
}

mv $zipfile $output

Write-Progress -Activity "Uploading code to Lambda..."
aws lambda update-function-code --function-name $lambda --zip-file fileb://$output
echo "Done"
