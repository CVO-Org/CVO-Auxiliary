#include "../../script_component.hpp"

/*
* Author: Zorn
* Function to create an Intel Item.
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

if !(isServer) exitWith {};

params [
    ["_object",             objNull,                [objNull]      ],
    ["_actionTitle",        "Action String",        [""]           ],
    ["_intelTitle",         "Diary Record Title",   [""]           ],
    ["_intelContent",       "Diary Body",           [""]           ],
    ["_actionSound",        "BODY",                 [""]           ],
    ["_removeObject",       true,                   [true]         ],
    ["_intelGroupName",     "General",              [""]           ],
    ["_actionDuration",     15,                     [0]            ]
];

if (_object isEqualTo objNull) exitWith { false };


// Store Intel in 
private _intelCatalog = [QGVAR(catalog)] call EFUNC(catalog,getCatalog);
private _id = [QPREFIX, QCOMPONENT, count keys _intelCatalog] joinString "_";

// Debug Mode
if ( is3DENPreview ) then {
    _str = format ["intel entry created: %1 - %2", _id, _object]; diag_log _str; systemChat _str;
    _actionDuration = 1;
};

// Create CBA Namespace for shared & jip compatible data.
private _namespace = true call CBA_fnc_createNamespace;

{
    _namespace setVariable [ _x#0, _x#1, true ];
} forEach [
    ["id",              _id             ],
    ["object",          _object         ],
    ["objectRemove",    _removeObject   ],
    ["actionTitle",     _actionTitle    ],
    ["actionSound",     _actionSound    ],
    ["actionDuration",  _actionDuration ],
    ["intelTitle",      _intelTitle     ],
    ["intelContent",    _intelContent   ],
    ["intelGroup",      _intelGroupName ],
    ["shareWith",       "SIDE"          ], // "GLOBAL", "SIDE", "GROUP", "UNIT" // TODO: CBA Setting for Default Value + propper param input
    // Internal
    ["intelFoundByAll",   false         ],
    ["intelFoundBySide",  []            ],
    ["intelFoundByGroup", []            ],
    ["intelFoundByUnit",  []            ]
];

missionNamespace setVariable [_id, _namespace, true];

[ QGVAR(EH_addIntelAction), [_object, _id, _actionTitle, _actionSound, _actionDuration], _object] call CBA_fnc_globalEventJIP;


// Update Public Intel Catalog
_intelCatalog set ["id", _namespace];
missionNamespace setVariable [QGVAR(catalog), _intelCatalog, true];
