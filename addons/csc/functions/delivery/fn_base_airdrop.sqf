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


// Starting Position
private _startPos = _parameters getOrDefault ["pos_start", [0,0,1000]];
_startPos set [2, 0 max (ATLToASL _startPos # 2) + 100];

// Target Position
private _targetPos = _request getOrDefault ["Destination", [0,0,0]];


// Create Aircraft
private _aircraft = createVehicle [(_parameters get "airframe_class"), [0,0,0], [], 0, "FLY"];

_aircraft flyInHeight [_parameters getOrDefault ["airdrop_alt",150], _parameters getOrDefault ["airdrop_alt_forced", true]];
_aircraft flyInHeightASL (_parameters getOrDefault ["airdrop_flyInHeightASL", [50,50,50]]);

private _grp = (_parameters get "airframe_side") createVehicleCrew _aircraft;
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
_grp addWaypoint [_targetPos getPos [250, _dir], 25];

private _endpos = _parameters getOrDefault ["airdrop_pos_end", [0,0,0]];

_endPos = switch true do {
    case (_endPos isEqualTo "RETURN"):   { _startPos };
    case (_endPos isEqualTo "CONTINUE"): { _targetPos getPos [10000, _dir] };
    case (_endPos isEqualType []):       { _endPos };
    default { [0,0,0] };
};

[
    {
        params ["_request", "_parameters", "_aircraft"];
    },
    {
        params ["_request", "_parameters", "_aircraft"];
    },
    [
        _request,
        _parameters,
        _aircraft
    ],
    _parameters getOrDefault ["timeout", 600],
    {
        params ["_request", "_parameters", "_aircraft"];
    }
] call CBA_fnc_waitUntilAndExecute;









/*

private _posAircraft = getPosASL _aircraft;

private _offsetBox   = boundingBox _box select 2;
private _offsetAir   = boundingBox _aircraft select 2;
private _offsetTotal = _offsetAir + _offsetBox;

private _spawnPos = if ((_posAircraft # 2 - _offsetTotal) > MIN_ALTITUDE) then {
    ZRN_LOG_MSG(DROPPED Beneath);
    [ _posAircraft # 0, _posAircraft # 1, _posAircraft # 2 - _offsetTotal ]
} else {
    ZRN_LOG_MSG(DROPPED Behind);
    _aircraft getRelPos [_offsetTotal, 180]
};






if (_entry getOrDefault ["airdrop_attachSmoke", ""]) then {
    private _smoke = createVehicle [_entry get "airdrop_class_smoke", [0,0,10], [], 0, "CAN_COLLIDE"];
    _smoke attachTo [attachedTo _box, [0,0,0]];
};

*/