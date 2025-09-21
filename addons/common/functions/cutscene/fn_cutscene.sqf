#include "../../script_component.hpp"

/*
* Author: Zorn
* Function to handle a simple Cutscene which mainly uses Text 
*
* Arguments:
*
*   []
*
*
*
*
*
*
*
*
*
*
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

params [ [ "_inputArray", [], [[]] ] ];

{ _x call FUNC(processTimelineEntry); } forEach _inputArray;

missionNamespace setVariable [QGVAR(cutscene_delay), nil];
