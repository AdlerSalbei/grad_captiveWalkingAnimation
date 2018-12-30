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
                class ace_captives_UnloadCaptive {
                    statement = QUOTE([ARR_2(_player, _target)] call FUNC(doUnloadCaptive));
                };
            };
        };

        class ACE_SelfActions {
            class ACE_StopEscortingSelf {
                statement = QUOTE([ARR_3(_player,objNull, false)] call FUNC(doEscortCaptive));
            };

        };
    };

    class Logic;
    class Module_F: Logic {
        class ArgumentsBaseUnits {};
        class ModuleDescription {};
    };

    class ace_captives_ModuleHandcuffed: Module_F {
        function = QFUNC(moduleHandcuffed);
    };
};
