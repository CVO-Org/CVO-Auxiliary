class GVAR(delivery_modes) {

    #include "cvo_csc_delivery_modes_base.hpp"

    class base_spawn: base {

        displayName = "Default: Spawn";
        code_description = """ will be made available at the provided position."""; // tripple Quotes for simply return the string

        code = QFUNC(base_spawn);

        maxCrates = 5;

        scope = 1;
    };

    class base_airdrop: base {

        displayName = "Default: Airdrop";
        code_description = QFUNC(base_airdrop_desc);

        code = QFUNC(base_airdrop);

        maxCrates = 3;

        scope = 1;

        class parameters {
            airframe_side = "CIV";                  // String version: "WEST" "EAST" "GUER" "CIV"
            airframe_protected = "true";
            airframe_class = "C_Heli_Light_01_civil_F";


            pos_start[] = { 8400,7400.00,0 };
            pos_end = "RETURN";

            airdrop_alt = 100;
            airdrop_alt_forced = "true";
            airdrop_speedLimit = 150;

            airdrop_flyInHeightASL[] = { 35, 35, 35 };


            parachute_class = "B_Parachute_02_F";

            // CfgVehicles or CfgAmmo
            parachute_class_strobe = "ACE_IR_Strobe_Effect";
            parachute_class_chemlight = "Chemlight_yellow";
            parachute_class_smoke = "SmokeShellOrange";
        };
    };
};
