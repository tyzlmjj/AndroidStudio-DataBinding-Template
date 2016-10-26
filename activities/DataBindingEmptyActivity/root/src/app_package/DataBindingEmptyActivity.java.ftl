package ${packageName};

<#function layoutNametoClassName name>
    <#return name?replace("_"," ")?capitalize?replace(" ","")>
</#function>

<#assign databindingClassName = "${layoutNametoClassName(layoutName)}Binding">

import ${superClassFqcn};
import android.os.Bundle;
import android.databinding.DataBindingUtil;

public class ${activityClass} extends ${superClass} {

	private ${databindingClassName} mBinding;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        mBinding = DataBindingUtil.setContentView(this,R.layout.${layoutName});
    }
}
