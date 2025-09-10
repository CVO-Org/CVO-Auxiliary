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

if !(hasInterface) exitWith {};

params [
    "_sound",
    ["_distance", 300],
    ["_direction", "RND"]
];

if (_direction isEqualTo "RND") then { _direction = ceil random 360 };

private _unit = ACE_player;

private _soundsource = createVehicleLocal [
    "Helper_Base_F",
    ACE_player getPos [_distance, _direction] vectorAdd [0,0, 2 + ceil random 8]
];

_soundsource say3D [ _sound, _distance * 2, 0.8 + random 0.4];

private _duration = getNumber (configFile >> "CfgSounds" >> _sound >> "duration");
[ { deleteVehicle _this; }, _soundsource, _duration * 1.1 ] call CBA_fnc_waitAndExecute;

_unit setVariable [QGVAR(lastPlayed), CBA_missionTime + _duration, true];
