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

// Un-used alternative to cba globalJIP. not needed anymore. delete later maybe.

if !(hasInterface) exitWith {};

diag_log format ['[CVO](debug)(fn_client_init) diag_frameNo: %1', diag_frameNo];

[
    { !isNil QGVAR(globalAccesspointArray) },
    {
        ZRN_LOG_MSG(GlobalAccessPoints detected - applying Actions);
        GVAR(globalAccesspointArray) call FUNC(addAction);

        diag_log format ['[CVO](debug)(fn_client_init WUAE) diag_frameNo: %1', diag_frameNo];
    },
    "",
    90,
    { ZRN_LOG_MSG(globalAccesspointArray not found - timeout); }
] call CBA_fnc_waitUntilAndExecute;
