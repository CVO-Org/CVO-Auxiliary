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
* ['something', player] call cvo_arsenal_fnc_handleConfigKits
*
* Public: No
*/

if !(hasInterface) exitWith {};

private _configs = [];

_configs append ( Q(configName _x isNotEqualTo QQ(Base)) configClasses (configFile >> QGVAR(kits)) );
_configs append ( Q(configName _x isNotEqualTo QQ(Base)) configClasses (missionConfigFile >> QGVAR(kits)) );

{
    [
        [_x] call FUNC(getKitFromCfg),
        configName _x
    ] call FUNC(addKit);
} forEach _configs;
