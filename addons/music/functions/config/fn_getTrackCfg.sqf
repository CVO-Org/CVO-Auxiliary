#include "../../script_component.hpp"

/*
* Author: Zorn
* Function to retrieve config of music track based on its classname.
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
    ["_trackClassName", "", [""]]
];

switch (true) do {
    case (isClass (configFile >> "CfgMusic" >> _trackClassName)):        { (configFile >> "CfgMusic" >> _trackClassName) };
    case (isClass (missionConfigFile >> "CfgMusic" >> _trackClassName)): { (missionConfigFile >> "CfgMusic" >> _trackClassName) };
    default { configNull };
}
