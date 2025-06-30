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

private _target = _requestHashmap getOrDefault ["target", objNull];
if (isNull _target) exitWith { ZRN_LOG_MSG_2(Failed - Target Undefined,_requestHashmap,_paramsHashmap); };


private _mode = _paramsHashmap getOrDefault ["mode", "BEHIND"];

switch (_mode) do {
    case "BEHIND": {
        private _maxSize = selectMax (_requestHashmap get "crates" apply { getText (_x >> "box_class") call EFUNC(common,getSizeOf) });
        _target getRelPos [ (_target call BIS_fnc_boundingBoxDimensions select 0) / 2 + 3 + _maxSize, 180 ];
    };
    
    case "OFFSET": {
        private _offset = _paramsHashmap getOrDefault ["offset", [0,0,2]];
        getPosASL _target vectorAdd _offset
    };
    
    default { [0,0,0] };
} // Return
