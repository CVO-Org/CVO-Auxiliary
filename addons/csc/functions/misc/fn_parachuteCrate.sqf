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

params ["_crateObj", "_parachuteClass", "_posASL", ["_aircraft", objNull], ["_strobeClassName", "ACE_IR_Strobe_Effect"] ];

private _chute = createVehicle [_entry get "parachute_class", [0,0,100], [], 0, "CAN_COLLIDE"];
if (isNil "_chute" || { isNull _chute }) exitWith { ZRN_LOG_MSG(Failed Creation of CHUTE) };


if (!isNull _aircraft) then {
    _aircraft disableCollisionWith _chute;
    _aircraft disableCollisionWith _crateObj;
};

_chute setPosASL _posASL;
_crateObj attachTo [_chute, [0,0,0]];


if (_strobeClassname isNotEqualTo "") then {
    private _strobe = createVehicle [_entry get "parachute_strobe_class", [0,0,10], [], 0, "CAN_COLLIDE"];
    if (!isNil "_strobe" || { !isNull _strobe }) then {
        _strobe attachTo [attachedTo _box, [0,0,32]];
        [
            {
                isTouchingGround (_this#1)
            },
            {
                deleteVehicle (_this#0)
            },
            [_strobe, _box]
        ] call CBA_fnc_waitUntilAndExecute;
    };
};

[
    {
        isNull _this
        ||
        {
            ( getPos _this #2 ) <1
        }
    },
    {
        if (isNull _this) exitWith {};
        detach _this
    },
    _box,
    300
] call CBA_fnc_waitUntilAndExecute;
