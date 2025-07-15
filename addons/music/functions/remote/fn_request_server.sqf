#include "../../script_component.hpp"

/*
* Author: Zorn
* This function handles the Request on the server Side that come from the Players
*
* Arguments:
*
* Return Value:
* None
*
* Example:
* ['something', player] call prefix_component_fnc_functionname
*
* Public: No
*/

#define DEFAULTFADETIME 5

if !(isServer) exitWith {};


params [
    ["_mode", "", [""] ],
    "_data", ""
];

ZRN_LOG_1(_this);

switch (_mode) do {
    case "FADENEXT": {
        [QGVAR(EH_fade_remote), DEFAULTFADETIME] call CBA_fnc_globalEvent;
        [ { ["NEXT"] call FUNC(request_server) } , [], DEFAULTFADETIME * 1.1] call CBA_fnc_waitAndExecute;
    };

    case "NEXT": {
        if (missionNamespace getVariable [QGVAR(isPlaying), false]) then {
            ZRN_LOG_MSG(NEXT - while playing true -> FADENEXT);
            ["FADENEXT"] call FUNC(request_server);
        } else {
            private _nextTrack = ["NEXT"] call FUNC(queue);
            if (_nextTrack isEqualTo "") exitWith {};        // No track 
            [_nextTrack] call FUNC(play);
        };
    };
    case "FADECLEAR": {
        [QGVAR(EH_fade_remote), DEFAULTFADETIME] call CBA_fnc_globalEvent;
        ["CLEAR"] call FUNC(queue);
    };

    case "PLAYLIST": {
        [ [ _data, "RANDOM" ] call FUNC(select) ] call FUNC(play);
    };

    case "SONG": {
        [_data] call FUNC(play);
    };

    case "SONG_FADENEXT": {
        ["CLEAR"] call FUNC(queue); // Clear Queue
        [_data] call FUNC(queue); // Add to empty Queue
        ["FADENEXT"] call FUNC(request_server); // Fade Current and play next
    };
};
