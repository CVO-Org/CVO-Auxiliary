#include "../../script_component.hpp"

/*
* Author: Zorn
* Function to open the CVO Custom Supply Crate Dialog.
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


params ["_target", "_player", "_params"];

_params params  ["_accessPoint"];

private _display = createDialog [QGVAR(dialog), true];

/*
private _network = [_networkName] call FUNC(network);

_display setVariable [QGVAR(network), _network];
_display setVariable [QGVAR(departure), _target];
*/
