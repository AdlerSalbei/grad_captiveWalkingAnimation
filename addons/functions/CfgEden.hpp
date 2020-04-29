class Cfg3DEN {
    class Object {
        class AttributeCategories {
            class ace_attributes {
                class Attributes {
                    class ace_isHandcuffed {
                        expression = QUOTE(if (_value) then {[ARR_3(objNull,[_this],true)] call FUNC(moduleHandcuffed)});
                    };
                };
            };
        };
    };
};