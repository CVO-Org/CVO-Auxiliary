#include "../../script_component.hpp"

/*
* Author: Zorn
* Returns the ace action that will be attached to zeus later
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


private _aceAction = [
    QGVAR(node)                                         // * 0: Action name <STRING>
    ,"CVO Music"                                        //  * 1: Name of the action shown in the menu <STRING>
    ,"zrn\cvo\addons\branding\data\Raven_Voron_256.paa" //  * 2: Icon <STRING> "\A3\ui_f\data\igui\cfg\simpleTasks\types\backpack_ca.paa"
    ,{}                                                 //  * 3: Statement <CODE>
    ,{true}                                             //  * 4: Condition <CODE>
    ,FUNC(createActionChildren)                         //  * 5: Insert children code <CODE> (Optional)
] call ace_interact_menu_fnc_createAction;

_aceAction
