class ace_flags_white;

class CBA_MiscItem_ItemInfo;

class PVAR(flag_red_cvo): ace_flags_white {
    author = "$STR_cvo_Author";
    displayName = "Flag (CVO - Red - Small)";

    ace_flags_texture = QPATHTOF(data\flag_voron_red_512.paa); // Path to the flag texture
    ace_flags_carrier = QPVAR(carrier_flag_red); // Classname of the corresponding vehicle that gets placed.
    
    picture = "\z\ace\addons\flags\data\pictures\red_item.paa"; // Path to the picture for the inventory item
    
    // Path to the icon for the place action. Do not overwrite for default white icon (inherited by ace_flags_white).
    ace_flags_actionIconPlace = "\z\ace\addons\flags\data\icons\place\red_place_icon.paa";
    
    // Path to the icon for the carry action. Do not overwrite for default white icon (inherited by ace_flags_white).
    ace_flags_actionIconCarry = "\z\ace\addons\flags\data\icons\carry\red_carry_icon.paa";

    class ItemInfo: CBA_MiscItem_ItemInfo {
    //e    mass = 6.6; // (Optional) Overwrite default item/flag mass. We're assuming 300g.
    };
};



class PVAR(flag_olive_cvo): PVAR(flag_red_cvo) {
    author = "$STR_cvo_Author";
    displayName = "Flag (CVO - Olive - Small)";

    ace_flags_texture = QPATHTOF(data\flag_voron_olive_512.paa); // Path to the flag texture
    ace_flags_carrier = QPVAR(carrier_flag_olive); // Classname of the corresponding vehicle that gets placed.
    
    picture = "z\ace\addons\flags\data\pictures\green_item.paa"; // Path to the picture for the inventory item
    
    // Path to the icon for the place action. Do not overwrite for default white icon (inherited by ace_flags_white).
    ace_flags_actionIconPlace = "z\ace\addons\flags\data\icons\place\green_place_icon.paa";
    

    // Path to the icon for the carry action. Do not overwrite for default white icon (inherited by ace_flags_white).
    ace_flags_actionIconCarry = "z\ace\addons\flags\data\icons\place\green_carry_icon.paa";

    class ItemInfo: CBA_MiscItem_ItemInfo {
    //e    mass = 6.6; // (Optional) Overwrite default item/flag mass. We're assuming 300g.
    };
};
