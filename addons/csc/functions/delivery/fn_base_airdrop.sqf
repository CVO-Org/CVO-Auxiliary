#include "../../script_component.hpp"

/*
* Author: Zorn
* DELIVERY - Function to handle the 
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

params [ "_request", "_parameters" ];

ZRN_LOG_1(_this);

// Starting Position
private _startPos = _parameters getOrDefault ["pos_start", [0,0,1000]];
_startPos set [2, 0 max (ATLToASL _startPos # 2) + 100];

// Target Position
private _targetPos = _request getOrDefault ["destination", [0,0,0]];

// Create Aircraft
private _aircraft = createVehicle [(_parameters getOrDefault ["airframe_class", "C_Heli_Light_01_civil_F"]), [0,0,0], [], 0, "FLY"];

_aircraft flyInHeight [_parameters getOrDefault ["airdrop_alt",150], _parameters getOrDefault ["airdrop_alt_forced", true]];
_aircraft flyInHeightASL (_parameters getOrDefault ["airdrop_flyInHeightASL", [50,50,50]]);

private _side = switch (_parameters getOrDefault ["airframe_side", "CIV"]) do {
    case "WEST": { west };
    case "EAST": { east };
    case "GUER": { independent };
    case "CIV":  { civilian };
    default { civilian };
};

private _grp = _side createVehicleCrew _aircraft;
_grp addVehicle _aircraft;
_grp setCombatBehaviour "CARELESS";
_grp deleteGroupWhenEmpty true;

//  Manage ACE HC Blacklist
[[_aircraft] + units _grp, true] call ace_headless_fnc_blacklist;

// Place and Rotate Plane
_aircraft setPosASL _startPos;
private _dir = (_startPos getDir _targetPos);
_aircraft setDir _dir;

// If enabled, make Asset Invincible
if (_parameters getOrDefault ["airframe_protected", true]) then {
    { _x allowDamage false; } forEach [_aircraft] + crew _aircraft;
};

// Provide Waypoints
_grp addWaypoint [_targetPos, 25];
_grp addWaypoint [_targetPos getPos [350, _dir], 25];

private _endpos = _parameters getOrDefault ["pos_end", [0,0,0]];

_endPos = switch true do {
    case (_endPos isEqualTo "RETURN"):   { _startPos };
    case (_endPos isEqualTo "CONTINUE"): { _targetPos getPos [10000, _dir] };
    case (_endPos isEqualType []):       { _endPos };
    default { [0,0,0] };
};

[
    {
        params ["_request", "_aircraft", "_parameters"];
        _request get "destination" distance2D _aircraft < 50
    },
    {
        params ["_request", "_aircraft", "_parameters"];
        private _crates = _request get "crates";

        private _recursive = {
            params ["_crates", "_vehicle", "_parameters", "_recursive"];
            private _crate = _crates deleteAt 0;
            [_crate, _vehicle, _parameters] call FUNC(parachuteCrate);

            if (_crates isEqualTo []) exitWith {};
            [ _recursive, [_crates, _vehicle, _parameters, _recursive], 3 ] call CBA_fnc_waitAndExecute;
        };

        [_crates, _vehicle, _parameters, _recursive] call _recursive;
    },
    [
        _request,
        _aircraft,
        _parameters
    ],
    _parameters getOrDefault ["timeout", 900],
    {
        params ["_request", "_aircraft", "_parameters"];
        deleteVehicleCrew _aircraft;
        deleteVehicle _aircraft;
        { deleteVehicle _x } forEach (_request get "crates");
    }
] call CBA_fnc_waitUntilAndExecute;
