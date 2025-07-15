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

params ["_ctrl", "_index"];

diag_log format ['[CVO](debug)(fn_ui_crates_onLBSelChanged) _this: %1', _this];

call FUNC(ui_update_arrows); // update the + and - button 

call FUNC(ui_update_crate_desc);
