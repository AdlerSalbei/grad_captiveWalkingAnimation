#include "script_component.hpp"

params ["_unit"];

private _strengthLeft = _unit getVariable [QGVAR(handCuffStrength), 100];

if (_strengthLeft < 0) exitWith {
    addCamShake [60, 1.2, 4]; 
    //_unit say3D "GRAD_arrestMechanics_snap";
    [_unit, false] call FUNC(setHandcuffed);
    _unit setVariable [QGVAR(handCuffStrength), 100];
};
/*
_unit say3D (selectRandom [
    "GRAD_arrestMechanics_rub1",
    "GRAD_arrestMechanics_rub2",
    "GRAD_arrestMechanics_rub3"
]);
*/
addCamShake [1, 0.8, random 25];

_strengthLeft = _strengthLeft - (floor (random 10));
_unit setVariable [QGVAR(handCuffStrength), _strengthLeft];
systemChat ("strength: " + str _strengthLeft);