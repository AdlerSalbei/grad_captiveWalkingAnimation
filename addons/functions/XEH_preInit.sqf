#include "script_component.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

GVAR(captivityEnabled) = false;
[
    QGVAR(allowWalkingWhileCaptiv), 
    "CHECKBOX", 
    [
        localize LSTRING(settingAllowWalkingWhileCaptiv_displayName), 
        localize LSTRING(settingAllowWalkingWhileCaptiv_tooltip)
    ], 
    localize LSTRING(settingCategory), 
    true
] call CBA_Settings_fnc_init;

[
    QGVAR(disableEscorting), 
    "CHECKBOX", 
    [
        localize LSTRING(settingDisableEscorting_displayName), 
        localize LSTRING(settingDisableEscorting_tooltip)
    ], 
    localize LSTRING(settingCategory), 
    false
] call CBA_Settings_fnc_init;

ADDON = true;
