#include "../script_component.hpp"

/*
* Author: Zorn
* Init Function to establish the related EventHandlers
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

// RemoteExec Event
[QGVAR(EH_remote), {
    
    private _code = switch (typeName (_this#1)) do {
        case "STRING": { (_this#0) call FUNC(convertStringCode) };
        case "CODE": { _this#2 };
        default { {} };
    };
    
    _this#0 call _code;

}] call CBA_fnc_addEventHandler;

// fn_toggleLayerAI CBA Event
[
    QGVAR(eh_toggleAIfeature),
    {
        params ["_units", "_mode", "_features"];

        // Recursive Function:
        // On individual Owner: toggle ai features per units - one unit per frame
        diag_log format ['[CVO](debug)(fn_toggleLayerAI) Recieving Package: %1', [count _units, _mode, _features]];
        private _recursiveCode = {
            params ["_units", "_mode", "_features", "_recursiveCode"];

            private _unit = _units deleteAt 0;
            {
                switch (_mode) do {
                    case true:  { _unit  enableAI _feature };
                    case false: { _unit disableAI _feature };
                };
            } forEach _features;

            if (_units isEqualTo []) exitWith {};
            [_recursiveCode, [_units, _mode, _features, _recursiveCode]] call CBA_fnc_execNextFrame;
        };

        [_units, _mode, _features,_recursiveCode] call _recursiveCode;

    }
] call CBA_fnc_addEventHandler;

// Move Unit into Vehicle

[
    QGVAR(EH_UnitIntoVehicle), // eventname
    {
        params ["_unit", "_slot"];
        _slot params  ["_vic", "_index"];

        moveOut _unit;

        _unit moveInCargo [_vic, _index, false];
        _unit assignAsCargoIndex [_vic, _index];
    }

] call CBA_fnc_addEventHandler;
