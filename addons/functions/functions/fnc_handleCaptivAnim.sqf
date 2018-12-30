#include "script_component.hpp"
/*
 * Author: Salbei
 * Handle the captiv animation.
 *
 * Arguments:
 * 0: The Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [bob] call grad_captivWalkingAnimation_fnc_handleCaptivAnim
 *
 * Public: No
 */

params ["_unit"];

diag_log format ["Activ: %1, isPlayer: %2, isEscorting: %3", GVAR(allowWalkingWhileCaptiv), isPlayer _unit, !(_unit getVariable ["ace_captives_isEscorting", false])];

if (GVAR(allowWalkingWhileCaptiv) && {isPlayer _unit} && {!(_unit getVariable ["ace_captives_isEscorting", false])}) then {

   //remove before release!
   _unit addEventHandler ["AnimChanged",
   {
      params ["_unit", "_anim"];
      systemChat _anim;
      diag_log _anim;
   }];

   if (currentWeapon _unit == "") then {
      [_unit] call FUNC(handcuffedWalkAnim);
   } else {
      _unit action ["SwitchWeapon", _unit, _unit, 100];
      [_unit, "AmovPercMstpSrasWrflDnon_AmovPercMstpSnonWnonDnon", 1] call ace_common_fnc_doAnimation;

      _handle = [{
         params ["_unit", "_handle"];
         if (!(alive _unit) || {!(_unit getVariable ["ace_captives_isHandcuffed", false])}) exitWith {
            [_handle] call CBA_fnc_removePerFrameHandler;
            _unit setVariable [QGVAR(PFH), -1];
         };

         if (currentWeapon _unit != "") then {
            _unit action ["SwitchWeapon", _unit, _unit, 100];
            [_unit, "amovpercmstpsnonwnondnon", 1] call ace_common_fnc_doAnimation;
            [{
               [_this, "AnimCableStandLoop"] call ace_common_fnc_doGesture;
            },_unit,1] call CBA_fnc_waitAndExecute;
         };
         },0,_unit] call CBA_fnc_addPerFrameHandler;
      _unit setVariable [QGVAR(PFH), _handle];

      GVAR(EH) = _unit addEventHandler ["AnimDone",
         {
            params ["_unit", "_anim"];
            if (_anim == "AmovPercMstpSrasWrflDnon_AmovPercMstpSnonWnonDnon") then {
               _unit removeEventHandler ["AnimDone", GVAR(EH)];
               [_unit] call FUNC(handcuffedWalkAnim);
         };
      }];
   };
} else {
   [_unit, "ACE_AmovPercMstpScapWnonDnon", 1] call ace_common_fnc_doAnimation;
   [_unit] call FUNC(animChangeEh);
};
