#include "script_component.hpp"
/*
 * Author: Nic547
 * Attaches a Captive to the _unit
 *
 * Arguments:
 * 0: _unit-Player <OBJECT>
 * 1: target <OBJECT>
 * 2: _state <BOOL>
 *
 * Return Value:
 * The return value <BOOL>
 *
 * Example:
 * [player, bob, true] call ACE_captives_fnc_doEscorteCaptive;
 *
 * Public: No
 */

params ["_unit", "_target","_state"];

if (_state) then {
    if (_unit getVariable ["ace_captives_isEscorting", false]) exitWith {};

    [_unit, _target, false] call ace_common_fnc_claim;
    _unit setVariable ["ace_captives_isEscorting", true, true];

    _target attachTo [_unit, [0, 1, 0]];

    _unit setVariable ["ace_captives_escortedUnit", _target, true];

    if (isPlayer _unit) then {
      _unit setVariable [QGVAR(animation), "ACE_AmovPercMstpScapWnonDnon"];
      [_unit, "ACE_AmovPercMstpScapWnonDnon", 1] call ace_common_fnc_doAnimation;
   };

    //Add Actionmenu to release captive
    private _actionID = _unit addAction [format ["<t color='#FF0000'>%1</t>", localize LSTRING(StopEscorting)],
    {[(_this select 0), ((_this select 0) getVariable ["ace_captives_escortedUnit", objNull]), false] call FUNC(doEscortCaptive);},
    nil, 20, false, true, "", QUOTE(!isNull GETVAR(_target,"ace_captives_escortedUnit",objNull))];

    [{
        params ["_args", "_pfID"];
        _args params ["_unit", "_target", "_actionID"];

        if (_unit getVariable ["ace_captives_isEscorting", false]) then {
            if (!alive _target || {!alive _unit} || {!canStand _target} || {!canStand _unit} || {_target getVariable ["ACE_isUnconscious", false]} || {_unit getVariable ["ACE_isUnconscious", false]} || {!isNull (attachedTo _unit)}) then {
                _unit setVariable ["ace_captives_isEscorting", false, true];
            };
        };

        if (!(_unit getVariable ["ace_captives_isEscorting", false])) then {
            [(_this select 1)] call CBA_fnc_removePerFrameHandler;
            [objNull, _target, false] call ace_common_fnc_claim;
            detach _target;
            _unit removeAction _actionID;
            _unit setVariable ["ace_captives_escortedUnit", objNull, true];
        };
    }, 0, [_unit, _target, _actionID]] call CBA_fnc_addPerFrameHandler;

} else {
    _unit setVariable ["ace_captives_isEscorting", false, true];
    _unit setVariable ["ace_captives_escortedUnit", objNull, true];

    if (isPlayer _unit) then {
      _unit setVariable [QGVAR(animation), "AnimCableStandLoop"];
      [_unit, "amovpercmstpsnonwnondnon", 1] call ace_common_fnc_doAnimation;
      [_unit, "AnimCableStandLoop"] call ace_common_fnc_doGesture;
   };
};
