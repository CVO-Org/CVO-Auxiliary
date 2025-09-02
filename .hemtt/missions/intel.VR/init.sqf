_text = format ["
<font size='12' face='EtelkaMonospacePro'>
Message history:%1
From: B. Keller%1
To: All Shift Captains</font>%1
%1
Hey Shift Captains, we at Daltgreen have been pioneers in extraction for decades, leading the field in new and exciting techniques for mining.%1
Today, we are rolling out another of our revolutionary innovations in geoengineering, and you will be the first people to use this revolution in the field!%1
One word of caution, some of the materials we will be working with will be moderately hazardous, and we recommend that all Daltgreen personnel use appropriate personal protective equipment.%1
Your teams will be issued the correct PPE at your next pre-shift meeting.%1
",
"<br />"];

[
    laptop,
    "Network-Log",
    _text,
    nil,
    false
] call cvo_intel_fnc_createIntel;

[
    laptop_1,
    "E-Mails",
    _text,
    nil,
    false
] call cvo_intel_fnc_createIntel;

[
    laptop_2,
    "E-Mails",
    _text,
    nil,
    true
] call cvo_intel_fnc_createIntel;

[
    laptop_3,
    "Network-Log",
    _text,
    "Test Group",
    false
] call cvo_intel_fnc_createIntel;

[
    laptop_4,
    "E-Mails",
    _text,
    "Test Group"
] call cvo_intel_fnc_createIntel;

[
    laptop_5,
    "Network-Log",
    _text,
    "Test Group",
    false
] call cvo_intel_fnc_createIntel;
