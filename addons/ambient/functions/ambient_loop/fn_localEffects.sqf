#include "../../script_component.hpp"

/*
* Author: Zorn
* dedicated say3d Function
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

diag_log format ['[CVO](debug)(fn_localEffects) _this: %1', _this];

if (!hasInterface) exitWith { diag_log format ['[CVO](debug)(fn_localEffect) exit: %1', "exit"]; };

params [
    "_sound",
    ["_distance", 300],
    ["_direction", "RND"]
];

if (_direction isEqualTo "RND") then { _direction = ceil random 360 };

private _unit = ACE_player;

private _helper = createVehicleLocal [
    "Helper_Base_F",
    _unit getPos [_distance, _direction] vectorAdd [0,0, 2 + ceil random 8]
];

diag_log format ['[CVO](debug)(fn_localEffects) _helper: %1', _helper];

private _soundsource = _helper say3D [ _sound, _distance * 2, 1 + random 0.5 ];

private _duration = getNumber (configFile >> "CfgSounds" >> _sound >> "duration");

[
    { isNull (_this#0) },
    { deleteVehicle (_this#1); diag_log format ['[CVO](debug)(fn_localEffects) _deleting: %1', _deleting]; },
    [ _soundsource, _helper ]
] call CBA_fnc_waitUntilAndExecute;

_unit setVariable [QGVAR(lastPlayed), CBA_missionTime + _duration, true];
