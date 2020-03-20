#include "script_component.hpp"
/*
 * Author: Nic547, commy2, Salbei
 * Restart the handcuffing animation if it got interrupted. Called from a AnimChanged EH.
 *
 * Arguments:
 * 0: The Unit <OBJECT>
 * 1: New animation <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [bob, "movearm"] call ACE_captives_fnc_handleAnimChangedHandcuffed
 *
 * Public: No
 */

params ["_unit", "_newAnimation"];
TRACE_2("AnimChanged",_unit,_newAnimation);

if !(_unit getVariable ["ace_captives_isHandcuffed", false]) exitWith {};

if (_unit == (vehicle _unit)) then {
    private _oldAnimation =_unit getVariable [QGVAR(animation), ""];
    if ((_oldAnimation == "ACE_AmovPercMstpSsurWnonDnon") && {(_newAnimation != _oldAnimation)} && {!(_unit getVariable ["ACE_isUnconscious", false])}) then {
        TRACE_1("Handcuff animation interrupted",_newAnimation);
        [_unit, "ACE_AmovPercMstpScapWnonDnon", 1] call ace_common_fnc_doAnimation;
    }else{
        if (GVAR(allowWalkingWhileCaptiv) && {isPlayer _unit}) then {
            if (
                !(_newAnimation in [
                    //Standing Anims
                    "amovpercmstpsnonwnondnon",
                    "amovpercmwlksnonwnondf",
                    "amovpercmwlksnonwnondb",
                    "amovpercmwlksnonwnondl",
                    "amovpercmwlksnonwnondr",
                    "amovpercmwlksnonwnondfl",
                    "amovpercmwlksnonwnondfr",
                    "amovpercmwlksnonwnondbr",
                    "amovpercmwlksnonwnondbl",
                    "amovpercmstpsnonwnondnon_turnr",
                    "amovpercmstpsnonwnondnon_turnl",

                    //Kneel Anims
                    "amovpknlmstpsnonwnondnon",
                    "amovpknlmwlksnonwnondf",
                    "amovpknlmwlksnonwnondb",
                    "amovpknlmwlksnonwnondl",
                    "amovpknlmwlksnonwnondr",
                    "amovpknlmwlksnonwnondfr",
                    "amovpknlmwlksnonwnondfl",
                    "amovpknlmwlksnonwnondbr",
                    "amovpknlmwlksnonwnondbl",
                    "amovpknlmstpsnonwnondnon_turnl",
                    "amovpknlmstpsnonwnondnon_turnr",

                    //Prone Anims
                    "amovppnemstpsnonwnondnon",
                    "amovppnemrunsnonwnondf",
                    "amovppnemrunsnonwnondb",
                    "amovppnemrunsnonwnondl",
                    "amovppnemrunsnonwnondr",
                    "amovppnemrunsnonwnondfl",
                    "amovppnemrunsnonwnondfr",
                    "amovppnemrunsnonwnondbr",
                    "amovppnemrunsnonwnondbl",
                    "amovppnemstpsnonwnondnon_turnl",
                    "amovppnemstpsnonwnondnon_turnr"
                ]) &&
                {!(_unit getVariable ["ACE_isUnconscious", false])}
            ) then {
                TRACE_1("Handcuff walking animation interrupted",_newAnimation);
                [_unit, "amovpercmstpsnonwnondnon", 1] call ace_common_fnc_doAnimation;
                [_unit, "AnimCableStandLoop"] call ace_common_fnc_doGesture;
            };
        };
    };
} else {
    private _turretPath = [];
    {
        _x params ["_xUnit", "", "", "_xTurretPath"];
        if (_unit == _xUnit) exitWith {_turretPath = _xTurretPath};
    } forEach (fullCrew (vehicle _unit));
    TRACE_1("turret Path",_turretPath);
    if (_turretPath isEqualTo []) exitWith {};

    TRACE_1("Handcuff (FFV) animation interrupted",_newAnimation);
    [_unit, "ACE_HandcuffedFFV", 2] call ace_common_fnc_doAnimation;
    [_unit, "ACE_HandcuffedFFV", 1] call ace_common_fnc_doAnimation;
};
