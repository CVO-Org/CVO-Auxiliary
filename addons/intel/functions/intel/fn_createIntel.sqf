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
* Public: No
*/

if !(isServer) exitWith {};

params [
    ["_objectInput",    objNull,                ["", objNull]   ],
    ["_displayName",    "Action String",        [""]            ],
    ["_title",          "Diary Record Title",   [""]            ],
    ["_structuredText", "Diary Body",           [""]            ],
    ["_soundType",      "BODY",                 [""]            ],
    ["_removeObject",   true,                   [true]          ],
    ["_intelGroup",     "Intel Items",          [""]            ],
    ["_duration",       15,                     [0]             ]
];

switch (typeName _objectInput) do {
    case "OBJECT": {
        private _counter = missionNamespace getVariable [QGVAR(counter), 0];
        missionNamespace setVariable [QGVAR(counter), _counter + 1];
        private _varName = [QPREFIX, QCOMPONENT, "object", _counter] joinString "_";
        missionNamespace setVariable [_varName, _objectInput, true];
        [_objectInput, _varName]
    };
    case "STRING": {
        [missionNamespace getVariable _objectInput, _objectInput]
    };
} params ["_object", "_varName"];


if (_object isEqualTo objNull) exitWith {};
if (_intelGroup isNotEqualTo "") then { [_intelGroup, _varName] call FUNC(addIntelToGroup) };


if ( is3DENPreview ) then { _str = format ["intel action added to: %1 - %2", _this#0, _object]; diag_log _str; systemChat _str; };
if ( is3DENPreview ) then { _duration = 1; };


[ CBA_fnc_globalEventJIP , [ QGVAR(EH_addIntelAction), [_object, 0, _removeObject, _displayName, _soundType, _duration, _title, _structuredText], _varName], 1] call CBA_fnc_waitAndExecute;
[_varName, _object] call CBA_fnc_removeGlobalEventJIP; // Will remove the JIP if the object has already been picked up.
