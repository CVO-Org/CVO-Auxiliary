#include "../../script_component.hpp"

/*
* Author: Zorn
* Function to run onLoad for cvo_deploy_dialog.
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


_condition = { _this#0 getVariable [QGVAR(network), "404"] isNotEqualTo "404" };                // condition - Needs to return bool
_statement = {
    params [ "_dialog", "_cfg" ];

    private _networkName = _dialog getVariable [QGVAR(network), "404"];

    private _network = [_networkName] call FUNC(network);

    private _destinations = _network get "destinations";

    if (isNil "_destinations") exitWith { diag_log "[CVO](debug)(fn_ui_onLoad) Failed - _destinations not defined ";};

    private _ctrl_listbox = _dialog displayCtrl 1500;
    {
        diag_log format ['[CVO](debug)(fn_ui_onLoad) _x: %1', _x];
        private _destination = _x;
        private _str = [_destination] call FUNC(getName);
        private _index = _ctrl_listbox lbAdd _str;
    } forEach _destinations;


    diag_log format ['[CVO](debug)(fn_ui_onLoad) _dialog: %1 - _network: %2', _dialog , _network];

    private _handle = [FUNC(ui_update), 1, [_dialog, _network] ] call CBA_fnc_addPerFrameHandler;
    _dialog setVariable [QGVAR(pfh_handle), _handle];

};


[
    _condition,
    _statement,
    _this
] call CBA_fnc_waitUntilAndExecute;



