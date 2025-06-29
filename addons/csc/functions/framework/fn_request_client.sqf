#include "../../script_component.hpp"

/*
* Author: Zorn
* Funciton to handle the request the client to be sent to the server.
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



params [ "_box", "_destination", "_deliveryMethod" ];

[QGVAR(EH_request), [_box, _destination, _deliveryMethod]] call CBA_fnc_serverEvent;
