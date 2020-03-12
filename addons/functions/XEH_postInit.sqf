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
["ace_interactMenuOpened", {_this call FUNC(interactEH)}] call CBA_fnc_addEventHandler;

[QGVAR(setHandcuffed), FUNC(setHandcuffed)] call CBA_fnc_addEventHandler;

//Medical Integration Events
["ace_unconscious", FUNC(handleOnUnconscious)] call CBA_fnc_addEventHandler;

["isNotHandcuffed"] call ace_common_fnc_removeCanInteractWithCondition;

["isNotHandcuffed", {
    params ["_unit", "_target"];

    private _return = false;
    if !(_unit getVariable ["ace_captives_isHandcuffed",false]) then {
        _return = true;
    } else {
        if (GVAR(allowFreeing) && {isNull _target || (typeOf _target isEqualTo "ACE_LogicDummy" && _target getVarable [QGVAR(forFreeing),false])}) then {
            _return = true;
        };
    };

    _return
}] call ace_common_fnc_addCanInteractWithCondition;
