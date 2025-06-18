#include "../../script_component.hpp"

/*
* Author: Zorn
* Function to orderly dismount all units from a vehicle.
*
* Arguments:
*
* Return Value:
* None
*
* Example:
* 
*
* Public: No
*/

params [
    [ "_vehicle", objNull, [objNull] ],
    [ "_delay",   0.9,     [0]       ]
];

ZRN_LOG_1(_this);

private _units = [];

_units append (fullCrew [_vehicle, "turret"] select { _x # 4 });
_units append (fullCrew [_vehicle, "cargo"]);

_units = _units apply { _x#0 };

ZRN_LOG_MSG_2(INIT,_vehicle,_units);

private _recCode = {
    params ["_units", "_recCode", "_delay"];

    private _unit = _units deleteAt 0;
    
    [
        QGVAR(EH_remote),
        [
            _unit,
            {
                moveOut _this;
                unassignVehicle _this;
                [_this] allowGetIn false;
            }
        ],
        _unit
    ] call CBA_fnc_targetEvent;

    if (_units isEqualTo []) exitWith {};

    [_recCode, [_units, _recCode, _delay], _delay] call CBA_fnc_waitAndExecute;
};

[_units, _recCode, _delay] call _recCode;
