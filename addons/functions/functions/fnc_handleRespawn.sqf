#include "script_component.hpp"
/*
 * Author: commy2 PabstMirror
 * Fix, because captiveNum doesn't reset properly on respawn
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Corpse <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [alive, body] call grad_captiveWalking_functions_fnc_handleRespawn;
 *
 * Public: No
 */

params ["_unit", "_dead"];
TRACE_2("handleRespawn",_unit,_dead);

if (!local _unit) exitWith {};

// Group and side respawn can potentially respawn you as a captive unit
// Base and instant respawn cannot, so captive should be entirely reset
// So we explicity account for the respawn type
private _respawn = [0] call BIS_fnc_missionRespawnType;

if (_respawn > 3) then {
    if (_unit getVariable ["ace_captives_isHandcuffed", false]) then {
        _unit setVariable ["ace_captives_isHandcuffed", false];
        [_unit, true] call FUNC(setHandcuffed);
    };

} else {
    if (_unit getVariable ["ace_captives_isHandcuffed", false]) then {
        [_unit, false] call FUNC(setHandcuffed);
    };
    [_unit, "setCaptive", "ace_captives_Handcuffed", false] call ace_common_fnc_statusEffect_set;
};
