#include "../../script_component.hpp"

/*
* Author: Zorn
* Function to be executed locally - will update/create the Intel Summary Record
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

params ["_discoveredIntelGroups"];

[] call FUNC(diary_createSubject);
[_discoveredIntelGroups] call FUNC(diary_setRecordText);
