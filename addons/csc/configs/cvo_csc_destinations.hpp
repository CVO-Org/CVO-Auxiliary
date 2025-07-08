class GVAR(destinations)
{
    class Base {

        displayName = "";
        displayCode = ""; // Function name or stringCode

        functionname = "";

        class parameters {
        };
    };

    class Base_Fixed: Base {
        displayName = "Default: DebugCorner";
        displayCode = ""; // Function name or stringCode
        
        code = QFUNC(destination_fixedPos); // Function name or stringCode
        
        class parameters {
            position[] = { 0, 0, 0 };
        };
    };

    class Base_BehindTarget: Base {
        displayName = "Default: Behind the Object";   // Just as an example
        code = QFUNC(destination_relativeTo);
        class parameters {
            mode = "BEHIND"; // "BEHIND", "OFFSET"
            offset[] = { 0, 0, 2 };   // only used by OFFSET
            reference = "TARGET"; // TARGET, PLAYER or missionNamespace variablename
        };
    };
    class Base_InfrontPlayer: Base {
        displayName = "Default: Infront of Player";   // Just as an example
        code = QFUNC(destination_relativeTo);
        class parameters {
            mode = "FRONT"; // "FRONT", "OFFSET"
            // offset[] = { 2, 0, 1 };   // only used by OFFSET
        };
    };
};
