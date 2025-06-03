class CfgFunctions
{
	class ADDON            // Tag
	{
		class Arsenal_Tabs
		{
			file = PATH_TO_FUNC_SUB(arsenal_tabs);
			class greenmag { postInit = 1; };
		};

		class internal    // Category
		{
			file = PATH_TO_FUNC_SUB(internal);
            class postInit { postInit = 1; };

			class saveStartingLoadout { postInit = 1; };

			class open {};
			class update {};
			class addAction {};
		};

        class handleConfig
        {
            file = PATH_TO_FUNC_SUB(handleConfig);
            // class missionConfig { postInit = 1; }; // depricated

            class baseKitFromConfig { postInit = 1; };
            class roleKitFromConfig { postInit = 1; };
            class personalKitFromConfig { postInit = 1; };
        };
        class config
        {
            file = PATH_TO_FUNC_SUB(config);
            class getBaseKitFromConfig {};
            class getRoleKitFromConfig {};
            class getPersonalKitFromConfig {};
        };

        class setKit
        {
            file = PATH_TO_FUNC_SUB(setKit);
            class addBaseKit {};
            class setBaseKit {};

            class addRoleKit {};
            class setRoleKit {};

            class setPersonalKit {};

        };
        class getKit
        {
            file = PATH_TO_FUNC_SUB(getKit);

            class getRoleKits {};
            class getPersonalKits {};
        };
        class roles
        {
            file = PATH_TO_FUNC_SUB(roles);
            class addUnitRoles {};
            class setUnitRoles {};
            class getUnitRoles {};

            class rolesByTrait {};
        };
	};
};
