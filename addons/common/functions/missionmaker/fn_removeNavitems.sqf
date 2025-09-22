/*
* Author: Zorn
* Function to remove Navigational Items (and radio) from units.
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
    ["_units",   [],    [objNull,[]] ],
    ["_map",     true,  [true]       ],    
    ["_gps",     true,  [true]       ],
    ["_compass", true,  [true]       ],
    ["_radio",   false, [true]       ],
    ["_watch",   false, [true]       ]
];


if ( _units isEqualType objNull ) then { _units = [ _units ] };

private _unit = _units deleteAt 0;

if (isNull _unit) exitWith {};

_unit setUnitLoadout [
    nil,
    nil,
    nil,
    nil,
    nil,
    nil,
    nil,
    nil,
    nil,
    [
        [ nil, "" ] select _map,
        [ nil, "" ] select _gps,
        [ nil, "" ] select _radio,
        [ nil, "" ] select _compass,
        [ nil, "" ] select _watch,
        nil // NVG
    ]
];

if (count _units > 0) then {
    _statement = {};
    _parameters = [];
    [zrn_fnc_removeNavItems, _this, 5] call cba_fnc_execAfterNFrames;
};


/*
// EXAMLPE HOW TO USE
// RUN postInit

[{
    diag_log "[CVO](debug)(fn_init) inital remove";
    [ allUnits - allPlayers, true, true, false, false, false ] call cvo_common_fnc_removeNavItems;

} , [], 1] call CBA_fnc_waitAndExecute;


addMissionEventHandler ["EntityCreated", {
	params ["_entity"];
    if (_entity isKindOf "CAManBase") then { [ { [ _this#0, true, true, false, false, false ] call cvo_common_fnc_removeNavItems; }, [ _entity ], 1 ] call CBA_fnc_waitAndExecute; };
}];


*/