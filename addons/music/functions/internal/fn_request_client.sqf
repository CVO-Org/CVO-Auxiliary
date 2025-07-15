#include "../../script_component.hpp"

/*
* Author: Zorn
* This function handles all input requests
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

params [
    ["_input", "", [""] ],
    ["_data",  "", [""] ]
];

ZRN_LOG_MSG_1(INIT,_input);

switch (_input) do {
    case "NEXT":      { [QGVAR(EH_request_server), _input] call CBA_fnc_serverEvent; };
    case "FADENEXT":  { [QGVAR(EH_request_server), _input] call CBA_fnc_serverEvent; };
    case "FADECLEAR": { [QGVAR(EH_request_server), _input] call CBA_fnc_serverEvent; };

    case "SONG": {
        if ( isClass (configFile >> "CfgMusic" >> _data) || { isClass (missionConfigFile >> "CfgMusic" >> _data) } ) then {
            [QGVAR(EH_request_server), ["SONG", _data]] call CBA_fnc_serverEvent;
        };
    };
    case "SONG_FADENEXT": {
        if ( isClass (configFile >> "CfgMusic" >> _data) || { isClass (missionConfigFile >> "CfgMusic" >> _data) } ) then {
            [QGVAR(EH_request_server), ["SONG_FADENEXT", _data]] call CBA_fnc_serverEvent;
        };
    };

    case "PLAYLIST": {
        if ( _data in GVAR(playlists_public) ) then {
            [QGVAR(EH_request_server), ["PLAYLIST", _data]] call CBA_fnc_serverEvent;
        };
    };

    default  { 
        if ( _input in GVAR(playlists_public) ) then {
            [QGVAR(EH_request_server), ["PLAYLIST", _input]] call CBA_fnc_serverEvent;
        };
    };
};
