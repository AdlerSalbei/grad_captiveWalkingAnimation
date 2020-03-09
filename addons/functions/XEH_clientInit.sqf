#include "script_component.hpp"

diag_log "Adding Client EH";

if (!hasInterface) exitWith {};

["ace_interactMenuOpened", {_this call FUNC(interactionEH)}] call CBA_fnc_addEventHandler;