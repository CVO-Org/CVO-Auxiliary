#include "../../script_component.hpp"

/*
* Author: Zorn
* Function to be Triggered by CBA Settings.
* Will Enable Dynamic Group Menu.
* Can be force-disabled in description.ext via `disableDynamicGroups = 1;`
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
    [ "_enable", false, [false] ]
];

ZRN_LOG_1(_enable);

if !(_enable) exitWith {};

if (getNumber (missionConfigFile >> "disableDynamicGroups") == 1) exitWith {};

if (hasInterface) then { ["InitializePlayer", [player, true]] call BIS_fnc_dynamicGroups; };
if (isServer) then { ["Initialize", [true]] call BIS_fnc_dynamicGroups; };

nil
