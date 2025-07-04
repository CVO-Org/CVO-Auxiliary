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
        displayName = "Someplace";
        displayCode = ""; // Function name or stringCode
        
        code_position = QFUNC(destination_posFixed); // Function name or stringCode
        
        class parameters {
            position[] = { 2000, 2000, 2000 };
        };
    };

    class Base_RelToTarget: Base {
        displayName = "Behind the Object";   // Just as an example
        code = QFUNC(destination_targetRelative);
        class parameters {
            mode = "BEHIND"; // "BEHIND", "OFFSET"
            offset[] = { 0, 0, 2 };   // only used by OFFSET
        };
    };
};
