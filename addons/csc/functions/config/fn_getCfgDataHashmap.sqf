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

private _convertApply = {
    switch (true) do {
        case (_x isEqualType [] ): { _x apply _convertApply };
        case (_x isEqualTo "true"): { true };
        case (_x isEqualTo "false"): { false };
        case (_x isEqualTo "(true)"): { true };
        case (_x isEqualTo "(false)"): { false };
        default { _x };
    };
};

private _convertCall = {
    switch (true) do {
        case (_this isEqualType [] ): { _this apply _convertApply };
        case (_this isEqualTo "true"): { true };
        case (_this isEqualTo "false"): { false };
        case (_this isEqualTo "(true)"): { true };
        case (_this isEqualTo "(false)"): { false };
        default { _this };
    };
};

{
    private _config = _x;
    private _value = _x call BIS_fnc_getCfgData call _convertCall;

    _returnHashMap set [
        configName _x,
        _value
    ];
    
} forEach _properties;

_returnHashMap // return
