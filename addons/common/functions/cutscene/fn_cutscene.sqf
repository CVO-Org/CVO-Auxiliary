#include "../../script_component.hpp"

/*
* Author: Zorn
* Function to handle a simple Cutscene which mainly uses Text 
*
* Arguments:
*
*
* Return Value:
* None
*
* Example:
* ['something', player] call prefix_component_fnc_functionname
*
* Public: No
*/

{ _x call FUNC(processTimelineEntry); } forEach _this;

private _delay = missionNamespace getVariable [QGVAR(cutscene_delay), 0];
missionNamespace setVariable [QGVAR(cutscene_delay), nil];

_delay // return final delay so custom WAE can be added afterwards
