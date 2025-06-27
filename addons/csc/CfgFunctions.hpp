class CfgFunctions
{
	class ADDON            // Tag
	{
        class init {
            file = PATH_TO_FUNC_SUB(init);
            
            class cbaEvents { preInit = 1; };
        };

        class framework {
            file = PATH_TO_FUNC_SUB(framework);

            class createCrate {};
        };
        
        class config {
            file = PATH_TO_FUNC_SUB(config);
            
            class getCfgDataHashmap {};
        };

       
        


    };
};
