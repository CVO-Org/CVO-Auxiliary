class CfgFunctions
{
	class ADDON            // Tag
	{
		class COMPONENT           // Category
		{
            file = PATH_TO_FUNC;

            class preInit { preInit = 1; };
		};

        class code {
            file = PATH_TO_FUNC_SUB(code);

            class convertStringCode {};
            class getMedianPosASL {};
        };
       
        class debug {
            file = PATH_TO_FUNC_SUB(debug);

            class markAllLocations {};
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
        };

        class vehicles {
            file = PATH_TO_FUNC_SUB(vehicles);
            
            class moveUnitsIntoVehicle {};
            class secureVehicle {};
        };
        
    };
};
