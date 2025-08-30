#include "../../script_component.hpp"

/*
* Author: Zorn
* function to add an event handler to the object
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

params ["_groupName"];

private _array = missionNamespace getVariable QGVAR(discovered);

if (isNil "_array") then {
    _array = [];
    missionNamespace setVariable [QGVAR(discovered), _array];
};

_array pushBackUnique _groupName;

[QGVAR(EH_update), [_array], QGVAR(EH_update)] call CBA_fnc_globalEventJIP;
