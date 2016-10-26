<?xml version="1.0"?>
<recipe>

    <#if useSupport><dependency mavenUrl="com.android.support:support-v4:${buildApi}.+"/></#if>

    <instantiate from="res/layout/fragment_blank.xml.ftl"
                   to="${escapeXmlAttribute(resOut)}/layout/${escapeXmlAttribute(fragmentName)}.xml" />

    <instantiate from="src/app_package/BlankFragment.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/${className}.java" />

    <open file="${escapeXmlAttribute(resOut)}/layout/${escapeXmlAttribute(fragmentName)}.xml" />

    <open file="${escapeXmlAttribute(srcOut)}/${className}.java" />

    

</recipe>
