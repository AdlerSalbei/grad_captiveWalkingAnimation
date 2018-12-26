#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        author = "$STR_grad_Author";
        name = CSTRING(component);
        url = "$STR_grad_URL";
        units[] = {};
        weapons[] = {};
        requiredAddons[] = {"ace_captives"};
        VERSION_CONFIG;
        authors[] = {"Salbei"};
    };
};
