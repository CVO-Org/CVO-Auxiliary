/*
*   CVO Arsenal Define File
*   This file will handle everything needed for the CVO Arsenal System.
*
* # General Attributes:
*   editor_layer_name       <STRING>                Provide an Eden Editor layer name. All Objects inside this Layer will be made into CVO Arsenal Objects.
*   object_variable_names   <ARRAY of STRINGS>      Provide the variable names of individual objects to make them into CVO Arsenal Objects.

* # Kits
*   In general, a Kit is a collection of items.
*   Optionally, some strings can be attached to it - For example: Addon dependency or a condition.
* 
* ## Kit Attributes:
*   addon_dependency     <STRING>   Name of an Addon - Will Check if the Addon is currently loaded. <Default: ""> Empty String will skip check.             Example: addon_dependency = "cigs_core";
*   role                 <STRING>   Name/Identifyer of the Role. case-unsensitive.                  <Default: ""> Empty String will never get applied.      Example: role = "Machinegunner";
*   id64                 <STRING>   steamID64 - getPlayerUID                                        <Default: ""> Empty String will never get applied.      Example: id64 = "123123123123";
*   condition            <STRING>   Code as String, needs to return boolean.                        <Default: ""> Empty String will skip check.             Example: condition = "missionNamespace getVariable ["cvo_nightFight", false]";
*   code                 <STRING>   Code as String, needs to return array of classnames.            <Default: ""> Empty String will skip execution.         Example: code = "if (1 == 1) then { ["ace_banana"] } else { [] }";
*   items <CLASS with SUBCLASSES>                                                                                                                           Example: class items {
*   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~                                                                                                                                   |     class ace_banana;
*   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~                                                                                                                                   | };
*
*/

class cvo_arsenal_kits
{
    editor_layer_name = "cvo_arsenal_objects";
    object_variable_names[] = {"source"};

    // Imports Base from configFile
    import Base from cvo_arsenal_kits;

    // Base Kit - AK47 for everyone!
    class AK74: Base {
        class items {
            class ACE_bodyBag;
            class ACE_bodyBag_blue;
            class ACE_bodyBag_white;
        };
    };
    
    // Role Kit - Spare Barrels for Machinegunner's!
    class BarrelsForMG: Base {
        role = "Machinegunner";
        class items {
            class ACE_personalAidKit;
        };
    };

    // Personal Kit - Banana for the good boi!
    class something: Base {
        id64 = "123123";
        class items {
            class ace_banana;
            class ACE_suture;
        };
    };
};
