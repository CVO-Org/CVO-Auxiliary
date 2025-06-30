// source

[
    {
        [source] call cvo_deploy_fnc_departure;
        [[worldsize/2,worldsize/2]] call cvo_deploy_fnc_destination;
        [car]   call cvo_deploy_fnc_destination;
        [car_1] call cvo_deploy_fnc_destination;
        [car_2] call cvo_deploy_fnc_destination;
        [car_3] call cvo_deploy_fnc_destination;
        [car_3] call cvo_deploy_fnc_destination;
        [car_4] call cvo_deploy_fnc_destination;
        [car_5] call cvo_deploy_fnc_destination;
        [car_6] call cvo_deploy_fnc_destination;
        [car_7] call cvo_deploy_fnc_destination;
    },
    [],
    1
] call CBA_fnc_waitAndExecute;
