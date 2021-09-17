using namespace System.Xml.Xsl
#using namespace System.Xml.Linq

# On Server
[xml]$doc = Get-Command | Select-Object Name, ModuleName | ConvertTo-Xml -NoTypeInformation

$xsl = $doc.CreateProcessingInstruction("xml-stylesheet","type='text/xsl' href='Report.xsl'");
$doc.InsertBefore($xsl,$doc.Objects);

$title = $doc.CreateAttribute("Title");
$title.Value = "Report Header";
$doc.Objects.Attributes.Append($title);
$doc.Save('.\Command.xml');


# Html File Based Transformation

$XslCompiler = [XslCompiledTransform]::new();
$XslCompiler.Load("Report.xsl");
New-Item -ItemType File -Path ".\Service.html" -Name "Service.html"
$XslCompiler.Transform("Service.xml",".\Service.html");
#$HtmlDocument | Out-File "Service.html"

