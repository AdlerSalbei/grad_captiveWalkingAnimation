#include "script_component.hpp"

params ["_unit", "_obj", "_helper"];

if (isNull _obj) exitWith { false };
if (speed _unit > 3) exitWith { false };
if (_obj distance2D _unit > 5) exitWith { false };
if !([_unit, _obj, ["isNotSwimming"]] call ace_common_fnc_canInteractWith) exitWith { false };
if (_unit getVariable [QGVAR(fleeing), false]) exitWith { false };

//Custom LOS check for tree
private _headPos = _unit modelToWorldVisual (_unit selectionPosition "pilot");
((!(lineIntersects [AGLtoASL _headPos, AGLtoASL (_helper modelToWorldVisual [0,0,1.25]), _obj, _unit])) ||
{!(lineIntersects [AGLtoASL _headPos, getPosASL _obj, _obj, _unit])})

