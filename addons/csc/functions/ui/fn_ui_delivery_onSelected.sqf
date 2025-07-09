#include "../../script_component.hpp"

/*
* Author: Zorn
* Function to check and update the max possible crates.
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

params ["", "_index"];

// Common
private _display = findDisplay CVO_IDD_CSC_REQUEST;

private _cfg = [
    QGVAR(delivery_modes),
    _display getVariable QGVAR(delivery_modes) select _index, // Get classname from display based on currently selected
    configNull
] call EFUNC(catalog,getEntry);

// Store currently selected Mode
_display setVariable [QGVAR(delivery_mode), configName _cfg];

//// Update Max Crates
_display setVariable [QGVAR(maxCrates), getNumber (_cfg >> "maxCrates")];
// Request crate amount check
[] call FUNC(ui_crates_check_amount);


//// Update Description
private _text = getText (_cfg >> "description");
ctrlSetText [CVO_IDC_CSC_Delivery_Description, _text];
