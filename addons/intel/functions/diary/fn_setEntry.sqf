/*
* Author: Zorn
* Function to create/update an entry within a given subject.
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

[
    _subject        
    ,_name
    ,_image         // Image inside the Entry. getMissionPath "\data\personalities.paa"
    ,_subtitle
    ,_text
    // ,_icon       // Image next to the entry Title (small flags for example)
    // ,_newName
    // ,_target
] call cvo_intel_fnc_setEntry;

/*
[
	"ENEMY FORCES"		
	,"AAF Loyalists"
	,""		   // getMissionPath "\data\personalities.paa"
	,"Altis Armed Forces Loyalists"		   // _subtitle
	,"There are rumours that a hardcore group of ex-AAF veterans still hold out, hoping to one day bring Arkanteros back into power."		   // _text
	,""
	// ,_newName
	// ,_target
] call cvo_intel_fnc_setEntry;

*/

params [
    ["_subject",    "",         ["", []]    ],
    ["_name",       "",         [""]        ],
    ["_image",      "",         [""]        ],
    ["_subtitle",   "",         [""]        ],
    ["_body",       "",         [""]        ],
    ["_newName",    "",        [""]         ],
    ["_target",     player,     [objNull]   ]
];

if (_subject == "") exitWith {};

