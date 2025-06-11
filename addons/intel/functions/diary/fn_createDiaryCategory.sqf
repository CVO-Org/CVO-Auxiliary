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
    ["_target", player, [objNull] ]
];

#define MAXCHAR 20
#define CHAR Q(#)

private _index = missionNamespace getVariable [QGVAR(diary_spacer_index), 0];
private _max = MAXCHAR;

// Create Empty Spacer
[
    ["cvo", "spacer", _index ] joinString "_"
    ,""
    ,_icon
    ,_target
] call FUNC(createDiarySubject);
INC(_index);

// If title is defined, also create the "category Title" spacer
if (_title != "") then {
    _title = toUpper _title;
    private _remaining = _max - count _title - 2;
    private _isOdd = _remaining / 2 % 1 == 1;
    private _pre = "";
    private _post = "";
    for "_i" from 1 to (ceil _remaining / 2) do {
        _pre = _pre + "=";
        if (_isOdd && {_i == (ceil _remaining / 2)}) then { continue };
        _post = _post + "=";
    };

    private _str = _pre + " " + _title + " " + _post;

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
