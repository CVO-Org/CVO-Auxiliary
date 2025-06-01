class CfgFunctions
{
	class ADDON            // Tag
	{
		class internal    // Category
		{
			file = PATH_TO_FUNC_SUB(internal);
            class postInit { postInit = 1; };

			class saveStartingLoadout { postInit = 1; };

			class open	{};
			class update  {};
			class addAction {};
		};

		class Arsenal_Tabs
		{
			file = PATH_TO_FUNC_SUB(arsenal_tabs);
			class greenmag { postInit = 1; };
		};

        class configKit
        {
            file = PATH_TO_FUNC_SUB(configKit);
            class missionConfig { postInit = 1; };
            class getBaseKitFromConfig {};
            class getRoleKitFromConfig {};
        };

        class public
        {
            file = PATH_TO_FUNC_SUB(public);
            class setRole {};
        };
	};
};
