<?xml version="1.0" encoding="UTF-8"?>
<schema xmlns="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2"
    xmlns:sqf="http://www.schematron-quickfix.com/validator/process"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <ns uri="http://www.tei-c.org/ns/1.0" prefix="tei"/>
    <pattern>
        <!-- Change the attribute to point the element being the context of the assert expression. -->
        <rule context="tei:ref">
            <!-- Change the assert expression. -->
            <assert test="starts-with(@target,'#')">Missing # in ref/@target.</assert>
            <assert test="starts-with(@target,'#vat-gr-754:')
                or starts-with(@target,'#vat-gr-1422:')
                or starts-with(@target,'#coislin-10:')
                or starts-with(@target,'#coislin-12:')
                or starts-with(@target,'#ambr-b-106-sup:')
                or starts-with(@target,'#ambr-m-47-sup:')
                or starts-with(@target,'#bodl-auct-d-4-1:')
                or starts-with(@target,'#oxon-s-trin-78:')
                or starts-with(@target,'#par-gr-139:')
                or starts-with(@target,'#par-gr-164')
                or starts-with(@target,'#par-gr-166:')
                or starts-with(@target,'#mosq-syn-194:')">Wrong prefix in ref/@target</assert>
        </rule>
        <rule context="tei:seg">
            <assert test="(@type = 'hypothesis') or (@type = 'commentaryfragment') or (@type = 'hexaplaric') or (@type = 'glosse') or (@type = 'perioche')">Attribute type on element seg has to be one of 'hypothesis', 'commentaryfragment', 'hexaplaric', 'perioche' or 'glosse'.</assert>
        </rule>
        <rule context="tei:seg[(@type = 'hypothesis') or (@type = 'commentaryfragment') or (@type = 'glosse')]">
            <assert test="exists(child::tei:quote)">Missing element quote as content of element seg.</assert>
        </rule>
        <rule context="tei:seg[(@type = 'hypothesis') or (@type = 'commentaryfragment') or (@type = 'glosse') or (@type = 'hexaplaric')]">
            <assert test="starts-with(@corresp,'#')">The attribute corresp on the element seg must start with a '#' sign.</assert>
            <assert test="exists(//tei:anchor[@xml:id = substring-after(current()/@corresp,'#')])">For value of @corresp on element seg an element anchor could not be found. Please correct the @corresp attbribute</assert>
        </rule>
        <rule context="tei:seg[(@type = 'hypothesis') or (@type = 'commentaryfragment')]">
            <assert test="exists(@xml:id)">Attribute xml:id must be present on seg element.</assert>
            <assert test="exists(@source)">Attribute source must be present on seg element.</assert>
        </rule>
        <rule context="tei:seg[@type = 'hexaplaric']">
            <assert test="not(exists(child::tei:quote))">Element seg of type 'hexaplaric' must not contain a child element quote.</assert>
        </rule>
        <rule context="tei:div[@type = 'commentary']">
            <assert test="@subtype = 'commentary'">Element div of type 'commentary' must have a value of 'commentary' as subtype.</assert>
        </rule>
        <rule context="tei:div[@type = 'bibletext']">
            <assert test="@subtype = 'commented'">Element div of type 'bibletext' must have a value of 'commented' as subtype.</assert>
        </rule>
        <rule context="tei:div[@type = 'commentary']">
            <assert test="not(exists(descendant::tei:pb))">Element pb must be positioned outside div/@type = 'commentary'.</assert>
        </rule>
        <rule context="tei:quote[@type = 'patristic']">
            <assert test="starts-with(@corresp,'#')">Referenced person in quote/@corresp must start with a '#' sign.</assert>
        </rule>
    </pattern>
</schema>