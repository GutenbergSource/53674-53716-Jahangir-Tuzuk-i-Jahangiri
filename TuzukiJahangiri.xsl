<!DOCTYPE xsl:stylesheet [

    <!ENTITY aacute "&#x00E1;">
    <!ENTITY amacr "&#x0101;">
    <!ENTITY euml "&#x00EB;">
    <!ENTITY imacr "&#x012B;">
    <!ENTITY mdash "&#x2014;">
    <!ENTITY ndash "&#x2013;">
    <!ENTITY tdotb "&#x1E6D;">
    <!ENTITY umacr "&#x016B;">

]>
<xsl:transform
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:f="urn:stylesheet-functions"
    exclude-result-prefixes="f xs"
    version="2.0">


<xsl:include href="../../../../../Tools/tei2html/merge-documents.xsl"/>


<xsl:variable name="volume1" select="f:import-document('Volume 1/TuzukiJahangiri1.xml', /, 'v1', 'v2')"/>
<xsl:variable name="volume2" select="f:import-document('Volume 2/TuzukiJahangiri2.xml', /, 'v2', 'v1')"/>


<xsl:template match="/">
    <TEI.2 lang="en">
    <teiHeader>
        <fileDesc>
            <titleStmt>
                <title>The T&umacr;zuk-i-Jah&amacr;ng&imacr;r&imacr;, Or: Memoirs of Jah&amacr;ng&imacr;r</title>
                <author>Jah&amacr;ng&imacr;r</author>
                <respStmt><resp>Translator</resp> <name>Alexander Rogers</name></respStmt>
                <respStmt><resp>Editor</resp> <name>Henry Beveridge</name></respStmt>
                <respStmt><resp>Transcription</resp> <name>Jeroen Hellingman</name></respStmt>
            </titleStmt>
            <publicationStmt>
                <publisher>Project Gutenberg</publisher>
                <pubPlace>Urbana, Illinois, USA.</pubPlace>
                <idno type="LCCN">#####</idno>
                <idno type="OLW">#####</idno>
                <idno type="OCLC">#####</idno>
                <idno type="PGclearance">20070331064334roger</idno>
                <idno type="epub-id">urn:uuid:8829ee43-1c0c-4217-b1e4-34e380aaecc5</idno>
                <idno type="PGnum">#####</idno>
                <date>#####</date>

                <xsl:apply-templates select="$volume1//teiHeader/fileDesc/publicationStmt/availability"/>

            </publicationStmt>
            <sourceDesc>
                <bibl>
                <author>Jah&amacr;ng&imacr;r</author>
                <title>The T&umacr;zuk-i-Jah&amacr;ng&imacr;r&imacr;, Or: Memoirs of Jah&amacr;ng&imacr;r</title>
                <date>1909&ndash;1914</date>
                </bibl>
            </sourceDesc>
        </fileDesc>

        <xsl:apply-templates select="$volume1//teiHeader/encodingDesc"/>
        <xsl:apply-templates select="$volume1//teiHeader/profileDesc"/>

        <revisionDesc>
            <list type="simple">
                <item>2012-09-04 started.</item>
            </list>
        </revisionDesc>
    </teiHeader>
    <text>
        <front id="frontmatter">
            <div1 id="cover" type="Cover">
                <p>
                    <figure id="cover-image" rend="image(images/new-cover.jpg)">
                        <figDesc>Newly Designed Front Cover.</figDesc>
                    </figure>
                </p>
            </div1>

            <xsl:apply-templates select="$volume1//front/div1[@id='v1titlepage']"/>
            <xsl:apply-templates select="$volume1//front/titlePage"/>
            <xsl:apply-templates select="$volume1//front/div1[@id='v1copyright' or @id='v1preface']"/>

            <div1 id="toc" type="Contents">
                <head>Contents</head>

                <div2 type="Contents">
                    <head>Volume I.</head>
                    <xsl:apply-templates select="$volume1//front/div1[@id='v1toc']/*[not(self::head)]"/>
                </div2>
                <div2 type="Contents">
                    <head>Volume II.</head>
                    <xsl:apply-templates select="$volume2//front/div1[@id='v2toc']/*[not(self::head)]"/>
                </div2>
            </div1>

        </front>
        <body>
            <xsl:apply-templates select="$volume1//body/*"/>
            <xsl:apply-templates select="$volume2//body/*"/>
        </body>
        <back id="backmatter">
            <xsl:apply-templates select="$volume1//back/div1"/>
            <xsl:apply-templates select="$volume2//back/div1"/>

            <divGen type="Colophon"/>
        </back>
    </text>
    </TEI.2>
</xsl:template>


<xsl:template match="ab[@id='v1volumetitle']"/>


<xsl:template match="node()|@*">
    <xsl:copy>
        <xsl:apply-templates select="node()|@*"/>
    </xsl:copy>
</xsl:template>


</xsl:transform>
