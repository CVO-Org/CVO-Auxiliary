/*
* Author: Zorn
* function to define the default loadout hashmap
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


private _map = missionnamespace getVariable [QGVAR(catalog), "404"];

if (_map isEqualTo "404") then {
    _map = createHashMapFromArray [
        ["container_uniform",  []],
        ["container_vest",     []],
        ["container_backpack", []]
    ];
};