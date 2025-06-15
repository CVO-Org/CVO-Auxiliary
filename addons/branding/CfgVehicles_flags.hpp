// Flags with CVO Flag Texture
class FlagCarrier_Asym;
class PVAR(Flag_Red): FlagCarrier_Asym
{
    _generalMacro=QPVAR(Flag_Red);

    author="$STR_cvo_Author";
    displayName="$STR_CVO_branding_red_display";
    scope = 2;
    scopeCurator = 2;


    class EventHandlers { init=QUOTE((_this select 0) setFlagTexture QUOTE(QPATHTOF(data\flag_voron_red_2048.paa))); };

    class ACE_Actions {
        class ACE_MainActions {
            displayName = "$STR_ace_interaction_MainAction";
            condition = "true";
            position = "[-0.1, -0.35, -2.6]";
            distance = 2;
        };
    };
};
class PVAR(Flag_Olive) : PVAR(Flag_Red)
{
    _generalMacro=QPVAR(Flag_Olive);
    displayName="$STR_CVO_branding_olive_display";
    class EventHandlers
    {
        init=QUOTE((_this select 0) setFlagTexture QUOTE(QPATHTOF(data\flag_voron_olive_2048.paa)));
    };
};

// Banners with CVO Flag Texture
class Banner_01_F;
class PVAR(Banner_Red) : Banner_01_F
{
    _generalMacro=QPVAR(Banner_Red);
    displayName="Banner (CVO - Red)";
    author = "$STR_cvo_Author";
    hiddenSelectionsTextures[] = {QPATHTOF(data\flag_voron_red_2048.paa)};
};
class PVAR(Banner_Olive) : Banner_01_F
{
    _generalMacro=QPVAR(Banner_Olive);
    displayName="Banner (CVO - Olive)";
    hiddenSelectionsTextures[] = {QPATHTOF(data\flag_voron_olive_2048.paa)};
};


// ACE Carrier Flags - https://ace3.acemod.org/wiki/framework/flags-framework
class ace_flags_carrier_white;
class PVAR(carrier_flag_red): ace_flags_carrier_white {
    author = "$STR_cvo_Author";
    displayName = "Flag (CVO - Red - Small)";

};
class PVAR(carrier_flag_olive): PVAR(carrier_flag_red) {
    displayName = "Flag (CVO - Olive - Small)";
};
