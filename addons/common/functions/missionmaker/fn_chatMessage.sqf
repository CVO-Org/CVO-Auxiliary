#include "../../script_component.hpp"

/*
* Author: Zorn
* Function to simplify the usage of the sideChat, groupChat, ...
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
    ["_sender",     "Jimmethy",     [objNull, []], [2]  ],
    ["_message",    "TestMessage",  [""]                ],  // Text String or, if Radio, CfgRadio entry.
    ["_type",       "sidechat",     [""]                ],
    ["_addParams",  createHashMap,  [createHashMap]     ]
];

private _unit = switch (typeName _sender) do {
    case "OBJECT": { _object };
    case "ARRAY": {
        _sender params [ "_name", [ "_side", playerSide ] ];

        _side = switch (_side) do {
            case "WEST": { west };
            case "EAST": { east };
            case "GUER": { independent };
            case "CIV":  { civilian };
            default {
                switch (true) do {
                    case (_side in [west, east, independent, civilian]): { _side };
                    default { playerSide };
                };
            };
        };

        private _map = missionNamespace getVariable [QGVAR(chatMessageSenders), createHashMap];
        private _entry = _maps get _name;

        private _unit = if ( isNil "_entry" || { isNull _entry || { ! alive _entry } } ) then {
            private _grp = createGroup _side;
            _grp deleteGroupWhenEmpty true;
            private _unit = _grp createUnit [ "B_RangeMaster_F", [0,0,0] ];
            

            
            _unit allowDamage false;
            _map set [ _name, _unit ];
            _unit
        } else {
            _entry
        };

        private _varName = ["cvo", "chatMessageSender"] + (_sender splitString " ") joinString "_";
        if (isNil _varName) then {
            [
                {
                    [
                        {
                            missionNamespace getVariable _this < CBA_missionTime
                        },
                        {
                            deleteVehicle (missionNamespace getVariable _this);
                            missionNamespace setVariable [_this, nil, true];
                        },
                        _this
                    ] call CBA_fnc_waitUntilAndExecute;
                },
                _varName
            ] call CBA_fnc_execNextFrame;
        };
        missionNamespace setVariable [_varName, CBA_missionTime + 120, true];

        _unit
    };
};

[ QGVAR(EH_chatMessage), [ _unit, _message, _type, _addParams ] ] call CBA_fnc_globalEvent;

// TODO: wounder how to setup custom channel, but later.