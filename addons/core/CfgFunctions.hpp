class CfgFunctions
{
    class ADDON
    {
        class COMPONENT
        {

            file = PATH_TO_FUNC;

            // class example { postInit = 1; };

        };
        
        class dynamicGroups // Category
		{
            file = PATH_TO_FUNC_SUB(dynamicGroups);
            class enableDynamicGroups {};
		};

    };
};