#include "../../script_component.hpp"

/*
* Author: Zorn
* Function
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
    ["_speaker", "", [""] ],
    ["_text", "", [""] ]
];

private _string = format [" 
<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
<t align = 'center' shadow = '2' color='#F18B1D' size='2' font='RobotoCondensedBold'>
%1:</t><br/><br/>
<t color='#ffffff' size='1.5' font='RobotoCondensedBold'>
%2
</t>
",
_speaker,
_text
];

titleText [_string, "PLAIN", 0.7, true, true];
