#include "script_component.hpp"
/*
 * Author: Salbei
 * Creating a AnimChanged EH to prevent animation change.
 *
 * Arguments:
 * 0: The Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [bob] call grad_captivWalkingAnimation_fnc_animChangeEh
 *
 * Public: No
 */

params ["_unit"];

private _animChangedEHID = _unit addEventHandler ["AnimChanged",
   {
      _this call FUNC(handleAnimChangedHandcuffed);
}];
_unit setVariable ["ace_captives_fnc_handcuffAnimEHID", _animChangedEHID];
TRACE_2("Adding animChangedEH",_unit,_animChangedEHID);
