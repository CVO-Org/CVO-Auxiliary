#include "../../script_component.hpp"

/*
* Author: Zorn
* Function to create a spacer and a ChapterTitle Subject
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

params [
    ["_title",  "",     [""]      ],
    ["_icon",   "",     [""]      ],
    ["_addLine", false, [""]      ],
    ["_target", player, [objNull] ]
];

#define MAXCHAR 18
#define CHAR Q(#)

private _index = missionNamespace getVariable [QGVAR(diary_spacer_index), 0];

// Create Empty Spacer
[
    ["cvo", "spacer", _index ] joinString "_"
    ,""
    ,""
    ,_target
] call FUNC(createDiarySubject);
INC(_index);

// If title is defined, also create the "category Title" spacer
if (_title != "") then {
    _title = toUpper _title;
    
    private _str = if (_addLine isEqualType "") then {
        private _max = MAXCHAR;
        private _remaining = _max - count _title - 2;
        private _str = "";
        for "_i" from 1 to (floor _remaining / 2) do { _str = _str + _addLine; };
        _str + " " + _title + " " + _str;
    } else {
        _title
    };

    [
        ["cvo", "spacer", _index ] joinString "_"
        ,_str
        ,_icon
        ,_target
    ] call FUNC(createDiarySubject);
    INC(_index);
};

missionNamespace setVariable [QGVAR(diary_spacer_index), _index];

nil
