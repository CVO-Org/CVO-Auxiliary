#include "../../script_component.hpp"

/*
* Author: Zorn
* Function to get the data from a config entry. Returns an array of classnames.
*
* Arguments:
*
* Return Value:
* Array of Classnames or empty Array
*
* Example:
* ['something', player] call prefix_component_fnc_functionname
*
* Public: No
*/


params [
    [ "_cfg",   configNull, [configNull] ],
    [ "_type",  "BASE",     [""]         ]
];

// Check Addon Dependency
private _dependency = getText (_cfg >> "addon_dependency");
if ( _dependency isNotEqualTo "" && {! isClass ( configFile >> "CfgPatches" >> _dependency ) } ) exitWith  { [] };

// Handle Condition
private _conditionString = getText (_cfg >> "condition");
private _conditionCode = switch (true) do {
    case (_condition isEqualTo ""): { {true} };
    case (isNil _conditionString):  { compile _conditionString };
    default { _conditionString };
};

private _conditionResult = [ace_player] call _conditionCode;

// Handle nil as false
if (isNil "_conditionResult") then {
    ERROR_1("Config [%1] bad condition return",configName _cfg);
    _conditionResult = false;
};

if (!_conditionResult) exitWith { [] };


/*
    class Base {
        id = "";
        condition = "true";
        addon_dependency = "";
        class items {};
        code = ""; // needs to return array
    };
*/
