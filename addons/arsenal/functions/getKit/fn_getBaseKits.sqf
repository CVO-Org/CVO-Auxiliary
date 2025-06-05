#include "../../script_component.hpp"

/*
* Author: Zorn
* Function to retrieve the base kit from configFile based on cba settings and from missionConfigFile.
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

private _returnArray = [];

// Handle Base Kits from Config
private _configs = [];
//// Handle configFile - get all related entries from configFile beside base - then select only those who's cba setting is true
_configs append ( Q(configName _x isNotEqualTo QQ(Base)) configClasses (configFile >> QGVAR(kits_base)) select { missionNamespace getVariable [ [QADDON, "kit", "base", configName _x] joinString "_", false ]; } ) ;

//// Handle MissionConfigFile - get all relatead entries from MissionConfigFile beside base - then select only those who's cba setting is true
_configs append ( Q(configName _x isNotEqualTo QQ(Base)) configClasses (missionConfigFile >> QGVAR(kits_base)) select { missionNamespace getVariable [ [QADDON, "kit", "base","mission" configName _x] joinString "_", false ]; } ) ;

//// Evaluate all valid configs
{ _returnArray append ( [_x] call FUNC(getBaseKitFromConfig) ); } forEach _configs;


// Handle base kit entries added through script via addBaseKit
_returnArray append ( missionNamespace getVariable [QGVAR(kit_base), []] );


// Handle API
_returnArray append ( missionNamespace getVariable [QGVAR(kit_base_API), []] );


// return and f
_returnArray arrayIntersect _returnArray
