#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = QUOTE(ADDON);
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"ace_captives"};
        authors[] = { "Salbei"};
        VERSION_CONFIG;
    };
};

#include <CfgEventHandlers.hpp>
#include <CfgMoves.hpp>
#include <CfgVehicles.hpp>
