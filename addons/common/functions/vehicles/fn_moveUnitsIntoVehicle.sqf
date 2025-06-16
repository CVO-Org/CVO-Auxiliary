#include "../../script_component.hpp"

/*
* Author: Zorn
* Function to move (Teleport) Units into all available Cargo Seats of the provided Vehicles
*
* Arguments:
*   0: Units    <ARRAY of Objects>
*   1: Vehicles <ARRAY of Objects>
*
* Return Value:
* None
*
* Example:
* ['something', player] call prefix_component_fnc_functionname
*
* Public: No
*/

params ["_units", "_vehicles"];

private _slots = [];    // [vehicle, cargoIndex]

{
    private _vic = _x;
    // get all cargo seats, select only the empty ones, then create the individual [vic,index] slot, append the full list to the main array
    _slots append ( fullCrew [_vic, "cargo", true] select { isNull (_x select 0) } apply { [_vic, _x select 2] } );
} forEach _vehicles;

{
    // take random slot, remove it from the main array and apply it to a player.
    private _unit = _x;
    private _slot = _slots deleteAt ( floor random count _slots );
    [QGVAR(EH_UnitIntoVehicle), [_unit, _slot], _unit] call CBA_fnc_targetEvent;
} forEach _units;
