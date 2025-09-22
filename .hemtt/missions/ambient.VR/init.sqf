

[
    {
        systemChat "start";
        [ "ALL", 0.1, 0.1, 1 ] call cvo_ambient_fnc_startServerLoop;
    },
    "",
    3
] call CBA_fnc_waitAndExecute;
