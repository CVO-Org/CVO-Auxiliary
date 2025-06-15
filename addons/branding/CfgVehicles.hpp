class CfgVehicles
{
    #include "CfgVehicles_flags.hpp"
    #include "CfgVehicles_merch.hpp"
    #include "CfgVehicles_stencils.hpp"
    


    // A portrait of the oh so glorious leader
    class GalleryFrame_01_large_portrait_F;
    class PVAR(Leadership_Portrait) : GalleryFrame_01_large_portrait_F
    {
        _generalMacro=QPVAR(Leadership_Portrait);

        displayName="Leadership Portrait (CVO)";

        hiddenSelectionsTextures[] =
        {
            QPATHTOF(data\cvo_portrait_director.paa),
            "a3\props_f_aow\civilian\gallery\data\galleryframe_01_large_portrait_f_co.paa",
            "a3\props_f_aow\civilian\gallery\data\galleryframe_01_large_portrait_f_co.paa"
        };
    };
};
