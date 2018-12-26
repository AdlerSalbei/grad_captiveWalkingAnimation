#include "script_component.hpp"
#include "\a3\editor_f\Data\Scripts\dikCodes.h"

["ace_settingsInitialized", {
    // Hold on a little bit longer to ensure anims will work
    [{
        GVAR(captivityEnabled) = true;
    }, [], 0.05] call CBA_fnc_waitAndExecute;
}] call CBA_fnc_addEventHandler;


["ace_captives_setHandcuffed", _id] call CBA_fnc_removeEventHandler;
["ace_captives_setHandcuffed", FUNC(setHandcuffed)] call CBA_fnc_addEventHandler;
