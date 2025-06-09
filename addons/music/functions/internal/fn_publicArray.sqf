#include "../../script_component.hpp"

/*
* Author: Zorn
* Function to update and publish array of playlists which is used for zeus interaction.
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

params [ "_hashmap" ];

private _previousKeys = GETMGVAR(playlists_public,[]);

private _newKeys = keys  _hashmap select { !( "_pool" in _x ) && { count (_hashMap get _x) > 0 } };

if ( _previousKeys isNotEqualTo _newKeys ) then { SETMGVAR_PUBLIC(playlists_public,_newKeys,true);};
