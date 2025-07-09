#include "../../script_component.hpp"
/*
* Author: Zorn
* DELIVERY Function. Just teleports the crates, one after another at the desired location.
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

params [ "_request", "_params" ];

private _list = _request get "crates";

private _destination = _request get "destination";

private _recursive = {
    params ["_list", "_destination", "_recursive"];

    private _crate = _list deleteAt 0;
    _crate setVehiclePosition [_destination, [], 5];
    _crate setPosASL (getPosASL _crate vectorAdd [0,0,1]);

    if (_list isEqualTo []) exitWith {};
    [_recursive, [_list, _destination, _recursive], 0.1] call CBA_fnc_waitAndExecute;
};

[_recursive, [_list, _destination, _recursive], 0.1] call CBA_fnc_waitAndExecute;
