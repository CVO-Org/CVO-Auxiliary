#include "../../script_component.hpp"

/*
* Author: Zorn
* Function to get the data from a config entry. Returns an array of classnames.
*
* Arguments:
*
* Return Value:
* Array of Classnames
*
* Example:
* ['something', player] call prefix_component_fnc_functionname
*
* Public: No
*/


params [
    [ "_cfg",   configNull, [configNull] ],
    [ "_roles", "404",      [[]]         ]
];

if (_roles isEqualTo "404") then { _roles = [ace_player] call FUNC(getUnitRoles); };

private _role = toLowerANSI getText (_cfg >> "role");

if !(_role in _roles) exitWith {[]};

// Check Addon Dependency
private _dependency = getText (_cfg >> "addon_dependency");
if ( _dependency isNotEqualTo "" && {! isClass ( configFile >> "CfgPatches" >> _dependency ) } ) exitWith  { [] };

//// Handle Condition
private _conditionString = getText (_cfg >> "condition");

private _conditionCode = switch (true) do {
    case (_conditionString isEqualTo ""): { {true} };               // undefined, returns true
    case (isNil _conditionString): { compile _conditionString };    // its not a function
    default { _conditionString };                                   // its a function
};

private _conditionResult = [ace_player] call _conditionCode;

// Handle nil as false
if (isNil "_conditionResult") then {
    ERROR_1("Config [%1] bad condition return",configName _cfg);
    _conditionResult = false;
};
if (!_conditionResult) exitWith { [] };



//// Handle Return Array
private _returnArray = [];


//// Get Item Classes
_returnArray append ("true" configClasses (_cfg >> "items") apply { configName _x });


//// Resolve Code
private _codeString = getText (_cfg >> "code");
private _codeCode = switch (true) do {
    case (_codeString isEqualTo ""): { {[]} };              // undefined, returns empty array
    case (isNil _codeString): { compile _conditionString }; // its not a function
    default { _codeString };                                // its a function
};

private _codeResult = [ace_player] call _codeCode;
if !(_codeResult isEqualType []) then { _codeResult = []; };
_returnArray append _codeResult;


_returnArray
