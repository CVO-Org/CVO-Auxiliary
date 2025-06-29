e and will define the "Defaults" for all the implemented

class GVAR(delivery_modes) {
    class Base {

        displayName = "";

        code = "";

        class parameters {
        };
    };

    class Base_Airdrop : Base {

        displayName = "Airdrop";

        code = "";

        class parameters {
            airframe_side = "CIV";                  // String version: "WEST" "EAST" "GUER" "CIV"
            airframe_protected = "true";
            airframe_class = "C_Heli_Light_01_civil_F";

            pos_start[] = { 0, 0, 0 };
            pos_end = "RETURN";

            airdrop_alt = 100;
            airdrop_alt_forced = "true";

            airdrop_flyInHeightASL[] = { 35, 35, 35 };

            airdrop_attachSmoke = "true";
            airdrop_class_smoke = "SmokeShellOrange"; // CfgMagazines

            parachute_class = "B_Parachute_02_F";

            parachute_attachStrobe = "true";
            parachute_strobe_class = "ACE_IR_Strobe_Effect";
        };
    };
};