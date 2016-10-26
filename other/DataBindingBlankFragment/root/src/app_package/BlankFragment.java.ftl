package ${packageName};

<#function layoutNametoClassName name>
    <#return name?replace("_"," ")?capitalize?replace(" ","")>
</#function>

<#assign databindingClassName = "${layoutNametoClassName(fragmentName)}Binding">

<#if includeCallbacks>import android.content.Context;</#if>
import android.databinding.DataBindingUtil;
<#if includeCallbacks>import android.net.Uri;</#if>
import android.os.Bundle;
import android${SupportPackage}.app.Fragment;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
<#if applicationPackage??>
import ${applicationPackage}.R;
</#if>
import ${applicationPackage}.databinding.${databindingClassName};

public class ${className} extends Fragment {

    private ${databindingClassName} mBinding;

<#if includeCallbacks>
    private OnFragmentInteractionListener mListener;
</#if>
<#if includeFactory>
    
    public static ${className} newInstance() {
        ${className} fragment = new ${className}();
        //Bundle args = new Bundle();
        //fragment.setArguments(args);
        return fragment;
    }
</#if>
    public ${className}() {}

<#if includeFactory>
    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        if (getArguments() != null) 
        {
            //mParam1 = getArguments().getString(ARG_PARAM1);
        }
    }
</#if>

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {
        mBinding = DataBindingUtil.inflate(inflater, R.layout.${fragmentName},container,false);
        return mBinding.getRoot();
    }

<#if includeCallbacks>
    public void onButtonPressed(Uri uri) {
        if (mListener != null) {
            mListener.onFragmentInteraction(uri);
        }
    }

    @Override
    public void onAttach(Context context) {
        super.onAttach(context);
        if (context instanceof OnFragmentInteractionListener) {
            mListener = (OnFragmentInteractionListener) context;
        } else {
            throw new RuntimeException(context.toString()
                    + " must implement OnFragmentInteractionListener");
        }
    }

    @Override
    public void onDetach() {
        super.onDetach();
        mListener = null;
    }

    
    public interface OnFragmentInteractionListener {
        void onFragmentInteraction(Uri uri);
    }
</#if>
}
