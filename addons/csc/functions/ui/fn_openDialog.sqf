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
* [] call cvo_csc_fnc_openDialog;
*
* Public: No
*/


params [["_target", objNull], ["_player", ACE_player], ["_params", []]];

_params params [["_accessPoint", createHashMap]];

private _display = createDialog [QGVAR(request), true];

_display setVariable ["requester", _player];
_display setVariable ["target", _target];

{ _display setVariable [ _x, _accessPoint getOrDefault [_x, keys (missionNamespace getVariable _x)] ]; } forEach [ QGVAR(crates), QGVAR(destinations), QGVAR(delivery_modes) ];
