/*
* # CVO Arsenal Define File
*   This file will handle everything needed for the CVO Arsenal System.
*
* ## Kits
*   In general, a Kit is a collection of items.
*   Optionally, some strings can be attached to it - For example: Addon dependency or a condition.
*   Furthermore, these Kits are specified into the following groups:
*   Base Kits     - Available for Everyone.
*   Role Kits     - Available for people with said role, for example Medics.
*   Personal Kits - Available for specific people based on their Steam ID.
* 
* 
* 
* ## General Attributes:
*   editor_layer_name       <STRING>                Provide an Eden Editor layer name. All Objects inside this Layer will be made into CVO Arsenal Objects.
*   object_variable_names   <ARRAY of STRINGS>      Provide the variable names of individual objects to make them into CVO Arsenal Objects.
*
*
*
* # Base Kits
*   These items will be available for everyone. Condition-check, addon-dependency and code execution is optional.
*
* ## Base Kit Attributes:
*   addon_dependency    <STRING>    Name of an Addon - Will Check if the Addon is currently loaded. <Default: ""> Empty String will skip check.
*   condition           <STRING>    Code as String, needs to return boolean.                        <Default: ""> Empty String will skip check.
*   code                <STRING>    Code as String, needs to return array of classnames.            <Default: ""> Empty String will skip execution.
*   items <SUBCLASS with CLASSES>   
*
*
*
* # Role Kits
*   These items will be available for who has the specified role. Condition-check, addon-dependency and code execution is optional.
*
* ## Role Kit Attributes:
*   role                <STRING>    Name/Identifyer of the Role. case-unsensitive.                  <Default: ""> Empty String will never get applied.
*   addon_dependency    <STRING>    Name of an Addon - Will Check if the Addon is currently loaded. <Default: ""> Empty String will skip check.
*   condition           <STRING>    Code as String, needs to return boolean.                        <Default: ""> Empty String will skip check.
*   code                <STRING>    Code as String, needs to return array of classnames.            <Default: ""> Empty String will skip execution.
*   items <SUBCLASS with CLASSES>   
*
*
*
* # Personal Kits
*   These items will be available only for those with the specified steam64id. Condition-check, addon-dependency and code execution is optional.
*
* ## Personal Kit Attributes:
*   id                  <STRING>    steamID64 - getPlayerUID                                        <Default: ""> Empty String will never get applied.
*   addon_dependency    <STRING>    Name of an Addon - Will Check if the Addon is currently loaded. <Default: ""> Empty String will skip check.
*   condition           <STRING>    Code as String, needs to return boolean.                        <Default: ""> Empty String will skip check.
*   code                <STRING>    Code as String, needs to return array of classnames.            <Default: ""> Empty String will skip execution.
*   items <SUBCLASS with CLASSES>   
*
*
*
* # Example:

    class kits_base {
 
        class AK74forEveryone: Base {
            condition = "";
            addon_dependency = "";
            code = "";
            class items {
                class TAG_AK74;
                class TAG_762_Magazine;
                class TAG_SomeAttachement;
                class TAG_bla;
            };
        };
 
    };

    class kits_role {

        class BarrelsForMG: Base {
            role = "Machinegunner";
            condition = "";
            addon_dependency = "";
            code = "";
            class items {
                class ACE_SpareBarrel;
            };
        };
 
    };

*/




class cvo_arsenal
{
    editor_layer_name = "CVO_Arsenal_Objects";
    object_variable_names[] = {};


    class kits_base {
        class Base;

        // Base Kit - AK47 for everyone!
        class AK74: Base {
            class items {
                class ACE_bodyBag;
            };
        };
    };

    class kits_role {
        class Base;

        // Base Kit - AK47 for everyone!
        class BarrelsForMG: Base {
            role = "Machinegunner";
            class items {
                class ACE_SpareBarrel;
            };
        };

    };

    class kits_personal {
        class Base;

        class something: Base {
            id = "123123";
            class items {
                class ace_banana;
            };
        };

    };
};
