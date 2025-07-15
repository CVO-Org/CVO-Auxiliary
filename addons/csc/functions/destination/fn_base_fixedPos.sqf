#include "../../script_component.hpp"

/*
* Author: Zorn
* Function to return a fixed position from the cfg parameters
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

params [ "_requestHashmap", "_paramsHashmap" ];

private _return = _paramsHashmap getOrDefault ["position", [0,0,0]];

ZRN_LOG_1(_return);

_return
