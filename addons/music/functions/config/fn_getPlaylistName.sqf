#include "../../script_component.hpp"

/*
* Author: Zorn
* function to retrieve the Name of a playlist, ether configFile or missionConfigFile. If 
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
    ["_className",        "",         [""]       ]
];

private _cfgPath = switch (true) do {
    case ( isClass ( missionConfigFile >> "CfgPlaylist" >> _className) ): { missionConfigFile >> "CfgPlaylist" >> _className };
    case ( isClass ( configFile >> "CfgPlaylist" >> _className) ):        { configFile >> "CfgPlaylist" >> _className };
};

private _title = getText ( _cfgPath >> "name");
if (_title == "") then {_title = _className};

_title // return
