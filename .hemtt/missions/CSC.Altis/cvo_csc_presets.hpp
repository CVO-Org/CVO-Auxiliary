class cvo_csc_presets {
    
    class cvo_csc_destinations {
    
        // import base;

        class tarp {
            displayName = "Tarp.";   // Just as an example
            description = "On the Tarp.";

            code = "cvo_csc_fnc_base_relativeTo";

            class parameters {
                mode = "OFFSET"; // "BEHIND", "OFFSET"
                offset[] = { 0, 0, 1.5 };   // only used by OFFSET
                reference = "cvo_tarp"; // TARGET, PLAYER or missionNamespace variablename
            };
        };
    };
};
