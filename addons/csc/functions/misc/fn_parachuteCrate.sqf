#include "../../script_component.hpp"

/*
* Author: Zorn
* Function to take a Crate, put it to a certain position and parachute it.
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

//    ["_strobeClassName", "ACE_IR_Strobe_Effect"]
params [
    "_object",
    "_vehicle",
    "_parameters"
];


(boundingBoxReal _vehicle) params ["_bb1", "_bb2"];
private _distBehind = ((_bb1 select 1) min (_bb2 select 1)) - 4; // 4 meters behind max bounding box
private _posBehindVehicleAGL = _vehicle modelToWorld [0, _distBehind, -2];


_object setPosASL (AGLToASL _posBehindVehicleAGL);
["ace_common_setVelocity", [_object, (velocity _vehicle) vectorAdd ((vectorNormalized (vectorDir _vehicle)) vectorMultiply -5)], _object] call CBA_fnc_targetEvent;


// Open parachute and IR light effect
[{
    params ["_object", "_params"];

    if (isNull _object || {getPos _object select 2 < 1}) exitWith {};

    private _parachute = createVehicle [_params getOrDefault ["parachute_class", "B_Parachute_02_F"], [0, 0, 0], [], 0, "CAN_COLLIDE"];

    // Prevent collision damage
    ["ace_common_fixCollision", _parachute] call CBA_fnc_localEvent;
    ["ace_common_fixCollision", _object, _object] call CBA_fnc_targetEvent;

    // Cannot use setPos on parachutes without them closing down
    _parachute attachTo [_object, [0, 0, 0]];
    detach _parachute;

    private _velocity = velocity _object;

    // Attach to the middle of the object
    (2 boundingBoxReal _object) params ["_bb1", "_bb2"];

    _object attachTo [_parachute, [0, 0, ((_bb2 select 2) - (_bb1 select 2)) / 2]];
    _parachute setVelocity _velocity;

    if ((ace_cargo_disableParadropEffectsClasstypes findIf {_object isKindOf _x}) == -1) then {
        private _light = createVehicle [_params getOrDefault ["parachute_chemlight_class", "Chemlight_yellow"], [0, 0, 0]];
        _light attachTo [_object, [0, 0, 0]];
    };

    if (_params get "parachute_attachStrobe") then {
        private _strobe = createVehicle [_params get "parachute_strobe_class", [0,0,10], [], 0, "CAN_COLLIDE"];
        _strobe attachTo [attachedTo _object, [0,0,32]];
        [ {	isTouchingGround (_this#1) }, { deleteVehicle (_this#0) }, [_strobe, _object] ] call CBA_fnc_waitUntilAndExecute;
    };
}, [_object, _parameters], 0.7] call CBA_fnc_waitAndExecute;


// Create smoke effect when crate landed
[{
    params ["_args", "_pfhID"];
    _args params ["_object", "_smokeClass"];

    if (isNull _object) exitWith { _pfhID call CBA_fnc_removePerFrameHandler; };

    if (getPos _object select 2 < 1) exitWith {
        _pfhID call CBA_fnc_removePerFrameHandler;

        if ((GVAR(disableParadropEffectsClasstypes) findIf {_object isKindOf _x}) == -1) then {
            private _smoke = _smokeClass createVehicle [0, 0, 0];
            _smoke attachTo [_object, [0, 0, 0]];
        };
    };
}, 1, [_object, _parameters getOrDefault ["airdrop_class_smoke","SmokeShellYellow"]]] call CBA_fnc_addPerFrameHandler;
