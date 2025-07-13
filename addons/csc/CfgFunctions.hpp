class CfgFunctions
{
	class ADDON            // Tag
	{
        class init {
            file = PATH_TO_FUNC_SUB(init);
            
            class cbaEvents { preInit = 1; };
            class missionInit { preInit = 1; };
        };

        class delivery {
            file = PATH_TO_FUNC_SUB(delivery);
            
            class base_spawn {};
            class base_airdrop {};
        };
        
        class destination {
            file = PATH_TO_FUNC_SUB(destination);
            
            class base_mapClick {};
            class base_fixedPos {};
            class base_relativeTo {};
        };

        class framework {
            file = PATH_TO_FUNC_SUB(framework);

            class handle_destination {};
            class handle_delivery {};
            
            class getDefaultPresets {};
            class createCrate {};

            class request_client {};
            class request_server {};

            class createAccessPoint {};
        };

        
       class ui {
           file = PATH_TO_FUNC_SUB(ui);
           
            class openDialog {};
           
            class ui_onLoad {};
            class ui_onUnload {};
            
            class ui_crates_init {};

            class ui_crates_update {};
            class ui_crates_update_info {};
            class ui_crates_check_amount {};

            class ui_delivery_onSelected {};
            class ui_destination_onSelected {};
       };


        // Temporary
        class config {
            file = PATH_TO_FUNC_SUB(config);
            
            class getCfgDataHashmap {}; // TODO once cba updates, replace with cba variant
        };

        class misc {
            file = PATH_TO_FUNC_SUB(misc);
            
            class parachuteCrate {};
        };
        
    };
};
