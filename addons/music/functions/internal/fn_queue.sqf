#include "../../script_component.hpp"

/*
* Author: Zorn
* Handles queue and returns the content of the queue based on input.
*
* ""       -> Returns the current Queue or [] if queue is NIL
* "CLEAR"  -> NIL's the GVAR
* "NEXT"   -> Will Return the 
* Default  -> add input in queue
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

// Continue here - queue doesnt seem to work

params [
    ["_input", "", [""]]
];

private _return = "";



private _queue = missionNamespace getVariable [QGVAR(queue), nil];

switch (_input) do {
    case "": {
        if {isNil "_queue"} then {_queue = [];};
        _return = _queue;
    };
    case "CLEAR": {
        GVAR(queue) = nil;
        _return = "CLEARED";
    };
    case "NEXT":  {
        if (isNil "_queue") then {
            _return = "";
        } else {
            _return = _queue deleteAt 0;
            if (count _queue == 0) then { ["CLEAR"] call FUNC(queue) };
        };

    };
    default {
        if (isNil "_queue") then {
            _queue = [];
            GVAR(queue) = _queue;
        };
        _queue pushBack _input;
        _return = "STORED";
    };
};

_return
