class CfgFunctions
{
	class ADDON            // Tag
	{
		class COMPONENT           // Category
		{
			file = PATH_TO_FUNC;

		};
        class markerFlags {
            file = PATH_TO_FUNC_SUB(markerFlags);

    	    class postInit { postInit = 1; };
    	    class createFlagMarker {};
    	    class findAllFlags {};
        };
	}; 
};
