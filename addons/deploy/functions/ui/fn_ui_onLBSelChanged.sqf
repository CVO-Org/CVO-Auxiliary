#include "../../script_component.hpp"

/*
* Author: Zorn
* UI Event Fnc
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

params ["_control", "", ""]; // [control, _lbCurSel, sth]

ctrlParent _control call FUNC(ui_update);
