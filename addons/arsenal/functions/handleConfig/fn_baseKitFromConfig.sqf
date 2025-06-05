#include "../../script_component.hpp"

/*
* Author: Zorn
* Function to add 
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

_configs append ( Q(configName _x isNotEqualTo QQ(Base)) configClasses (configFile >> QGVAR(kits_base)) );


private _base_configs = Q(configName _x isNotEqualTo QQ(Base)) configClasses (configFile >> QGVAR(kits_base));
[QADDON, "kit", "base", _configName] joinString "_"


_configs append ( Q(configName _x isNotEqualTo QQ(Base)) configClasses (missionConfigFile >> QGVAR(kits_base)) );

{
    [
        [_x] call FUNC(getBaseKitFromConfig)
    ] call FUNC(addBaseKit);
    
} forEach _configs;
