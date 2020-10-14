#include "script_component.hpp"
/*
 * Author: SilentSpike, Salbei
 * Flips the capture state of the unit the module is placed on.
 *
 * Arguments:
 * 0: The module logic <OBJECT>
 * 1: Synchronized units <ARRAY>
 * 2: Activated <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [LOGIC, [bob, kevin], true] call grad_captiveWalking__fnc_moduleCaptive
 *
 * Public: No
 */

params ["_logic"];

if !(local _logic) exitWith {};

private _mouseOver = missionNamespace getVariable ["bis_fnc_curatorObjectPlaced_mouseOver", [""]];

if ((_mouseOver select 0) != "OBJECT") then {
    [LSTRING(NothingSelected)] call ace_zeus_fnc_showMessage;
} else {
    private _unit = effectivecommander (_mouseOver select 1);

    if !(_unit isKindOf "CAManBase") then {
        [LSTRING(OnlyInfantry)] call ace_zeus_fnc_showMessage;
    } else {
        if !(alive _unit) then {
            [LSTRING(OnlyAlive)] call ace_zeus_fnc_showMessage;
        } else {
            private _captive = _unit getVariable ["ace_captives_isHandcuffed", false];
            // Event initalized by ACE_Captives
            [QGVAR(setHandcuffed), [_unit, !_captive], _unit] call CBA_fnc_targetEvent;
        };
    };
};

deleteVehicle _logic;