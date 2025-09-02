#include "../../script_component.hpp"

/*
* Author: Zorn
* function to actually create  the intel entry.
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

params ["_id"];

private _intelData = missionNamespace getVariable _id;

private _intelTitle = _intelData getVariable "intelTitle";
private _intelContent = _intelData getVariable "intelContent";

if !(player diarySubjectExists QGVAR(intel)) then {
    player createDiarySubject [QGVAR(intel), "Intel"];
};

player createDiaryRecord [QGVAR(intel), [_intelTitle, _intelContent]];
