#include "script_component.hpp"
/*
 * Author: commy2, Salbei
 * handle captive and unconsciousness state and prevent grenades
 *
 * Arguments:
 * 0: _unit <OBJECT>
 *
 * Return Value:
 * The return value <BOOL>
 *
 * Example:
 * [bob] call grad_captiveWalking_functions_fnc_handleUnitInitPost
 *
 * Public: No
 */

params ["_unit"];

if (local _unit) then {
    // reset status on mission start
    if (_unit getVariable ["ace_captives_isHandcuffed", false]) then {
        _unit setVariable ["ace_captives_isHandcuffed", false];
        [_unit, true] call FUNC(setHandcuffed);
    };
};
