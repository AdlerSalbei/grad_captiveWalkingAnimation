#include "script_component.hpp"
/*
 * Author: PabstMirror, Salbei
 * Remove handcuffs from a target
 *
 * Arguments:
 * 0: target <OBJECT>
 *
 * Return Value:
 * The return value <BOOL>
 *
 * Example:
 * [bob, false] call grad_captiveWalking_functions_fnc_doRemoveHandcuffs
 *
 * Public: No
 */

params ["_unit", "_target"];

[QGVAR(setHandcuffed), [_target, false], [_target]] call CBA_fnc_targetEvent;
