#include "../../script_component.hpp"

/*
* Author: Zorn
* Server Function to handle what to do when the intel has been found
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

if (!isServer) exitWith {};

params ["_id", "_finder"];

// Get Intel Data
private _intelData = missionNamespace getVariable _id;
private _intelTitle = _intelData getVariable "intelTitle";

// Inform Zeus
[
    QEGVAR(common,EH_zeusMessage),
    [format [localize LSTRING(PlayerFoundIntel), name _finder, _intelTitle]],
    allCurators
] call CBA_fnc_targetEvent;

// Who is this intel being shared with?
private _shareWith = _intelData getVariable "shareWith";
private _targets = switch (toUpper _shareWith) do {
    case "GLOBAL": {
        _intelData setVariable ["intelFoundByAll", true, true];
    };
    case "SIDE": {
        private _targetSide = side _finder;
        private _foundBySide = _intelData getVariable "intelFoundBySide";
        _foundBySide pushBackUnique _targetSide;
        _intelData setVariable ["intelFoundBySide", _foundBySide, true];

        [] call CBA_fnc_players select { side _x isEqualTo _targetSide }
    };

    case "GROUP": {
        private _targetGroup = group _finder;
        private _foundByGroup = _intelData getVariable "intelFoundByGroup";
        _foundBySide pushBackUnique _targetGroup;
        _intelData setVariable ["intelFoundByGroup", _foundByGroup, true];

        units _targetGroup select { isPlayer _x }
    };

    case "UNIT": {
        _finder
    };
};

// Always add the finder
private _foundByUnit = _intelData getVariable "intelFoundByUnit";
_foundByUnit pushBackUnique _finder;
_intelData setVariable ["intelFoundByUnit", _foundByUnit, true];


// Publish Intel with targets
// [QGVAR(EH_addIntelEntry), [_actionTitle, _text]] call CBA_fnc_globalEventJIP;


// Delete Object or Remove Action on targets
private _object = _intelData getVariable "object";
if (_intelData getVariable "objectRemove") then { deleteVehicle _object; };

