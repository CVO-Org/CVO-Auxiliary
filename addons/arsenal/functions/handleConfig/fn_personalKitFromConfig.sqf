#include "../../script_component.hpp"

/*
* Author: Zorn
* Function to retrieve RoleKits from Config (mod and mission) and stores it in RoleKit Hashmap.
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

private _configs = [];

_configs append ( Q(configName _x isNotEqualTo QQ(Base)) configClasses (configFile >> QGVAR(kits_personal)) );
_configs append ( Q(configName _x isNotEqualTo QQ(Base)) configClasses (missionConfigFile >> QGVAR(kits_personal)) );

{
    [
        configName _x,
        [_x] call FUNC(getPersonalKitFromConfig)
    ] call FUNC(setPersonalKit);
    
} forEach _configs;