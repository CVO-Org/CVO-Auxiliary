// This file serves as an example for a missionConfig based setup of CSC for a mission.
// Insert the following into your description.ext
// #include "CfgCustomSupplyCrates.hpp"
// "true" and "false" will be converted into booleans

// "DefaultEntry" is a special case and will define the "Defaults" for all the implemented

class GVAR(crates) {
    class base {

        displayName = "displayName";

        description = "Medical Stuff";

        hideInZeus = "false";

        items[] = {};
        backpacks[] = {};

        zeus_enabled = "true";

        box_class = "C_supplyCrate_F";
        box_empty = "true";

        ace_medical_facility = "false";
        ace_medical_vehicle = "false";

        ace_repair_facility = "false";
        ace_repair_vehicle = "false";

        ace_rearm_source = "false";
        ace_rearm_source_value = 50;

        ace_refuel_source = "false";
        ace_refuel_source_value = 50;
        ace_refuel_source_nozzlePos[] = { 0, 0, 0 };

        ace_drag_canDrag = "true";
        ace_drag_relPOS[] = { 0, 1.5, 0 };
        ace_drag_dir = 0;
        ace_drag_ignoreWeight = "true";

        ace_carry_canCarry = "true";
        ace_carry_relPOS[] = { 0, 1, 1 };
        ace_carry_dir = 0;
        ace_carry_ignoreWeight = "false";

        ace_cargo_setSpace = 0;
        ace_cargo_setSize = "DEFAULT";

        ace_cargo_add_spareWheels = 0;
        ace_cargo_add_jerrycans = 0;
        ace_cargo_add_tracks = 0;
    };

    class base_medicalCrate: base {
        displayName = "Medical Supply Crate";

        box_class = "ACE_medicalSupplyCrate_advanced";
        box_empty = "true";

        ace_medical_facility = "true";

        items[] = {
            // { "ACE_suture", 100 },
            { "ACE_surgicalKit", 1 },
            { "ACE_painkillers", 5 },
            { "ACE_bodyBag", 25 },
            { "ACE_personalAidKit", 15 },
            { "ACE_salineIV", 10 },
            { "ACE_salineIV_500", 20 },
            { "ACE_fieldDressing",  40 },
            { "ACE_packingBandage", 40 },
            { "ACE_elasticBandage", 50 },
            { "ACE_Morphine", 5 },
            { "ACE_Epinephrine", 10 }
        };
    };
};
