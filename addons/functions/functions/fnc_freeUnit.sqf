#include "script_component.hpp"

params ["_unit"];

private _strengthLeft = _unit getVariable [QGVAR(handCuffStrength), 100];

if (_strengthLeft < 0) exitWith {
    addCamShake [60, 1.2, 4]; 
    //_unit say3D "GRAD_arrestMechanics_snap";
    _unit setVariable [QGVAR(handCuffStrength), 100];

    [_unit, false] call FUNC(setHandcuffed);
};

_unit setVariable [QGVAR(fleeing), true];

// Create progress bar
private _fnc_onFinish = {
    params ["_unit"];
    
    addCamShake [60, 1.2, 4]; 
    //_unit say3D "GRAD_arrestMechanics_snap";
    _unit setVariable [QGVAR(handCuffStrength), 100];

    [_unit, false] call FUNC(setHandcuffed);
    _unit setVariable [QGVAR(fleeing), false];
};

private _fnc_onFailure = {
    params ["_unit", "_elapsedTime", "_totalTime"];

    private _strengthLeft = _unit getVariable [QGVAR(handCuffStrength), 100];
    _strengthLeft = _strengthLeft - (_strengthleft/_totalTime)*_elapsedTime;
    _unit setVariable [QGVAR(handCuffStrength), _strengthLeft];

    _unit setVariable [QGVAR(fleeing), false];
};

private _fnc_condition = {
    params ["_unit"];

    if !(_unit getVariable [QGVAR(fleeing), false]) exitWith { false };
     
    true
};

[((QGVAR(freeingTime)/100) * _strengthleft), _unit, _fnc_onFinish, _fnc_onFailure, localize LSTRING(freeing), _fnc_condition] call ace_common_fnc_progressBar;

//PFH for effects and sounds
[{
    params ["_args", "_handle"];
    _args params ["_unit"];

    if !(_unit getVariable [QGVAR(fleeing), false]) exitWith {
        [_handle] call CBA_fnc_removePerFrameHandler;
    };

    _unit say3D (selectRandom [
        "GRAD_arrestMechanics_rub1",
        "GRAD_arrestMechanics_rub2",
        "GRAD_arrestMechanics_rub3"
    ]);

    addCamShake [1, 0.8, random 25];
}, 1, [_unit]] call CBA_fnc_addPerFrameHandler;
