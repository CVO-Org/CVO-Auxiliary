#define STENCIL(VARIANT)\
class GVAR(DOUBLES(Stencil,VARIANT)) {\
    displayName = "Voron";\
    requiredItem = Q(ACE_Spraypaint##VARIANT);\
    textures[] = { PATH_TO_ADDON_3(data,stencils,cvo_stencil_##VARIANT##.paa) };\
    icon = PATH_TO_ADDON_3(data,stencils,cvo_stencil_##VARIANT##.paa);\
}


class ACE_Tags {
    STENCIL(black);
    STENCIL(red);
    STENCIL(white);
};

/*
class ACE_Tags {
    class yourTagClass {
        displayName = "My Tag";  // Name of your tag being displayed in the interaction menu
        requiredItem = "ACE_SpraypaintBlack";  // Required item to have in the inventory to be able to spray your tag (eg. `"ACE_SpraypaintBlack"`, `"ACE_SpraypaintRed"`, `"ACE_SpraypaintGreen"`, `"ACE_SpraypaintBlue"` or any custom item from `CfgWeapons`)
        textures[] = {"path\to\texture1.paa", "path\to\texture2.paa"};  // List of texture variations (one is randomly selected when tagging)
        materials[] = {"path\to\material.rvmat"}; // Optional: List of material variations (one is randomly selected). Keep empty if you don't need a custom material.
        icon = "path\to\icon.paa";  // Icon being displayed in the interaction menu
        tagModel = "UserTexture1m_F"; // Optional: The 3D Model that will be spawned with the texture on it, can either be CfgVehicles classname or P3D file path.
    };
};
*/