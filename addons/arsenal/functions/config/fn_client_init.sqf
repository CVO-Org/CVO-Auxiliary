#include "../../script_component.hpp"

/*
* Author: Zorn
* Function to handle the init of the arsenal access points on the individual clients.
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

if !(hasInterface) exitWith {};
[
    { !isNil QGVAR(globalAccesspointArray) },
    {
        ZRN_LOG_MSG(GlobalAccessPoints detected - applying Actions);
        GVAR(globalAccesspointArray) call FUNC(addAction);
    },
    "",
    60,
    { diag_log '[CVO](debug)(fn_client_init) no globalAccesspointArray found - timeout' }
] call CBA_fnc_waitUntilAndExecute;

