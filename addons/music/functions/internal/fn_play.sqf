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



if ( missionNamespace getVariable [QGVAR(isPlaying), false] ) then {

    [_track] call FUNC(queue);
    ZRN_LOG_MSG_1(push to queue,_this);

} else {

    // play music for players
    [QGVAR(EH_play_remote), [_track]] call CBA_fnc_globalEvent;
    ZRN_LOG_MSG_1(Play,_this);    


    // Get Duration and Delay
    private _duration = getNumber ((_track call FUNC(getTrackCfg)) >> "duration");
    ZRN_LOG_1(_duration);
    if (_duration == 0) then { _duration = SET(default_duration); };
    ZRN_LOG_1(_duration);
    _duration = _duration + SET(delay_min) + random SET(delay_random);
    ZRN_LOG_1(_duration);

    // Set Global Flag and reset after delay. Also request next song in queue.
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
