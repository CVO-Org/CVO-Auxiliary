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
* getText (_cfg >> "statement") call cvo_common_fnc_convertStringCode
*
* Public: No
*/

params [ ["_stringCode", "", [""] ] ];

switch (true) do {
    case (_stringCode isEqualTo ""): { {} };                    // undefined, returns empty code
    case (isNil _stringCode): { compile _stringCode };          // its not a function
    default { missionNamespace getVariable _stringCode };       // its a function
} // return
