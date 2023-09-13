$global:__aliases = @{
#ri                             = "Remove-Item"      
diff                           = "Compare-Object"   
#echo                           = "Write-Output"     
kill                           = "Stop-Process"     
ps                             = "Get-Process"      
tee                            = "Tee-Object"       
type                           = "Get-Content"      
ac                             = "Add-Content"      
rm                             = "Remove-Item"      
write                          = "Write-Output"     
rmdir                          = "Remove-Item"      
clear                          = "Clear-Host"       
mount                          = "New-PSDrive"
man                            = "help"             
#cd                             = "Set-Location"     
#fc                             = "Format-Custom"    
cpp                            = "Copy-ItemProperty"
sort                           = "Sort-Object"      
cat                            = "Get-Content"      
cp                             = "Copy-Item"        
sleep                          = "Start-Sleep"      
ls                             = "Get-ChildItem"    
pwd                            = "Get-Location"     
mv                             = "Move-Item" 
}
function Set-PSAliases
{
    $global:__aliases.Keys | % { 
        Set-Alias $_ $global:__aliases[$_] -Scope Global 
    }  
}
Set-PSAliases

function Invoke-LastCommand {
	[CmdletBinding()]
	param(
	[int]$N = -1
)
	(h)[$N].CommandLine | iex
}
sal l invoke-lastcommand
1..10 | % {
    $FunctionName = "c$_"
    $ScriptBlock = "Set-Location $('..\' * $_)"
    $FunctionDefinition = @"
Function $FunctionName {
    $ScriptBlock
}
"@
    Invoke-Expression $FunctionDefinition
}
function .. {
    Set-Location ..
}
