package ${packageName};

<#assign databindingClassName = "${layoutName}">

import ${superClassFqcn};
import android.os.Bundle;
import android.databinding.DataBindingUtil;

import ${packageName}.databinding.<#list databindingClassName?split("_") as str >${str?cap_first}</#list>Binding;

public class ${activityClass} extends ${superClass} {

	private <#list databindingClassName?split("_") as str >${str?cap_first}</#list>Binding mBinding;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        mBinding = DataBindingUtil.setContentView(this,R.layout.${layoutName});
    }
}
