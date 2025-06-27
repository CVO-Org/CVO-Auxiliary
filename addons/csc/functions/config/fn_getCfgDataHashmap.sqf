#include "../../script_component.hpp"

/*
* Author: Zorn
* Function to return all properties of an class as a hashmap.
*
* Arguments:
* 0: config
*
* Return Value:
* hashmap or nil
*
* Example:
* [_cfg] call cvo_csc_fnc_getCfgDataHashmap;
*
* Public: No
*/

params [
    [ "_cfg", configNull, [configNull] ]
];

if !(isClass _cfg || { isNull _cfg } ) exitWith { nil };

private _properties = configProperties [_cfg];

private _returnHashMap = createHashMap;

{
    private _config = _x;
    private _value = _x call BIS_fnc_getCfgData;

    private _value = switch (_value) do {
        case "true": { true };
        case "false": { false };
        default { _value };
    };

    _returnHashMap set [
        configName _x,
        _value
    ];
    
} forEach _properties;

_returnHashMap // return
