#include "../../script_component.hpp"

/*
* Author: Zorn
* Function to scan configFile and missionConfigFile for CfgPlaylists classes and initialises them.
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

if !(isServer) exitWith {};

private _configs = [];

 _configs append ("true" configClasses (configFile >> "CfgPlaylists"));
 _configs append ("true" configClasses (missionConfigFile >> "CfgPlaylists"));

{ [_x] call FUNC(fromConfig) } forEach _configs;

nil
