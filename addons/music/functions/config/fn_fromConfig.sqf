#include "../../script_component.hpp"

/*
* Author: Zorn
* This Function takes a Config Class and establishes the playlist hashmap.
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
    [   "_cfg",  configNull, [configNull]    ]
];

private _name = configName _cfg;
private _dependencies = getArray (_cfg >> "dependencies");

private _dependenciesLoaded = true;
{
    if ( ! isClass (configFile >> "CfgPatches" >> _x ) ) exitWith { _dependencyLoaded = false };
} forEach _dependencies;

if (!_dependencyLoaded) exitWith {ZRN_LOG_MSG_1(Dependency Missing,_name);};

private _tracks = getArray (_cfg >> "tracks");

["ADD", [_name, _tracks]] call FUNC(catalog);