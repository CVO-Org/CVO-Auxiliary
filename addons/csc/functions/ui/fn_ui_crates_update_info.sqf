#include "../../script_component.hpp"

/*
* Author: Zorn
* Function to ...
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

params ["_ctrl", "_selectedRow"];

call FUNC(ui_crates_check_amount); // update the + and - button 

