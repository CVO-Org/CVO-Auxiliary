#include "../../script_component.hpp"

/*
* Author: Zorn
* Function to add a role to the Unit
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
    [ "_unit",  objNull,    [ objNull ] ],
    [ "_roles", "",         [ [], ""  ] ]
];

if ( isNull _unit ) exitWith { ERROR_1("Unit not found - could not apply roles: %1",_roles); false };
if ( _roles isEqualTo "" ) exitWith { ERROR_1("No roles provided for unit: %1",_unit); false };

if ( _roles isEqualType "" ) then { _roles = [_roles]; };

_roles = _roles apply { toLowerANSI _x };

{ _roles pushBackUnique _x; } forEach ([_unit] call FUNC(getUnitRoles));

[_unit, _roles] call FUNC(setUnitRoles);

true
