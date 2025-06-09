#include "../../script_component.hpp"

/*
* Author: Zorn
* This function checks the queue and plays the track when able.
*
* Arguments:
* 
*
* Return Value:
* None
*
* Example:
* [] call prefix_component_fnc_functionname
*
* Public: No
*/


params [
    ["_track",        "",         [""]       ]
];



if (GETMGVAR(isPlaying,false)) then {

    [_track] call FUNC(queue);
    ZRN_LOG_MSG_1(push to queue,_this);

} else {

    [QGVAR(EH_play_remote), [_track]] call CBA_fnc_globalEvent;
    ZRN_LOG_MSG_1(Play,_this);    

    private _duration = getNumber ((_track call FUNC(getTrackCfg)) >> "duration");
    if (_duration == 0) then { _duration = SET(default_duration); };

    _duration = _duration + GVAR(delay_min) + random GVAR(delay_random);

    GVAR(isPlaying) = true;
   
    [
        {
            GVAR(isPlaying) = false;
            ["NEXT"] call FUNC(request_server);
        },
        [],
        _duration
    ] call CBA_fnc_waitAndExecute;

};
