#include "script_component.hpp"
/*
params ["_bool"];

if (_bool) then {
    private _interactionConditions = missionNamespace getVariable ["ace_common_InteractionConditions", []]; 

    _interactionConditions params ["_strings", "_arrays"]; 
        
    private _result = _strings find "isnothandcuffed"; 
    if (_result != -1) then {
        _strings deleteAt (_result -1); 
    };

    _result = _arrays find {!(_this select 0 getVariable ["ace_captives_isHandcuffed", false])}; 
    if (_result != -1) then {
        _arrays deleteAt _result;
    };
    
    _interactionConditions = [_strings, _arrays]; 
    missionNamespace setVariable ["ace_common_InteractionConditions", _interactionConditions];
} else {
    private _interactionConditions = missionNamespace getVariable ["ace_common_InteractionConditions", []]; 

    _interactionConditions params ["_strings", "_arrays"]; 

    _strings pushBackUnique "isnothandcuffed";
    _arrays pushBackUnique {!(_this select 0 getVariable ["ace_captives_isHandcuffed", false])};

    _interactionConditions = [_strings, _arrays]; 
    missionNamespace setVariable ["ace_common_InteractionConditions", _interactionConditions];
};
*/

//["isNotHandcuffed", {!GETVAR(_this select 0,ace_captives_isHandcuffed,false)}] call ace_common_fnc_addCanInteractWithCondition;