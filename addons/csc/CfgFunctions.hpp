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
            class request_client {};
            class request_server {};
        };
        
        class config {
            file = PATH_TO_FUNC_SUB(config);
            
            class getCfgDataHashmap {};
        };

        class destinations {
            file = PATH_TO_FUNC_SUB(destinations);
            
            class destination_fixed {};
            class destination_objRelative {};
        };

       
        


    };
};
