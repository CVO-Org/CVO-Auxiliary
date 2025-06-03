#include "../../script_component.hpp"

/*
* Author: Zorn
* API Function for Mission Makers or Similar to add a roleKit to the catalog.
*
* Arguments:
*
* Return Value:
* None
*
* Example:
* ['something', player] call prefix_component_fnc_functionname
*
* Public: Yes
*/
params [
    ["_role",  "", [[]] ],
    ["_items", [], [[]] ],
    ["_cond",  {}, [{}] ],
    ["_code",  {}, [{}] ],
    ["_dependency", "", [""] ]
];

// Check Addon Dependency
if ( _dependency isNotEqualTo "" && {! isClass ( configFile >> "CfgPatches" >> _dependency ) } ) exitWith { false };


if (_role isEqualTo "") exitWith { false };
_items = _items select { _x isEqualType "" } select { _x call CBA_fnc_getItemConfig isNotEqualTo configNull };


private _entry = createHashMapFromArray [
    ["role",  toLowerANSI getText (_cfg >> "role") ],
    ["items", _items],
    ["condition", _cond],
    ["code", _code]
];

["", _entry] call FUNC(setRoleKit);

true
