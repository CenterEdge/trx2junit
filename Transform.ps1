Param(
    [System.IO.FileInfo]
    [Parameter(Mandatory = $true, Position = 1)]
    $InFile,

    [string]
    [Parameter(Mandatory = $true, Position = 2)]
    $OutFile
)

Add-Type -Assembly System.Xml

$xsl = New-Object System.Xml.Xsl.XslCompiledTransform
$xsl.Load((Join-Path $PSScriptRoot "mstest-to-junit.xsl"), (New-Object system.xml.xsl.XsltSettings), $null)

$document = New-Object System.Xml.XPath.XPathDocument $InFile.FullName

$writer = [System.Xml.XmlWriter]::Create($OutFile)
try {
    $xsl.Transform($document, $writer)
} finally {
    $writer.Close()
}
