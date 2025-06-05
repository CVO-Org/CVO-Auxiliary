#include "../../script_component.hpp"

/*
* Author: Zorn
* Function to get an Array of Classnames based units Roles. Will check the condition and execute the code.
*
* Arguments:
*
* Return Value:
* Array - Classnames of Kit Items
*
* Example:
* ['something', player] call prefix_component_fnc_functionname
*
* Public: No
*/

params [
    ["_unit", ACE_player, [objNull] ]
];

// ############ Handle Role Kit ############
private _roles = [ace_player] call FUNC(getUnitRoles);
// Detectes ACE MEDIC and ACE Engineer
_roles = [ace_player, _roles] call FUNC(rolesByTrait);

diag_log format ['[CVO](ARSENAL) Player Roles: %1', _roles];
systemChat format ['[CVO](ARSENAL) Player Roles: %1', _roles];


private _catalog = ["arsenal_kit_role"] call EFUNC(catalog,getCatalog);

private _returnArray = [];

{
    private _ident = _x;
    private _entry = _y;
    private _role = _entry get "role";

    if !(_role in _roles) then { continue };

    // ## Condition
    private _conditionCode = _entry get "condition";
    private _conditionResult = [ace_player] call _conditionCode;
    
    // Handle nil as false
    if (isNil "_conditionResult") then {
        ERROR_1("Config [%1] bad condition return",configName _cfg);
        _conditionResult = false;
    };
    if (!_conditionResult) then { continue };

    _returnArray append _entry get "items";

    // ## Code
    private _codeCode = _entry get "code";
    private _codeResult = [ace_player] call _codeCode;
    if !(_codeResult isEqualType []) then { _codeResult = []; };
    _returnArray append _codeResult;
} forEach _catalog;

_returnArray arrayIntersect _returnArray // return
