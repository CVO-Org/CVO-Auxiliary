#include "../../script_component.hpp"

/*
* Author: Zorn
* Function to get the data from a config entry.
*
* Arguments:
*
* Return Value:
* HashMap
*
* Example:
* ['something', player] call prefix_component_fnc_functionname
*
* Public: No
*/


/*
    class Base {
        role = "";
        condition = "true";
        addon_dependency = "";
        class items {};
        code = ""; // needs to return array
    };
*/

params [
    [ "_cfg",   configNull, [configNull] ]
];


// Check Addon Dependency
private _dependency = getText (_cfg >> "addon_dependency");
if ( _dependency isNotEqualTo "" && {! isClass ( configFile >> "CfgPatches" >> _dependency ) } ) exitWith  { nil };



//// Handle Condition
private _conditionString = getText (_cfg >> "condition");
private _conditionCode = switch (true) do {
    case (_conditionString isEqualTo ""): { {true} };               // undefined, returns true
    case (isNil _conditionString): { compile _conditionString };    // its not a function
    default { _conditionString };                                   // its a function
};

//// Handle Code
private _codeString = getText (_cfg >> "code");
private _codeCode = switch (true) do {
    case (_codeString isEqualTo ""): { {[]} };         // undefined, returns empty array
    case (isNil _codeString): { compile _codeString }; // its not a function
    default { _codeString };                           // its a function
};

private _items = "true" configClasses (_cfg >> "items") apply { configName _x };
_items = _items select { _x call CBA_fnc_getItemConfig isNotEqualTo configNull }; // rm entries that does not exist


// Create entry-hashmap to be returned
createHashMapFromArray [
    ["role",  toLowerANSI getText (_cfg >> "role") ],
    ["items", _items ],
    ["condition", _conditionCode],
    ["code", _codeCode]
]
