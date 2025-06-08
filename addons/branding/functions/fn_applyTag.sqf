#include "../script_component.hpp"

/*
* Author: Zorn
* Function to apply the CVO-Tagging Tag to the member's profileNamespace
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


if (
    squadParams player isNotEqualTo [] && { squadParams player select 3 isEqualTo "183649" }
    &&
    {
        !(profileNamespace setVariable ["CVO-Tagging", false])
    }
) then {
    profileNamespace setVariable ["CVO-Tagging", true];
};
