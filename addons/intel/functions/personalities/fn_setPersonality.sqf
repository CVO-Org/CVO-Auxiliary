#include "../../script_component.hpp"

/*
* Author: Zorn
* Function to set (create or update) a "Personality" Entry.
*
* Arguments:
*   0: 
*
* Return Value:
* None
*
* Example begin:
[
    "Mc Dude",
    "", // default Image
    "Head of Kitchen</br>Chief of Dishes",
    "His cooking alright fam...",
    "\A3\Data_F\Flags\Flag_AAF_CO.paa"  // icon
] call cvo_intel_fnc_setPersonality;
*
* Public: No
*/

params [
    [ "_name",      "",     [""]      ],
    [ "_image",     "",     [""]      ],
    [ "_subtitle",  "",     [""]      ],
    [ "_text",      "",     [""]      ],
    [ "_icon",      "",     [""]      ],
    [ "_newName",   "",     [""]      ],
    [ "_target",    player, [objNull] ]
];

["personalities", "Personalities"] call FUNC(createDiarySubject);

private _currentRecords = _target allDiaryRecords "personalities";
private _index = _currentRecords findIf { _x#1 == _name };

if (_image isEqualTo "") then {_image = QPATHTOF(data\personalities_default.paa)};

if (_newName != "") then { _name = _newName; };

private _body = format ["
<img width='250' image='%2' >></img>%1%1
<font size=20 face='EtelkaMonospaceProBold' color='#0099ff'>%3</font>%1
<font size=14 face='EtelkaMonospaceProBold' color='#0099ff'>%4</font>%1%1
<font size=12 face='EtelkaMonospaceProBold'>%5</font>
",
"<br />",
_image,
_name,
_subtitle,
_text
];


if (_index > -1) then {
    private _record = _currentRecords select _index select 8;
    _target setDiaryRecordText [["personalities", _record], [_name, _body, _icon]];
} else {
    _target createDiaryRecord ["personalities", [_name, _body, _icon]]
};
