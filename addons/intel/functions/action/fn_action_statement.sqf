#include "../../script_component.hpp"

/*
* Author: Zorn
* Function for the Statement of the Intel Pickup Action
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

#define MAX_DISTANCE 3
#define MIN_SOUND_DELAY 1
#define MID_SOUND_DELAY 2
#define MAX_SOUND_DELAY 4


params ["_object", "_unit", "_args"];
_args params ["_title", "_text", "_share", "_delete", "_actionText", "_soundType", "_duration", "_fnc_addIntel"];


// Prep Sound
private _actionSounds = switch (toUpper _soundType) do {
    case "BODY": { ["OMIntelGrabBody_01", "OMIntelGrabBody_02", "OMIntelGrabBody_03"] };
    case "KEYBOARD": { ["OMIntelGrabPC_01", "OMIntelGrabPC_02", "OMIntelGrabPC_03", "OMIntelGrabLaptop_01", "OMIntelGrabLaptop_02", "OMIntelGrabLaptop_03"] };
    default { [] };
};

if (_actionSounds isNotEqualTo []) then { _object setVariable [QGVAR(nextTimeForSound), CBA_missionTime]; };


// ACE Progress Bar
[
    // * 0: Total Time (in game "time" seconds) <NUMBER>    
    _duration,

    // * 1: Arguments, passed to condition, fail and finish <ARRAY>
    [_object, _unit, _title, _text, _actionSounds, _share, _delete],

    // * 2: On Finish: Code called or STRING raised as event. <CODE, STRING>    
    {
        params ["_args", "", "", ""];
        _args params ["_object", "_unit", "_title", "_text", "_actionSounds", "_share", "_delete"];

        // Notify Zeus
        [
            QEGVAR(common,EH_zeusMessage),
            [format [localize LSTRING(ModuleCreateIntel_PlayerFoundIntel), name _unit, _title]],
            allCurators
        ] call CBA_fnc_targetEvent;

        // Notify to Player
        playSound "Beep_Target";
        [
            ["\a3\ui_f\data\igui\cfg\simpletasks\types\documents_ca.paa", 1.25],
            [localize LSTRING(ModuleCreateIntel_IntelFound)],
            true
        ] call CBA_fnc_notify;

        // Publish Intel
        [QGVAR(EH_addIntelEntry), [_title, _text]] call CBA_fnc_globalEventJIP;

        // Handle Intel Group
        private _groupName = _object getVariable [QGVAR(group), "404"];
        [QGVAR(EH_handleIntelGroup), _groupName] call CBA_fnc_serverEvent;

        if (_delete) then {
            deleteVehicle _object;
        } else {
            [_object, 0, ["ACE_MainActions", QGVAR(intelAction)]] call ace_interact_menu_fnc_removeActionFromObject;
        };

        _object setVariable [QGVAR(nextTimeForSound), nil];
    },

    // * 3: On Failure: Code called or STRING raised as event. <CODE, STRING>
    {
        params ["_args", "", "", ""];
        (_this select 0) params ["_object"];

        _object setVariable [QGVAR(nextTimeForSound), nil];
    },

    // * 4: Localized Title <STRING> (default: "")
    _actionText,

    // * 5: Code to check each frame <CODE> (default: {true})
    {
        params ["_args", "", "", ""];        
        _args params ["_object", "", "", "", "_actionSounds"];

        private _time = CBA_missionTime;
        private _nextTimeForSound = _object getVariable [QGVAR(nextTimeForSound), _time];

        if (_time > _nextTimeForSound) then {
            playSound selectRandom _actionSounds;

            private _nextDelay = random [MIN_SOUND_DELAY, MID_SOUND_DELAY, MAX_SOUND_DELAY];
            _object setVariable [QGVAR(nextTimeForSound), _time + _nextDelay];
        };

        true
    }
] call ace_common_fnc_progressBar;
