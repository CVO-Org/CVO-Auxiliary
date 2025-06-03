#include "../../script_component.hpp"

/*
	Author: Mr. Zorn

	Description:
		returns the _finalKit Array to be used in the CVO Arsenal.

	Parameter(s):

	Returns:
		<Array> List of classnames of additional gear to be used in ACE Arsenal

	Examples:
		<example>
		[] call cvo_arsenal_fnc_update;
*/
if (!hasInterface) exitWith {};

private _finalKit = [];


// ############ Handle Base Kit ############
// Handle Base Kit
if (isNil QGVAR(kit_base)) then { GVAR(kit_base) = [] };

_baseKit = GVAR(kit_base);

_finalKit append _baseKit;

// ############ Handle Role Kit ############
private _roles = [ace_player] call FUNC(getUnitRoles);

// Detectes ACE MEDIC and ACE Engineer
_roles = [ace_player, _roles] call FUNC(rolesByTrait);

diag_log format ['[CVO](ARSENAL) Init: Player Roles: %1', _roles];
systemChat format ['[CVO](ARSENAL) Init: Player Roles: %1', _roles];


private _roles_hashmap = missionNamespace getVariable [QGVAR(roleKit), createHashMap];
{// Retrieves Info from HASHMAP
	private _array = _roles_hashmap getOrDefault [_x,false];

	diag_log format ["_array: %1", _array];

	if ((_array isNotEqualTo false)) then {
		// _array = [  "KEY/ROLENAME",	[  ["ARRAY OF CLASSNAMES"],{"Optional CODEBLOCK"}  ]  ]
		
		diag_log format ["Role: %1 detected", _x];

		diag_log format ["Kit Added: %1", _array select 0];
		_finalKit append (_array select 0);

		private _code = call (_array select 1);
		diag_log format ["Code Return: %1",_code];
		_finalKit append _code;

	}; 
} forEach _roles;

// ############ Detect PLAYER KIT ############
private _uid = getPlayerUID player;

private _hashMap_PlayerKit = missionNamespace getVariable [QGVAR(playerKit), createHashMap];
_array = _hashMap_PlayerKit getOrDefault [_uid,false];


if ((_array isNotEqualTo false)) then {

	private _code = [] call (_array select 2);

	_finalkit append (_array select 1);
	_finalKit append _code;

	diag_log format ["PlayerKit Detected for %1 - Array: %2 - Code: %3",_array select 0, _array select 1, _code];
}; 

// Removes Duplicates
_finalkit = _finalkit arrayIntersect _finalkit;

// Return
_finalkit