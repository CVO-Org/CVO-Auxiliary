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
    ZRN_LOG_MSG_1(mEH triggered - started,_this);
	params ["_musicClassname", "_eventHandlerId", "_currentPosition", "_totalLength"];

    [_musicClassname] call FUNC(updateHistory);
}];
