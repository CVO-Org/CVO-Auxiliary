#include "../../script_component.hpp"

/*
 * Author: mharis001
 * Add an intel action to the given object.
 *
 * Arguments:
 * 0: Object <OBJECT>
 * 1: Share With (0 - Side, 1 - Group, 2 - Nobody) <NUMBER>
 * 2: Delete On Completion <BOOL>
 * 3: Action Type (0 - Hold Action, 1 - ACE Interaction Menu) <NUMBER>
 * 4: Action Text <STRING>
 * 5: Action Sounds <ARRAY>
 * 6: Action Duration <NUMBER>
 * 7: Intel Title <STRING>
 * 8: Intel Text <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [_object, 0, true, 0, "Pick Up Intel", 1, "Intel!", "Notes..."] call zen_modules_fnc_addIntelAction
 *
 * Public: No
 */



params ["_object", "_share", "_delete", "_actionText", "_soundType", "_duration", "_title", "_text"];

ZRN_LOG_1(_this);


// Removing previous action regardless of type to handle switching action types
private _actionID = _object getVariable QGVAR(intelActionID);


if (!isNil "_actionID") then {
    [_object, _actionID] call BIS_fnc_holdActionRemove;
};


[_object, 0, ["ACE_MainActions", QGVAR(intelAction)]] call ace_interact_menu_fnc_removeActionFromObject;

private _action = [
    QGVAR(intelAction),
    _actionText,
    "\a3\ui_f\data\igui\cfg\simpletasks\types\documents_ca.paa",
    FUNC(action_statement),
    {true},
    {},
    [_title, _text, _share, _delete, _actionText, _actionSounds, _duration, _fnc_addIntel]
] call ace_interact_menu_fnc_createAction;

[_object, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;
