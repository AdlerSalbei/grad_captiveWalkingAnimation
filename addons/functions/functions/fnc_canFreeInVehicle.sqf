#include "script_component.hpp"
/*
 * Author: Salbei
 * Checks if unit can free it self in a vehicle.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [bob] call grad_captiveWalking_functions_fnc_canFreeInVehicle
 *
 * Public: No
 */
params ["_unit"];

systemChat format ["%1, %2, %3, %4", !(GVAR(allowFreeingInVehicle)), !(_unit getVariable ["ace_captives_isHandcuffed", false]), isNull objectParent _unit, (_unit getVariable [QGVAR(fleeing), false])];

if !(GVAR(allowFreeingInVehicle)) exitWith { false };
if !(_unit getVariable ["ace_captives_isHandcuffed", false]) exitWith { false };
if (isNull objectParent _unit) exitWith { false};
if (_unit getVariable [QGVAR(fleeing), false]) exitWith { false };

true

