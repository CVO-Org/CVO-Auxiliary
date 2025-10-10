# cvo_common_fnc_cutscene

This function allows you to easily create human-readable cutscene timelines in Arma 3, without worrying about the underlying implementation details.

**Note:** This function should be executed on individual clients. Server-only code execution should be handled separately.


## Usage

Call the function with an array of timeline entries.  
Each entry is an array: `[type, arguments...]`.

**Example:**

```sqf
[
    ["START", 6], // Fade to black for 6 seconds
    ["CODE", { disableUserInput true; }], // Disable user input
    ["TEXT", "In 1974, the colonial government of Bocano collapsed with the fall of the Estado Novo."],
    ["TEXT", "Good Luck....."],
    ["RAVEN", 6], // Show Raven image for 6 seconds
    ["CODE", { while {userInputDisabled} do {disableUserInput false;}; }],
    ["END", 6] // Fade from black for 6 seconds
] call cvo_common_fnc_cutscene;
```

---

## Timeline Entry Types

| Type         | Description                    | Arguments                                      | Adds Duration to Delay | Example Usage                      |
|--------------|-------------------------------|------------------------------------------------|:---------------------:|------------------------------------|
| `START`      | Fade screen to black          | Duration (number, seconds)                     | Yes                   | `["START", 6]`                     |
| `END`        | Fade screen from black        | Duration (number, seconds)                     | No                    | `["END", 6]`                       |
| `TEXT`       | Text overlay on background    | String/Array of strings, Duration (seconds)    | Yes                   | `["TEXT", "Hello", 7]`             |
| `TEXT_PLAIN` | Text overlay, no background   | String/Array of strings, Duration (seconds)    | Yes                   | `["TEXT_PLAIN", ["Line 1", "Line 2"], 7]` |
| `BLUR_IN`    | Fade in blur effect           | Duration (number, seconds)                     | No                    | `["BLUR_IN", 3]`                   |
| `BLUR_OUT`   | Fade out blur effect          | Duration (number, seconds)                     | No                    | `["BLUR_OUT", 3]`                  |
| `DELAY`      | Add delay only                | Duration (number, seconds)                     | Yes                   | `["DELAY", 5]`                     |
| `CODE`       | Execute code                  | Code block, optional params                    | No                    | `["CODE", { hint "Hello"; }]`      |
| `RAVEN`      | Show Raven image              | Duration (number, seconds)                     | No                    | `["RAVEN", 6]`                     |

**Notes:**
- For `TEXT` and `TEXT_PLAIN`, you can pass a single string or an array of strings.
- For `CODE`, you may optionally pass parameters as the second argument.

---

## Customization

You can override the following global variables via `missionNamespace setVariable` to change cutscene appearance:

| Variable Name                        | Default Value    | Description                          |
|-------------------------------------- |-----------------|--------------------------------------|
| `cvo_common_cutscene_defaultDelay`    | `7`             | Default duration and delay (seconds) |
| `cvo_common_cutscene_defaultSize`     | `3`             | Default font size for text           |
| `cvo_common_cutscene_defaultColor`    | `"#690000"`     | Default font color for text          |
| `cvo_common_cutscene_defaultFont`     | `"EraserRegular"`| Default font for text                |

**Example:**
```sqf
missionNamespace setVariable ["cvo_common_cutscene_defaultDelay", 10];
missionNamespace setVariable ["cvo_common_cutscene_defaultFont", "PuristaMedium"];
```

---

## Tips

- Always execute on clients, not the server.
- Use `CODE` entries for custom logic (e.g., disabling controls).
- Combine types for more complex cutscenes.
