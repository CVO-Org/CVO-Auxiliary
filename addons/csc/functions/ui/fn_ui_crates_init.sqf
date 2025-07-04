#include "../../script_component.hpp"

/*
* Author: Zorn
* Function to update the ListNBox control
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

params ["_display"];

private _crates = _display getVariable QGVAR(crates);   // array of Configs
private _ctrl = _display displayCtrl CVO_IDC_CSC_Crates_ListNBox;

private _array = [];
{
    _array pushBack [
        [
            _x, //getText ([QGVAR(crates), _x, configNull] call EFUNC(catalog,getEntry) >> "displayName");
            "0"
        ],  // Text
        [
            0
        ],  // value
        [
            _x
        ]   // Data // Config Name
    ]
} forEach _crates;

_display setVariable [QGVAR(maxCrates), 3];
_display setVariable [QGVAR(totalCrates), 0];

lnbAddArray [ CVO_IDC_CSC_Crates_ListNBox, _array ];

[] call FUNC(ui_crates_check_amount); // update the + and - button 
