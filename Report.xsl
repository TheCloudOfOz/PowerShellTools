<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" encoding="utf-8" indent="yes" />


<xsl:template match="/">
<xsl:text disable-output-escaping='yes'>&lt;!DOCTYPE html&gt;</xsl:text>
<html>
  <head>
      <meta charset="UTF-8"/>
      <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
      <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
      <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.11.1/js/jquery.dataTables.js"></script>
      <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.11.1/css/jquery.dataTables.css"/>
      <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.4.1/semantic.min.css"/>
      <title>Report</title>
  </head>
  <body>
    <h1>Running</h1>

    <table id="DataTable" class="display" style="width:100%">
      <thead>
        <tr>
          <xsl:for-each select="Objects/Object[1]/Property">
            <td><xsl:value-of select="@Name"/></td>
          </xsl:for-each>
        </tr>
      </thead>
      <tbody>
        <xsl:for-each select="Objects/Object">
        <tr>
          <xsl:for-each select="Property">
            <td><xsl:value-of select="."/></td>
          </xsl:for-each> 
        </tr>
        </xsl:for-each>
      </tbody>
    </table>
    <script>
      $(document).ready(function() {
          $('#DataTable').DataTable();
      } );
    </script>
  </body>
</html>
</xsl:template>

</xsl:stylesheet>

