#include "../../script_component.hpp"

/*
* Author: Zorn
* Function which will check missionConfigFile to initialize CVO Arsenal Interaction Points
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

diag_log "[CVO](debug)(fn_mission_init)  Pre isServer Exit ";

if (!isServer) exitWith {};

diag_log "[CVO](debug)(fn_mission_init) Post isServer Exit ";

private _layerName = getText (missionConfigFile >> QGVAR(kits) >> "editor_layer_name");

diag_log format ['[CVO](debug)(fn_mission_init) _layerName: %1', _layerName];

private _objects =  getArray (missionConfigFile >> QGVAR(kits) >> "object_variable_names") apply { missionNamespace getVariable [_x, objNull] };

diag_log format ['[CVO](debug)(fn_mission_init) Pre Layer _objects: %1', _objects];

if (_layerName isNotEqualTo "") then { _objects append (getMissionLayerEntities _layerName # 0); };

diag_log format ['[CVO](debug)(fn_mission_init) Post Layer _objects: %1', _objects];

_objects = _objects select { !isNull _x };

ZRN_LOG_MSG_2(Mission Config - Init,_layerName,_objects);

missionNamespace setVariable [QGVAR(globalAccesspointArray), _objects, true];

diag_log format ['[CVO](debug)(fn_mission_init) : published - count: %1', count GVAR(globalAccesspointArray)];

nil
