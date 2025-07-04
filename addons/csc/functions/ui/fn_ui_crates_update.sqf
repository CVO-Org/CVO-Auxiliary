#include "../../script_component.hpp"

/*
* Author: Zorn
* Function that handles the +- Buttons for the Crates ListNBox
*
* Arguments:
*
* Return Value:
* None
*
* Example:
* [ 1 ] call FUNC(ui_update_crates);
*
* Public: No
*/

diag_log format ['[CVO](debug)(fn_ui_crates_update) _this: %1', _this];

params ["_change", ["_buttonCtrl", controlNull]];

if (!isNull _buttonCtrl && { !ctrlEnabled _buttonCtrl }) exitWith { false };

private _display = findDisplay CVO_IDD_CSC_REQUEST;

diag_log format ['[CVO](debug)(fn_ui_crates_update) _display: %1', _display];

private _row = lnbCurSelRow CVO_IDC_CSC_Crates_ListNBox;

diag_log format ['[CVO](debug)(fn_ui_crates_update) _row: %1', _row];

private _oldValue = lnbValue [CVO_IDC_CSC_Crates_ListNBox, [_row, 0]];
private _newValue = (_oldValue + _change) max 0;

diag_log format ['[CVO](debug)(fn_ui_crates_update) _oldValue: %1 - _newValue: %2', _oldValue , _newValue];

lnbSetValue [ CVO_IDC_CSC_Crates_ListNBox, [ _row, 0 ], _newValue ];
lnbSetText  [ CVO_IDC_CSC_Crates_ListNBox, [ _row, 1 ], str _newValue ];

// Handle total selected crates
private _oldTotal = _display getVariable [QGVAR(totalCrates), 0];
private _newTotal = [ _oldTotal, _oldTotal + _change ] select (_newValue != _oldValue);
_display setVariable [QGVAR(totalCrates), _newTotal];

diag_log format ['[CVO](debug)(fn_ui_crates_update) _oldTotal: %1 - _newTotal: %2', _oldTotal , _newTotal];

[] call FUNC(ui_crates_check_amount);

true
