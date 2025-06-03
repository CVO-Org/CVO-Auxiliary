#include "../../script_component.hpp"

/*
* Author: Zorn
* Function to store the kit for a role.
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
    [ "_key", "", [""] ],
    ["_entry", "", [createHashMap] ]
];

if (_entry isEqualTo "") exitWith { false };

if (_key isEqualTo "") then {
    private _cat = call EFUNC(catalog,getCatalog);
    private _keys = keys _cat;
    private _index = count _keys;

    while { str _index in _keys } do { _index = _index + 1; };
    _key = str _index;
};

["arsenal_kit_role", _key, _entry] call EFUNC(catalog,setEntry);

true
