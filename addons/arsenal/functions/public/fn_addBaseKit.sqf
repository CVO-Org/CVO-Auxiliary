#include "../../script_component.hpp"

/*
* Author: Zorn
* Function to add Classnames to the Base Kit.
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
    ["_kit",  [],  [[], ""] ]
];


if (_kit isEqualTo "") exitWith {};
if (_kit isEqualType "") then { _kit = [_kit] };

if (isNil QGVAR(baseKit)) then {
    GVAR(baseKit) = [];
};

GVAR(baseKit) append _kit;

true
