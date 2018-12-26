#include "script_component.hpp"
/*
 * Author: commy2
 * Handles when a captive unit gets out of a vehicle.
 *
 * Arguments:
 * 0: _vehicle <OBJECT>
 * 1: dunno <OBJECT>
 * 2: _unit <OBJECT>
 *
 * Return Value:
 * The return value <BOOL>
 *
 * Example:
 * [car2, x, player] call ACE_captives_fnc_handleGetOut
 *
 * Public: No
 */

params ["_vehicle", "", "_unit"];
TRACE_2("params",_vehicle,_unit);

if ((local _unit) && {_unit getVariable ["ace_captives_isHandcuffed", false]}) then {
    private _cargoIndex = _unit getVariable ["ace_captives_CargoIndex", -1];

    if (_cargoIndex != -1) then {
        //If captive was not "unloaded", then move them back into the vehicle.
        TRACE_1("forcing back into vehicle",_cargoIndex);
        _unit moveInCargo [_vehicle, _cargoIndex];
    } else {
        //Getting out of vehicle:
        [_unit, "ACE_AmovPercMstpScapWnonDnon", 2] call ace_common_fnc_doAnimation;
        [_unit, "ACE_AmovPercMstpScapWnonDnon", 1] call ace_common_fnc_doAnimation;
    };
};
