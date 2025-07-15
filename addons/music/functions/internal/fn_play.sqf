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

if (!isServer) exitWith { systemChat "fn_play needs to be executed on the server" };

params [ ["_track",  "", [""] ] ];

private _currentlyPlaying = missionNamespace getVariable [QGVAR(isPlaying), false];

switch (true) do {

    case ( _currentlyPlaying ): {
        [_track] call FUNC(queue);
        ZRN_LOG_MSG_1(push to queue,_this);
    };

    case (!_currentlyPlaying ): {
        // play music for players
        [QGVAR(EH_play_remote), [_track]] call CBA_fnc_globalEvent;

        // Get Duration and Delay
        private _duration = getNumber ((_track call FUNC(getTrackCfg)) >> "duration");
        if (_duration == 0) then { _duration = SET(default_duration); };
        _duration = _duration + SET(delay_min) + random SET(delay_random);

        // Set Global Flag and reset after delay. Also request next song in queue.
        missionNamespace getVariable [QGVAR(isPlaying), true, true];
        [
            {
                missionNamespace getVariable [QGVAR(isPlaying), false, true];
                ["NEXT"] call FUNC(request_server);
            },
            [],
            _duration
        ] call CBA_fnc_waitAndExecute;
    };
};
