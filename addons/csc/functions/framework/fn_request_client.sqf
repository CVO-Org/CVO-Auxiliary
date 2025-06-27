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



params [
    [ "_box",            objNull,    [objNull]               ],
    [ "_destination",    [0,0,0],    [[], objNull],  [2,3]   ],
    [ "_deliveryMethod", [0,0,0],    [[], objNull],  [2,3]   ]
];








[QGVAR(EH_request), []] call CBA_fnc_serverEvent;
