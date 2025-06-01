#include "../../script_component.hpp"

/*
* Author: Zorn
* Function to store the kit for a role.
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
    ["_role", "",  [""] ],
    ["_kit",  [],  [[]] ],
    ["_code", {},  [{}] ]
];


if (_role isEqualTo "") exitWith {};
_role = toLowerANSI _role;


private _hashmap = missionNamespace getVariable [QGVAR(roles), createHashMap];


_hasmap set [_role, [_kit, _code]];

missionNamespace setVariable [QGVAR(roles), _hashmap];

true
