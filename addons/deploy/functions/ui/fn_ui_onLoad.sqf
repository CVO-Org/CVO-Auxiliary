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

params [ "_dialog", "_cfg" ];

private _network = _dialog getVariable [QGVAR(network), "404"];

diag_log format ['[CVO](debug)(fn_dialog_onLoad) _this: %1 - _network: %2', _this , _network];
