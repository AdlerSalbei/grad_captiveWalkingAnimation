#include "script_component.hpp"
#include "\a3\editor_f\Data\Scripts\dikCodes.h"

["ace_settingsInitialized", {
    // Hold on a little bit longer to ensure anims will work
    [{
        GVAR(captivityEnabled) = true;
    }, [], 0.05] call CBA_fnc_waitAndExecute;
}] call CBA_fnc_addEventHandler;

//Handles when someone starts escorting and then disconnects, leaving the captive attached
//This is normaly handled by the PFEH in doEscortCaptive, but that won't be running if they DC

["unit", FUNC(handlePlayerChanged)] call CBA_fnc_addPlayerEventHandler;
[QGVAR(moveInCaptive), FUNC(vehicleCaptiveMoveIn)] call CBA_fnc_addEventHandler;
[QGVAR(moveOutCaptive), FUNC(vehicleCaptiveMoveOut)] call CBA_fnc_addEventHandler;

[QGVAR(setHandcuffed), FUNC(setHandcuffed)] call CBA_fnc_addEventHandler;

//Medical Integration Events
["ace_unconscious", FUNC(handleOnUnconscious)] call CBA_fnc_addEventHandler;

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
