#include "../../script_component.hpp"

/*
* Author: Zorn
* Function to add musicEventHandlers
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

addMusicEventHandler ["MusicStart", {
    params ["_musicClassname", "_eventHandlerId", "_currentPosition", "_totalLength"];

    [_musicClassname] call FUNC(updateHistory);

    if ( SET(systemChatCurrentMusic) ) then {
        private _track = getText ( [configFile, missionConfigFile] select (isClass (missionConfigFile >> "CfgMusic" >> _musicClassname)) >> "CfgMusic" >> _musicClassname >> "name" );
        systemChat format ["Currently Playing: %1",_track];
    };
}];
