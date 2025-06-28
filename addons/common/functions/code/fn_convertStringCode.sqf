#include "../../script_component.hpp"

/*
* Author: Zorn
* Takes code as string and returns it as code.
*
* Arguments:
* 0: Code as string <STRING>
*
* Return Value:
* 0: Code as codeblock <CODE>
* 
*
* Example:
* getText (configFile >> "abe_banana" >> "condition") call cvo_common_fnc_convertStringCode
*
* Public: No
*/

params [ ["_stringCode", "", [""] ] ];

switch (true) do {
    case (_stringCode isEqualTo ""): { {} };                    // undefined, returns empty code
    case (!(missionNamespace isNil _stringCode)): { missionNamespace getVariable [_stringCode, {}] }; // missionNamespace FNC
    case (!(     uiNamespace isNil _stringCode)): {      uiNamespace getVariable [_stringCode, {}] }; // uiNamespace FNC
    default { compile _stringCode };
} // return
