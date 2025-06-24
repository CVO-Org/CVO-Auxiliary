#include "../../script_component.hpp"

/*
* Author: Zorn
* Function to run on UI's Unload.
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

diag_log format ['[CVO](debug)(fn_ui_onUnload) _this: %1', _this];

params ["_display", "_exitCode"];


private _handle = _display getVariable [QGVAR(pfh_handle), nil];
if !(isNil "_handle") then { _handle call CBA_fnc_removePerFrameHandler; };

diag_log format ['[CVO](debug)(fn_ui_onUnload) _display: %1 - vars: %2', _display , allVariables _display];

// Handle Teleportation
if (_exitCode isEqualTo 1) then {
    private _index = _display getVariable [QGVAR(curSel_index), -1];

    diag_log format ['[CVO](debug)(fn_ui_onUnload) _index: %1', _index];

    private _networkName = _display getVariable QGVAR(network);

    diag_log format ['[CVO](debug)(fn_ui_onUnload) _networkName: %1', _networkName];

    if (isNil "_networkName") exitWith {};
    
    private _network = [_networkName] call FUNC(network);
    private _destinations = _network get "destinations";
    private _destination = _destinations select _index;

    diag_log format ['[CVO](debug)(fn_ui_onUnload) _network: %1', _network];
    diag_log format ['[CVO](debug)(fn_ui_onUnload) _destinations: %1', _destinations];
    diag_log format ['[CVO](debug)(fn_ui_onUnload) _destination: %1', _destination];

    [nil, ACE_player, [_destination]] call FUNC(teleport);
};
