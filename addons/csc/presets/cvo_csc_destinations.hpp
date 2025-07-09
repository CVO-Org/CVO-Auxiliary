class GVAR(destinations)
{
    class base {

        displayName = "";
        description = "";

        code = "";

        class parameters {
        };
    };

    class base_fixed_debug: base {

        displayName = "Debug Corner";
        description = "Predefined, fixed prosition - in this case, the debug corner.";

        code = QFUNC(base_fixedPos); // Function name or stringCode
        
        class parameters {
            position[] = { 0, 0, 0 };
        };
    };
    
    class base_fixed_10000: base {
        displayName = "at [10000,10000]";
        description = "Predefined, fixed prosition.";

        code = QFUNC(base_fixedPos); // Function name or stringCode
        
        class parameters {
            position[] = { 11571.1, 7044.98, 0 };
        };
    };

    class base_mapClick: base {
        displayName = "via Mapclick";
        description = "Manually define the desired destination via map-click.";

        code = QFUNC(base_mapClick);

        class parameters {

        };

    };

    class base_behindTarget: base {
        displayName = "Behind the Object";   // Just as an example
        description = "At the rear, relative to the target object.";

        code = QFUNC(base_relativeTo);

        class parameters {
            mode = "BEHIND"; // "BEHIND", "OFFSET"
            offset[] = { 0, 0, 2 };   // only used by OFFSET
            reference = "TARGET"; // TARGET, PLAYER or missionNamespace variablename
        };
    };

    class base_infrontPlayer: base {
        displayName = "Infront of Player";   // Just as an example
        description = "In front of the player";

        code = QFUNC(base_relativeTo);

        class parameters {
            mode = "FRONT"; // "FRONT", "OFFSET"
            offset[] = { 0, 0, 0 };   // only used by OFFSET
            reference = "PLAYER";
        };
    };
};
