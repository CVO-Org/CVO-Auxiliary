#include "../../script_component.hpp"

/*
* Author: Zorn
* Function to define the Destination
*
* Arguments:
*
* Return Value:
* None
*
* Example:
* [this] call cvo_deploy_fnc_destination;
*
* Public: No
*/


params [
    ["_target",      false,     [objNull, []], [2,3] ],
    ["_networkName", "Default", [""]                 ],
    ["_params",      [],        [[]]                 ]
];

private _network = [_networkName] call FUNC(network);

private _type = switch (true) do {
    case (typeName _target == "ARRAY"): { "POS" };
    case ( _target isKindOf "AllVehicles" ): { "VIC" };
    case ( _target isKindOf "Static" ): { "STATIC" };
    default { "undefined" };
};

if (_type in ["VIC", "STATIC"]) then { _target setVariable [QGVAR(network), _networkName]};

private _destination = createHashMapFromArray _params;

// Assign continous ID Number
private _destinationID = _network get "nextDestinationIndex";
_network set ["nextDestinationIndex", _destinationID + 1];

_destination merge createHashMapFromArray [
    ["destinationID", "destID_" + str _destinationID], // Handle DestinationID as a string from here on out
    ["target", _target],
    ["min", 10],
    ["max", 25],
    ["type", _type]
];

_network get "destinations" pushBack _destination;
