class Extended_PreStart_EventHandlers {
    class ADDON {
        init = QUOTE(call COMPILE_FILE(XEH_preStart));
    };
};
class Extended_PreInit_EventHandlers {
    class ADDON {
        init = QUOTE(call COMPILE_FILE(XEH_preInit));
    };
};
class Extended_PostInit_EventHandlers {
    class ADDON {
        init = QUOTE(call COMPILE_FILE(XEH_postInit));
        clientInit = QUOTE(call COMPILE_FILE(XEH_clientInit));
    };
};
//release escorted captive when entering a vehicle
class Extended_GetIn_EventHandlers {
    class All {
        class ace_captives_AutoDetachCaptive {
            getIn = QUOTE(_this call FUNC(handleGetIn));
        };
    };
};
//reset captive animation after leaving vehicle
class Extended_GetOut_EventHandlers {
    class All {
        class ace_captives_AutoDetachCaptive {
            getOut = QUOTE(_this call FUNC(handleGetOut));
        };
    };
};
//mission start
class Extended_InitPost_EventHandlers {
    class CAManBase {
        class ace_captives_InitPost {
            init = QUOTE(_this call FUNC(handleUnitInitPost));
        };
    };
};
//make sure captiveNum is reset on respawn
class Extended_Respawn_EventHandlers {
    class CAManBase {
        class ace_captives {
            respawn = QUOTE(_this call FUNC(handleRespawn));
        };
    };
};
class Extended_Local_EventHandlers {
    class CAManBase {
        class ace_captives {
            local = QUOTE(call FUNC(handleLocal));
        };
    };
};
class Extended_Killed_EventHandlers {
    class CAManBase {
        class ace_captives {
            killed = QUOTE(_this call FUNC(handleKilled));
        };
    };
};
