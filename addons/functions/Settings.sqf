GVAR(captivityEnabled) = false;
[
    QGVAR(allowWalkingWhileCaptiv), 
    "CHECKBOX", 
    [
        localize LSTRING(settingAllowWalkingWhileCaptiv_displayName), 
        localize LSTRING(settingAllowWalkingWhileCaptiv_tooltip)
    ], 
    localize LSTRING(settingCategory), 
    true,
    true
] call CBA_fnc_addSetting;

[
    QGVAR(disableEscorting), 
    "CHECKBOX", 
    [
        localize LSTRING(settingDisableEscorting_displayName), 
        localize LSTRING(settingDisableEscorting_tooltip)
    ], 
    localize LSTRING(settingCategory), 
    false,
    true
] call CBA_fnc_addSetting;

[
    QGVAR(allowRunning), 
    "CHECKBOX", 
    [
        localize LSTRING(settingAllowRunning_displayName), 
        localize LSTRING(settingAllowRunning_tooltip)
    ], 
    localize LSTRING(settingCategory), 
    false,
    true
] call CBA_fnc_addSetting;

[
    QGVAR(allowFreeing), 
    "CHECKBOX", 
    [
        localize LSTRING(allowFreeing_displayName), 
        localize LSTRING(allowFreeing_tooltip)
    ], 
    localize LSTRING(settingCategory), 
    true,
    true
] call CBA_fnc_addSetting;
/*
[
    QGVAR(allowFreeingInVehicle), 
    "CHECKBOX", 
    [
        localize LSTRING(allowFreeingInVehicle_displayName), 
        localize LSTRING(allowFreeingInVehicle_tooltip)
    ], 
    localize LSTRING(settingCategory), 
    true,
    true
] call CBA_fnc_addSetting;
*/
[
    QGVAR(freeingTime), 
    "TIME", 
    localize LSTRING(freeingTime), 
    localize LSTRING(settingCategory), 
    [5, 450, 35], 
    true
] call CBA_fnc_addSetting;
/*
[
    QGVAR(freeingTimeInVehicle), 
    "SLIDER", 
    localize LSTRING(freeingTimeInVehicle), 
    localize LSTRING(settingCategory), 
    [5, 1500, 120, 0], 
    true
] call CBA_fnc_addSetting;
*/
