#include "../../script_component.hpp"

/*
* Author: Zorn
* Function to return a fixed position from the cfg parameters
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

params [ "_requestHashmap", "_paramsHashmap" ];

private _reference = _paramsHashmap getOrDefault ["reference", objNull];

_reference = switch (_reference) do {
    case "PLAYER": { _requestHashmap getOrDefault ["requester", ACE_Player] };
    case "TARGET": { _requestHashmap getOrDefault ["target", objNull] };
    case objNull: { objNull };
    default {
        if (!isNil _reference) then { missionNamespace getVariable _reference } else { objNull };
    };
};

if (isNull _reference) exitWith { [0,0,0] };

private _mode = _paramsHashmap getOrDefault ["mode", "FRONT"];

switch (_mode) do {
    case "FRONT": {
        private _maxSize = selectMax (_requestHashmap get "crates" apply { getText (([QGVAR(crates), _x] call EFUNC(catalog,getEntry)) >> "box_class") call EFUNC(common,getSizeOf) });
        _reference getRelPos [ (_reference call BIS_fnc_boundingBoxDimensions select 0) / 2 + 3 + _maxSize, 0 ];
    };

    case "BEHIND": {
        private _maxSize = selectMax (_requestHashmap get "crates" apply { getText (([QGVAR(crates), _x] call EFUNC(catalog,getEntry)) >> "box_class") call EFUNC(common,getSizeOf) });
        _reference getRelPos [ (_reference call BIS_fnc_boundingBoxDimensions select 0) / 2 + 3 + _maxSize, 180 ];
    };
    
    case "OFFSET": {
        private _offset = _paramsHashmap getOrDefault ["offset", [2,0,2]];
        getPosASL _reference vectorAdd _offset
    };
    
    default { [0,0,0] };
} // Return
