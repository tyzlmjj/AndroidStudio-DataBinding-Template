<?xml version="1.0"?>
<recipe>
    <#include "../common/recipe_manifest.xml.ftl" />

<#if appCompat && !(hasDependency('com.android.support:appcompat-v7'))>
    <dependency mavenUrl="com.android.support:appcompat-v7:${buildApi}.+"/>
</#if>

	
    <instantiate from="res/layout/empty.xml.ftl"
                 to="${escapeXmlAttribute(resOut)}/layout/${layoutName}.xml" />

    <instantiate from="src/app_package/DataBindingEmptyActivity.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/${activityClass}.java" />

    <open file="${escapeXmlAttribute(resOut)}/layout/${layoutName}.xml" />

    <open file="${escapeXmlAttribute(srcOut)}/${activityClass}.java" />
</recipe>
