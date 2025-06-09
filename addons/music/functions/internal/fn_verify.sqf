#include "../../script_component.hpp"

/*
* Author: Zorn
* Verifies if that Track is available.
*
* Arguments:
*
* Return Value:
* None
*
* Example:
* [] call prefix_component_fnc_functionname
*
* Public: No
*/

params [
    ["_track",        "",         [""]       ]
];

switch (true) do {
    case (isClass (configFile >> "CfgMusic" >> _track)): { true };
    case (isClass (missionConfigFile >> "CfgMusic" >> _track)): { true };
    default { false };
}
