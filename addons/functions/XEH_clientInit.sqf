#include "script_component.hpp"

if (!hasInterface) exitWith {};

["ACE3 Common", "ace_captives_captives", [(localize "STR_ace_captives_SetCaptive"), (localize "STR_ace_captives_KeyComb_description")],
{
    private _target = cursorObject;
    if !([ACE_player, _target, []] call ace_common_fnc_canInteractWith) exitWith {false};
    if !(_target isKindOf "CAManBase") exitWith {false};
    if ((_target distance ACE_player) > getNumber (configFile >> "CfgVehicles" >> "CAManBase" >> "ACE_Actions" >> "ACE_ApplyHandcuffs" >> "distance")) exitWith {false};

    if ([ACE_player, _target] call ace_captives_fnc_canApplyHandcuffs) exitWith {
        [QGVAR(setHandcuffed), [_target, true], _target] call CBA_fnc_targetEvent;
        true
    };
    false
},
{false},
[DIK_F1, [true, false, false]], true] call CBA_fnc_addKeybind; // Shift + F1

[219, [false, false, false], {
    if (
        (GVAR(allowFreeing)) ||
        {(vehicle ACE_player) == ACE_player} || 
        {(ACE_player getVariable ["ace_captives_isHandcuffed", false])}
    )then {
        [] call FUNC(interactionEH);
    };  
},"keydown", nil, false] call CBA_fnc_addKeyHandler;
