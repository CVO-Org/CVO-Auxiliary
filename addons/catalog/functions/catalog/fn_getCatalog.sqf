#include "../../script_component.hpp"

/*
* Author: Zorn
* Function to retrieve a catalog (hashmap) and creating it if needed.
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
    [ "_catName", "", [""] ]
];

if (_catName isEqualTo "") exitWith { false };

private _catalog = missionNamespace getVariable [ [QPREFIX,_catName] joinString "_", nil ];

if (isNil "_catalog") then {
    _catalog = createHashMap;
    missionNamespace setVariable [ [QADDON,_catName] joinString "_", _catalog ];
};

_catalog
