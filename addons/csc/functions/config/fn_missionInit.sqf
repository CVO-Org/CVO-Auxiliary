#include "../../script_component.hpp"

/*
* Author: Zorn
* This Mission Init Function will create 3 GVAR Hashmaps which stores the individual presets from both configFile and missionConfigFile with the configName as a key and the configpath as the value.
* MissionConfigFile entries will overwrite configFile entries, overwriting them.
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


{
    private _type = _x;
    private _configs = [];
    _configs append ( Q(configName _x isNotEqualTo QQ(Base)) configClasses (       configFile >> QADDON >> _type) );
    _configs append ( Q(configName _x isNotEqualTo QQ(Base)) configClasses (missionConfigFile >> QADDON >> _type) );

    { [_type, configName _x, _x] call EFUNC(catalog,setEntry); } forEach _configs;

} forEach [ QGVAR(crates), QGVAR(destinations), QGVAR(delivery_modes) ];
