#include "../script_component.hpp"

/*
* Author: Zorn
* Function to init CBA Custom Events
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

[QGVAR(EH_AddAction), FUNC(addAction)] call CBA_fnc_addEventHandler;

if !(hasInterface) exitWith {};

private _code = {
        ["ace_arsenal_displayClosed", {
            if (SET(save_arsenalClose)) then {
                
                [
                    {
                        private _loadout = [ace_player] call CBA_fnc_getLoadout;
                        player setVariable [QGVAR(Loadout), _loadout];
                    },
                    [],
                    3
                ] call CBA_fnc_waitAndExecute;
            };
        }] call CBA_fnc_addEventHandler;


        player addEventHandler ["Respawn", {
            if (SET(load_onRespawn)) then {
                params ["_unit", "_corpse"];

                private _loadout = player getVariable [QGVAR(Loadout), []];
                [player, _loadout] call CBA_fnc_setLoadout;
            };              
        }];                   
};

if (missionNamespace getVariable ["cba_settings_ready",false]) then _code else { ["CBA_settingsInitialized",_code,[]] call CBA_fnc_addEventHandler; };