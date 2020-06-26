#include "script_component.hpp"
/*
 * Author: PabstMirror, Salbei
 * Checks the conditions for being able to apply handcuffs
 *
 * Arguments:
 * 0: caller (player) <OBJECT>
 * 1: target <OBJECT>
 *
 * Return Value:
 * The return value <BOOL>
 *
 * Example:
 * [player, bob] call grad_captiveWalking_functions_fnc_doApplyHandcuffs;
 *
 * Public: No
 */


params ["_unit", "_target"];

playSound3D ["ace\addons\captives\sounds\cable_tie_zipping.ogg", objNull, false, (getPosASL _target), 1, 1, 10];

[QGVAR(setHandcuffed), [_target, true], [_target]] call CBA_fnc_targetEvent;

_unit removeItem "ACE_CableTie";
