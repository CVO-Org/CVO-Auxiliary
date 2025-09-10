#include "../../script_component.hpp"

/*
* Author: Zorn
* Function to start the Serverside Framework to play random sounds in the distance but only for specified targets.
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

if !(isServer) exitWith {};

params [
    [ "_ambients",  "ALL", ["", []] ]
];

_ambients = switch (true) do {
    case (_ambients isEqualTo "ALL"): { "true" configClasses (configFile >> "CfgAmbient") apply { configName _x } };
    case (_ambients isEqualType "" ): { [ _ambients ] };
    default { _ambients };
};

private _sounds = [];
{
    private _ambient = _x;
    _sounds pushBack ("true" configClasses (configFile >> "CfgAmbient" >> _ambient) apply { configName _x });
} forEach _ambients;

private _delay = 3 * 60;

GVAR(sounds) = + _sounds;
GVAR(sounds_pool) = + _sounds;

if (! isNil QGVAR(loop_id) ) exitWith { GVAR(loop_id) };

GVAR(loop_id) = [
    {
        if (GVAR(sounds_pool) isEqualTo []) then { GVAR(sounds_pool) = + GVAR(sounds); };

        private _players = [] call CBA_fnc_players;
        private _playersTotal = count _players;
        private _validTargets = _players select { (_x getVariable [QGVAR(lastPlayed), 0]) + 600 < CBA_missionTime };

        private _validTargetsAmount = count _validTargets;
        
        if (_validTargetsAmount isEqualTo 0) exitWith {};

        // Whatever is smaller, the amount of valid targets or desiredRatio%
        private _desiredRatio = 0.1;
        private _desiredTargetsAmount = ceil (_playersTotal * 0.1) min _validTargetsAmount;

        private _selectedTargets = [];

        for "_i" from 1 to _desiredTargetsAmount do { _selectedTargets pushBack ( _validTargets deleteAt (floor random count _validTargets) ); };

        private _sounds =  GVAR(Sounds_pool);
        private _sound = _sounds deleteAt (floor random count _sounds);

        [
            QGVAR(EH_localEffects),
            [ _sound, 300, ceil random 360 ],
            _selectedTargets
        ] call CBA_fnc_targetEvent;

    },
    _delay
] call CBA_fnc_addPerFrameHandler;

GVAR(loop_id)
