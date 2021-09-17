using assembly System.Xml.Linq 
using namespace System.Xml.Linq 
 
$xDocument = [XDocument]::new( 
    [XDeclaration]::new('1.0', 'utf-8', 'yes'), 
    [XElement]::new('list', @( 
        [XAttribute]::new('type', 'numbers'), 
        [XElement]::new('name', 1), 
        [XElement]::new('name', 2), 
        [XElement]::new('name', 3) 
    )) 
);

$xDocument.Save(".\XDocument.xml")

$xDocument.Element("list").Attribute("type").Value