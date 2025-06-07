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
        id64 = "";
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

//// Convert Condition code
private _conditionCode = getText (_cfg >> "condition") call EFUNC(common,convertStringCode);

//// Convert Code code
private _codeCode = getText (_cfg >> "code") call EFUNC(common,convertStringCode);

//// Retrieve Items
private _items = "true" configClasses (_cfg >> "items") apply { configName _x };
_items = _items select { _x call CBA_fnc_getItemConfig isNotEqualTo configNull }; // rm entries that does not exist


// Create entry-hashmap to be returned
createHashMapFromArray [
    ["id64",  getText (_cfg >> "id64")],
    ["role",  toLowerANSI getText (_cfg >> "role")],
    ["items", _items],
    ["condition", _conditionCode],
    ["code", _codeCode]
]
