#include "../../script_component.hpp"

/*
* Author: Zorn
* "Recursive" Function to iterate over the kits one after another
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
    [ "_box",   objNull,                 [objNull]       ],
    [ "_unit",  ACE_player,              [objNull]       ],
    [ "_roles", [],                      [[]]            ],
    [ "_id64",  getPlayerUID ACE_player, [""]            ],
    [ "_kits",  createHashMap,           [createHashMap] ]
];

if (isNull _box) exitWith {};
if (count _kits == 0) exitWith {};


private _nextIteration = {
    [FUNC(addItemsFromKit_recursive), [_box, _unit, _roles, _id64, _kits]] call CBA_fnc_execNextFrame;
};

private _returnArray = [];

private _kitKeys = keys _kits;
_KitKeys sort true;
private _kitName = _KitKeys select 0;
private _kit = _kits deleteAt _kitName;

ZRN_LOG_1(_kitName);

// #### Check if Setting for Default Kits
private _settingName = [QADDON, _kitName] joinString "_";
if (!isNil _settingName && { !(missionNamespace getVariable _settingName) } ) exitWith _nextIteration;



// #### Check Roles ####
private _role = _kit get "role";
if (_role isNotEqualTo "" && { !( _role in _roles) }) exitWith _nextIteration;


// #### Check ID64 ####
private _id64 = _kit get "id64";
if (_id64 isNotEqualTo "" && { _playerUID isNotEqualTo _id64 }) exitWith _nextIteration;


private _items = _kit get "items";


// #### Condition ####
private _conditionCode = _kit get "condition";
private _conditionResult = [_unit, _items] call _conditionCode;

// validate Return
if (isNil "_conditionResult" || { typeName _conditionResult isNotEqualTo "BOOL" }) then {
    ERROR_1("Bad condition return for Kit: %1",_kitName);
    _conditionResult = false;
};

if (!_conditionResult) then { continue };
ZRN_LOG_MSG_1(Added:,_kitName);

_returnArray append _items;


// #### Code ####
private _codeCode = _kit get "code";
private _codeResult = if (_codeCode isNotEqualTo {}) then {
    [_unit, _items] call _codeCode;
} else {[]};

// Validate Return
switch (true) do {
    case ( isNil "_codeResult" ):      { _codeResult = []; };
    case (_codeResult isEqualType ""): { _codeResult = [_codeResult]; };
};
_codeResult = _codeResult select { _x call CBA_fnc_getItemConfig isNotEqualTo configNull };
_returnArray append _codeResult;

// Add stuff to the Arsenal
[_box, _returnArray arrayIntersect _returnArray] call ace_arsenal_fnc_addVirtualItems;

call _nextIteration;

nil
