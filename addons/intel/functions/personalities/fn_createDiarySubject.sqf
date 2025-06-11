#include "../../script_component.hpp"


/*
* Author: Zorn
* Function to Create Personalities Diary Subject when not created already.
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
    ["_subject", "", [""]],
    ["_displayName", "", [""]],
    ["_target", player, [objNull]],
    ["_picture", "", [""]]
];

private _subjects =  allDiarySubjects _target apply { _x#0 };

if (_subject in _subjects) exitWith {};

_target createDiarySubject [_subject, _displayName, _picture];

nil
