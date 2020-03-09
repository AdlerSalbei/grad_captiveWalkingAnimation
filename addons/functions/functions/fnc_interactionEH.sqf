#include "script_component.hpp"

/*
*   Original function from ace_logistics_wirecutter by PabstMirror
*   Adapted for grad_axe by McDiod
*   Adapted for grad_captiveWalkingAnimation by Salbei
*/

params ["_interactionType"];

systemChat format ["%1, %2, %3, %4", !(GVAR(allowFreeing)), _interactionType != 0, (vehicle ACE_player) != ACE_player, !(ACE_player getVariable ["ace_captives_isHandcuffed", false])];

//Ignore self-interaction menu or mounted vehicle interaction
if (
    !(GVAR(allowFreeing)) ||
    (_interactionType != 0) || 
    {(vehicle ACE_player) != ACE_player} || 
    {!(ACE_player getVariable ["ace_captives_isHandcuffed", false])}
) exitWith {};

systemChat "interactEH 1";

[
    {
        params ["_args", "_pfID"];
        _args params ["_setPosition", "_addedHelpers", "_objHelped", "_helperQueue"];

        if (!ace_interact_menu_keydown) then {
            {deleteVehicle _x; nil} count _addedHelpers;
            [_pfID] call CBA_fnc_removePerFrameHandler;

        } else {
            // Prevent Rare Error when ending mission with interact key down:
            if (isNull ace_player) exitWith {};

            //If player moved >5 meters from last pos, then rescan
            if (((getPosASL ace_player) distance2D _setPosition) > 5) then {

                private _fncStatement = {
                    params ["", "_player", "_obj"];

                    [_player, _obj] call FUNC(freeUnit);
                };

                private _fncCondition = {
                    params ["_helper", "_player", "_obj"];

                    [_player, _obj, _helper] call FUNC(canFree);
                };

                private _blacklist = [];
                private _blacklistedObjects = [];
                {
                    private _modelName = ((str _x) splitString " .") select 1;
                    if (_modelName in _blacklist) then {_blacklistedObjects pushBackUnique _x;};
                    if !((_x in _objHelped) && {_x in _blacklistedObjects}) then {
                        _objHelped pushBack _x;
                        private _helper = "ACE_LogicDummy" createVehicleLocal [0,0,0];
                        private _action = [
                            QGVAR(rubFree),
                            "Kabelbinder am Baum aufreiben",
                            "\z\ace\addons\captives\ui\handcuff_ca.paa", 
                            _fncStatement, 
                            _fncCondition, 
                            {}, 
                            _x, 
                            {[0,0,0]},
                            5.5,
                            [false, false, false, false, true]
                        ] call ace_interact_menu_fnc_createAction;
                        [_helper, 0, [],_action] call ace_interact_menu_fnc_addActionToObject;
                        
                        _addedHelpers pushBack _helper;
                        _helperQueue pushBack [_helper, _x];
                    };
                    nil
                } count (nearestTerrainObjects [ace_player, ["TREE", "SMALL TREE", "ROCK", "ROCKS"], 15]);

                [
                    {
                        params ["_helperQueue", "_handle"];

                        if (count _helperQueue == 0) exitWith {[_handle] call CBA_fnc_removePerFrameHandler};

                        (_helperQueue deleteAt 0) params ["_helper", "_obj"];
                        _helper setPosASL ([_obj] call FUNC(getObjectPos));
                    }, 
                    0.01, 
                    _helperQueue
                ] call CBA_fnc_addPerFrameHandler;

                _args set [0, getPosASL ace_player];
            };
        };
    }, 
    0.1, 
    [
        ((getPosASL ace_player) vectorAdd [-100,0,0]),
        [],
        [],
        []
    ]
] call CBA_fnc_addPerFrameHandler;
