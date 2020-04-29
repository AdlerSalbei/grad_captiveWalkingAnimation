class CfgVehicles {
    class Man;
    class CAManBase: Man {
        class ACE_Actions {
            class ACE_ApplyHandcuffs {
                statement = QUOTE([ARR_2(_player, _target)] call FUNC(doApplyHandcuffs));
            };

            class ACE_MainActions {
                class ACE_RemoveHandcuffs {
                    statement = QUOTE([ARR_2(_player, _target)] call FUNC(doRemoveHandcuffs));
                };
                class ACE_EscortCaptive {
                    statement = QUOTE([ARR_3(_player, _target, true)] call FUNC(doEscortCaptive));
                };
                class ACE_StopEscorting {
                    statement = QUOTE([ARR_3(_player,_target, false)] call FUNC(doEscortCaptive));
                };
                class ACE_LoadCaptive {
                    statement = QUOTE([ARR_3(_player, _target, objNull)] call FUNC(doLoadCaptive));
                };
                class ace_captives_UnloadCaptive {
                    statement = QUOTE([ARR_2(_player, _target)] call FUNC(doUnloadCaptive));
                };
            };
        };

        class ACE_SelfActions {
            exceptions[] = {"isNotHandcuffed"};
            class ACE_StopEscortingSelf {
                statement = QUOTE([ARR_3(_player,objNull, false)] call FUNC(doEscortCaptive));
            };
            class GVAR(freeInVehicle) {
                displayName = CSTRING(breakCableTie);
                icon = "\z\ace\addons\captives\ui\handcuff_ca.paa";
                condition = QUOTE([_player] call FUNC(canFreeInVehicle));
                statement = QUOTE([_player] call FUNC(freeUnit));
                exceptions[] = {"isNotHandcuffed"};
                showDisabled = 0;
            };
        };
    };

    #define MACRO_LOADCAPTIVE \
        class ACE_Actions { \
            class ACE_MainActions { \
                class ace_captives_LoadCaptive { \
                    statement = QUOTE([ARR_3(_player, objNull, _target)] call FUNC(doLoadCaptive)); \
                }; \
            }; \
        };

    class LandVehicle;
    class Car: LandVehicle {
        MACRO_LOADCAPTIVE
    };
    class Tank: LandVehicle {
        MACRO_LOADCAPTIVE
    };

    class Air;
    class Helicopter: Air {
        MACRO_LOADCAPTIVE
    };
    class Plane: Air {
        MACRO_LOADCAPTIVE
    };

    class Ship;
    class Ship_F: Ship {
        MACRO_LOADCAPTIVE
    };

    class StaticWeapon: LandVehicle {
        MACRO_LOADCAPTIVE
    };

    class Logic;
    class Module_F: Logic {
        class ArgumentsBaseUnits {};
        class ModuleDescription {};
    };

    class ace_captives_ModuleHandcuffed: Module_F {
        function = QFUNC(moduleHandcuffed);
    };

    class Land_HelipadEmpty_F;
    class ACE_LogicDummy: Land_HelipadEmpty_F {
        class ACE_Actions {
            class ACE_MainActions {
            exceptions[] = {"isNotHandcuffed"};
            };
        };
    };
};
