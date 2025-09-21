#include "../../script_component.hpp"

/*
* Author: Zorn
* [Description]
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

params [ [ "_type", "", [""] ], "_args" ];

private _delay = missionNamespace getVariable [QGVAR(cutscene_delay), 0.1];


switch (_type) do {

    case "START": {
        _args params [ [ "_duration",6, [0] ] ];
        [{ 0 cutText ["", "BLACK OUT", _this, true, false, true]; }, _duration, _delay] call CBA_fnc_waitAndExecute;            
        _delay = _delay + _duration;
    };

    case "END": {
        _args params [ [ "_duration", 15, [0] ] ];
        [{ 0 cutFadeOut _this; }, _duration, _delay] call CBA_fnc_waitAndExecute;
        _delay = _delay + _duration;
    };

    case "CODE": {
        _args params [ [ "_code", {}, [{}] ], "_params"];
        [ _code, _params, _delay] call CBA_fnc_waitAndExecute;
    };

    case "DELAY": {
        _args params [ [ "_addDelay", 5, [5] ] ];
        _delay = _delay + _addDelay;
    };

    case "TEXT": {
        _args params [ [ "_strings", "", ["",[]] ], [ "_duration", 10, [0] ] ];

        _duration = _duration max 5;

        private _defaultSize = missionNamespace getVariable [QGVAR(cutscene_defaultSize), 3];
        private _defaultColor = missionNamespace getVariable [QGVAR(cutscene_defaultColor), "#690000"];
        private _defaultFont = missionNamespace getVariable [QGVAR(cutscene_defaultFont), "EraserRegular"];

        if (_strings isEqualType "") then { _strings = [_strings] };

        _strings = _strings apply { format [ "<t size=%1 color='%2' font='%3'>%4</t>", _defaultSize, _defaultColor, _defaultFont, _x ] };

        private fullString = _strings joinString "<br/>";

        [{ 1 cutText [_this#0, "PLAIN", _this#1, true, true, true]; }, [fullString, 0.5 * _duration -1], _delay] call CBA_fnc_waitAndExecute;

        _delay = _delay + 0.5 * _duration;

        [{ 1 cutFadeOut _this; }, 0.5 * _duration -1, _delay] call CBA_fnc_waitAndExecute;

        _delay = _delay + 0.5 * _duration;
    };

    default { };
};

missionNamespace setVariable [QGVAR(cutscene_delay), _delay];
