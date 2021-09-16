using namespace System.Xml.Xsl

# On Server
[xml]$doc = Get-Service | Select-Object Name, DisplayName, Status | ConvertTo-Xml -NoTypeInformation
$xsl = $doc.CreateProcessingInstruction("xml-stylesheet","type='text/xsl' href='Report.xsl'");
$doc.InsertBefore($xsl,$doc.Objects);
$doc.Save('.\Service.xml');


# Html File Based Transformation

$XslCompiler = [XslCompiledTransform]::new();
$XslCompiler.Load("Report.xsl");
$XslCompiler.Transform("Service.xml",".\Service.html");
#$HtmlDocument | Out-File "Service.html"

