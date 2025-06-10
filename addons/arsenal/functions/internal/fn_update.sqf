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

params ["_box"];

private _finalKit = [];

_finalKit append ( missionNamespace getVariable [QGVAR(api), []] );

[_box, _finalkit] call ace_arsenal_fnc_addVirtualItems;

( [] call FUNC(getItemsFromKits) );

