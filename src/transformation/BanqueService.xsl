<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" indent="yes"/>
	<xsl:template match="/BanqueService">
	<html>
            <head>
                <title>Liste des comptes</title>
            </head>
            <body>
               
                <h1>Liste des comptes</h1>
                <table border="1">
                    <tr>
                        <th>Code</th>
                        <th>Solde</th>
                        <th>Date de Création</th>
                    </tr>
                    <xsl:for-each select="getComptes">
            <tr>
              <td><xsl:value-of select="code"/></td>
              <td><xsl:value-of select="solde"/></td>
              <td><xsl:value-of select="dataCreation"/></td>
            </tr>
          </xsl:for-each>
        </table>
        <h1>Liste des comptes créés après 2000</h1>
                <table border="1">
                    <tr>
                        <th>Code</th>
                        <th>Solde</th>
                        <th>Date de Création</th>
                    </tr>
                    <xsl:for-each select="getComptes[substring(dataCreation, 1, 4)> 2000]">
            <tr>
              <td><xsl:value-of select="code"/></td>
              <td><xsl:value-of select="solde"/></td>
              <td><xsl:value-of select="dataCreation"/></td>
            </tr>
          </xsl:for-each>
        </table>
        
        <xsl:variable name="totalSolde" select="sum(getComptes/solde)" />
        <p>Somme totale des soldes : <xsl:value-of select="$totalSolde"/></p>
        <xsl:variable name="totalSoldeFiltré" select="sum(getComptes[number(substring(dataCreation, 1, 4)) > 2000]/solde)" />
        <p>Somme totale des soldes des comptes créés après 2000 : <xsl:value-of select="$totalSoldeFiltré"/></p>
               
            </body>
        </html>
	
		<!-- TODO: Auto-generated template -->
	</xsl:template>
	
</xsl:stylesheet>