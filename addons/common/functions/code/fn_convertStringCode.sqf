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
* getText (configFile >> "abe_banana" >> "condition") call cvo_common_fnc_convertStringCode // TODO once cba updates, replace with cba variant
* 
* Public: No
*/

params [["_stringCode", "", [""]]];

switch (true) do {
    case (_stringCode isEqualTo ""): {{}};
    case (!(missionNamespace isNil _stringCode)): {missionNamespace getVariable _stringCode};
    default {compile _stringCode};
}
