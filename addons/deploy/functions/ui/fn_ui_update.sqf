#include "../../script_component.hpp"

/*
* Author: Zorn
* Function to update the Cvo Deploy UI.
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

params ["_args", ""];
_args params ["_dialog", "_network"];

private _destinations = _network get "destinations";

diag_log format ['[CVO](debug)(fn_ui_update) _destinations: %1', _destinations];

private _ctrl_listbox = _dialog displayCtrl 1500;

{
    private _destination = _x;
    private _str = [_destination] call FUNC(getName);
    control lbSetText [_forEachIndex, _str];
    
} forEach _destinations;

// Get the currently selected Index
private _curSelIndex = lbCurSel _ctrl_listbox;

// Store currently selected index on Display
_dialog setVariable [QGVAR(curSel_index), lbCurSel _ctrl_listbox];

// Handle Edge Cases
private _state = switch (true) do {
    case (_curSelIndex == -1): { "NONE" };
    default { true };
};

// Adjust Display Controls: OKButton and Status Text
private _ctrlButtonOK = _dialog displayCtrl 1;
private _ctrlStatusText = _dialog displayCtrl 1003;

if (_state isEqualTo true) then {

    // Can Fasttravel
    _ctrlButtonOK ctrlEnable true;
    _ctrlStatusText ctrlSetText "You can deploy to the selected destination!";

} else {
    // Can not Fasttravel

    private _str = switch (_state) do {
        case "NONE": { "No Destination selected!" };
        default { "No valid destination selected!" };
    };

    _ctrlButtonOK ctrlEnable false;
    _ctrlStatusText ctrlSetText _str;

};

