class CfgFunctions
{
	class ADDON            // Tag
	{
		class COMPONENT           // Category
		{
            file = PATH_TO_FUNC;

            class preInit { preInit = 1; };
		};

        class autoInit {
            file = PATH_TO_FUNC_SUB(autoInit);
            
            class antiFlubber { postInit = 1; }; // Auto Inits the Anti Flubber Script - descrition.ext: "enableAntiFlubber = 1;"
        };
        
        class code {
            file = PATH_TO_FUNC_SUB(code);

            class getMedianPosASL {};
            class getSizeOf {};
            class getBoundingBoxRealOf {};
        };

        class utility {
            file = PATH_TO_FUNC_SUB(utility);
            class zeusMessage {};
        };
       
        class debug {
            file = PATH_TO_FUNC_SUB(debug);

            class markAllLocations {};
            class stringPadding {};
            class ui_lnb_output {};
        };

        class helicopters {
            file = PATH_TO_FUNC_SUB(helicopters);

            class airlift_cargo {};
            class slingload_cargoOwner {};
            
            class speedLimiter {};

            class landOnRails {};
            
        };

        class layers {
            file = PATH_TO_FUNC_SUB(layers);

            class layerObjects {};
            class toggleLayerAI {};
        };

        class missionmaker {
            file = PATH_TO_FUNC_SUB(missionmaker);

            class executeUnit {};
            class fullHeal {};
            class holdaction_tp {};
            class makeCosmetic {};

            class subtitles {};
            class makeRemovable {};
        };

        class vehicles {
            file = PATH_TO_FUNC_SUB(vehicles);
            
            class moveUnitsIntoVehicles {};
            class secureVehicle {};

            class orderlyDismount {};
        };
        class cutscene {
            file = PATH_TO_FUNC_SUB(cutscene);
            
            class cutscene {};
            class processTimelineEntry {};
        };
    };
};
