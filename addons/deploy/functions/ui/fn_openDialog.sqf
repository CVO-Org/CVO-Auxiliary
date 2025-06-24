#include "../../script_component.hpp"

/*
* Author: Zorn
* Function to open the Deploy Dialog and attach neccessary Data
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

params [
    [ "_networkName", "Default", [""] ]
];

private _dialog = createDialog [QGVAR(dialog), true];
_dialog setVariable [QGVAR(network), _networkName];

