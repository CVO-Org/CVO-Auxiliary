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

missionNamespace setVariable [QGVAR(cutscene_delay), nil];
