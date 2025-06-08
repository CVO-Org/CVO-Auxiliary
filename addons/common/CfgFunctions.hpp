class CfgFunctions
{
	class ADDON            // Tag
	{
		class COMPONENT           // Category
		{
            file = PATH_TO_FUNC;
            
            class getMedianPosASL {};

            class executeUnit {};
            class airlift_cargo {};
            class slingload_cargoOwner {};

            class fullHeal {};

            class holdaction_tp {};

            class makeCosmetic {};

            class markAllLocations {};

            class convertStringCode {};
		};
		class dynamicGroups // Category
		{
            file = PATH_TO_FUNC_SUB(dynamicGroups);
            class enableDynamicGroups {};
		};
    };
};
