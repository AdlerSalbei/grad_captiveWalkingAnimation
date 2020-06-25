#include "script_component.hpp"
/*
 * Author: 654wak654, Salbei
 * Adds child actions to the "load captive" action for near vehicles.
 *
 * Arguments:
 * 0: Captive <OBJECT>
 *
 * Return Value:
 * Child actions <ARRAY>
 *
 * Example:
 * [kevin] call grad_captiveWalking_functions_fnc_addLoadCaptiveActions
 *
 * Public: No
 */

params ["_target"];

private _statement = {
    params ["_target", "_player", "_vehicle"];
    
    [_player, _target, _vehicle] call FUNC(doLoadCaptive);
};

[_target call ace_common_fnc_nearestVehiclesFreeSeat, _statement, _target] call ace_interact_menu_fnc_createVehiclesActions
