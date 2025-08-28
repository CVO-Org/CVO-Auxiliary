# CVO Arsenal - Framework for ACE Arsenal
## Summary
- Supports Different Roles
- Auto Assigns Roles based on Traits.
- Supports personalized Gear based on Steam64 IDs

### What is a kit?
A Kit is a collection of items made available in the Arsenal.
Optional requirements can be attached to a kit. For example: Roles, Addon dependency or a condition code.
These requirements will be evaluated every time a player opens the CVO Arsenal.

### Roles
Roles are defined by the mission makers.
Some roles will be automatically assigned, based on a units trait.
- ACE Medic / ACE Doctor
- ACE Engineer / ACE Advanced Engineer
- Explosives Specialist

## How to Implement
   1. Load CVO Aux Mod
   2. Create `cvo_arsenal_kits.hpp` and include into mission's `description.ext`
   3. Define Units Roles:
       - `[ this, "someRole" ] call cvo_arsenal_fnc_addUnitRoles;`
       - `[ this, ["someRole"] ] call cvo_arsenal_fnc_addUnitRoles;`
       - `[ this, ["someRole", "anotherRole"] ] call cvo_arsenal_fnc_addUnitRoles;`
       - More Infos [here](functions/roles/fn_addUnitRoles.sqf)

## Hardcoded Kits / Example Kits
The following kits, hardcoded by `CVO Aux Arsenal` can be referenced as examples on how to format a kit.
- [Base Kits - Available vor Everyone](kits_base.hpp)
- [Role Kits - Available for certain Roles](kits_role.hpp)
- [Personal Kits - Available for individual Players](kits_personal.hpp)

### General Attributes
| Attribute Name        | DataType           | Description                                                                                                 | 
| :-------------------- | ------------------ | ----------------------------------------------------------------------------------------------------------- | 
| editor_layer_name     | <STRING>           | Provide an Eden Editor layer name.<br> All Objects inside this Layer will be made into CVO Arsenal Objects. | 
| object_variable_names | <ARRAY of STRINGS> | Provide the variable names of individual objects to make them into CVO Arsenal Objects.                     | 


 
### Kit Attributes:

| Attribute Name   | DataType                | Description                                                     | Default              |
| :--------------- | ----------------------- | --------------------------------------------------------------- | -------------------- |
| addon_dependency | <STRING>                | Name of an Addon - Will Check if the Addon is currently loaded. | `""` Skip check.     |
| roles            | <STRING>                | Name/Identifyer of the Role. case-unsensitive.                  | `""` Applied to all. |
| id64             | <STRING>                | steamID64 - getPlayerUID                                        | `""` Applied to all. |
| condition        | <STRING>                | Code as String - needs to return boolean.                       | `""` Skip check.     |
| code             | <STRING>                | Code as String - needs to return array of classnames.           | `""` Skipped.        |
| items            | <CLASS with SUBCLASSES> | subclasses will get added as item classnames.                   |  |


### Regex Replace Templates
```regex
this setVariable \[""CVO_A_ROLES"",\[(.*)\]\];

[this, [$1]] call cvo_arsenal_fnc_addUnitRoles;
```
