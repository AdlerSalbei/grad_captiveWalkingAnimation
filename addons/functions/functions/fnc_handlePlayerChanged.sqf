#include "script_component.hpp"
/*
 * Author: commy2
 * Handles playerChanged.  Resets "showHUD" based on handcuff status
 *
 * Arguments:
 * 0: _newUnit <OBJECT>
 * 1: _oldUnit <OBJECT>
 *
 * Return Value:
 * The return value <BOOL>
 *
 * Example:
 * [bob1, bob2] call ACE_captives_fnc_handlePlayerChange
 *
 * Public: No
 */

params ["_newUnit","_oldUnit"];

//set showHUD based on new unit status:
if ((_newUnit getVariable ["ace_captives_isHandcuffed", false]) || {_newUnit getVariable ["ace_captives_fnc_isSurrendering", false]}) then {
    TRACE_1("Player Change (showHUD false)",_newUnit);
    ["captive", [false, false, false, false, false, false, false, false, false, true]] call ace_common_fnc_showHud;
} else {
    TRACE_1("Player Change (showHUD true)",_newUnit);
    ["captive", []] call ace_common_fnc_showHud; //same as showHud true;
};

//If old player was escorting, stop
if (_oldUnit getVariable ["ace_captives_isEscorting", false]) then {
    _oldUnit setVariable ["ace_captives_isEscorting", false, true];
};
