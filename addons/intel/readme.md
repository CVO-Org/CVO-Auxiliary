# CVO Intel
An Intel Framework




## Example
```sqf
private _structuredString = "
<font size='12' face='EtelkaMonospacePro'>
<br/>Message history:
<br/>From: B. Keller
<br/>To: All Shift Captains</font>
<br/>
<br/>Hey Shift Captains, we at Daltgreen have been pioneers in extraction for decades, leading the field in new and exciting techniques for mining.
<br/>Today, we are rolling out another of our revolutionary innovations in geoengineering, and you will be the first people to use this revolution in the field!
<br/>One word of caution, some of the materials we will be working with will be moderately hazardous, and we recommend that all Daltgreen personnel use appropriate personal protective equipment.
<br/>Your teams will be issued the correct PPE at your next pre-shift meeting.
";

[
    laptop,             // Object
    "Network-Log",      // Intel Title
    _structuredString,  // Intel Content (Structured Text as STRING)
    nil,                // Intel Group, nil for Default Group (Optional, nil for Default Group: "General")
    false               // Remove Object once Picked up - (Optional - Default: true)
] call cvo_intel_fnc_createIntel;
```

## Structured Text as Strings Examples

### Text Messages
```sqf
private _structuredString = "
<font size='14' face='EtelkaMonospacePro'>
<br/>Messenger App History with 'Boss' - 1 year ago:</font>
<br/>
<br/><font size='12' color='#2dc492' face='EtelkaMonospacePro'>Hey Boss - Bad news - The prisoner died. I think we should have given some water. - Do you want us to wait for the ION guys?</font>
<br/>
<br/><font size='12' color='#2d97fa' face='EtelkaMonospacePro'>Wait until the evening, otherwise just leave.</font>
<br/>
<br/><font size='12' color='#2dc492' face='EtelkaMonospacePro'>We kinda like...got lost on the way here and the GPS ran out of batteries - can you give us the direciton? Jamal has a compass.</font>
<br/>
<br/><font size='12' color='#2d97fa' face='EtelkaMonospacePro'>Seems like you guys outran your own wisdom again... Let me take a look...</font>
<br/>
<br/>
<br/><font size='12' color='#2d97fa' face='EtelkaMonospacePro'>Right... the coordinates we gave you are 1800 meters at bearing 350 from base.</font>
";
```


### Email Message
```sqf
private _structuredString = "
<font size='12' face='EtelkaMonospacePro'>
<br/>Message history:
<br/>From: B. Keller
<br/>To: All Shift Captains</font>
<br/>
<br/>Hey Shift Captains, we at Daltgreen have been pioneers in extraction for decades, leading the field in new and exciting techniques for mining.
<br/>Today, we are rolling out another of our revolutionary innovations in geoengineering, and you will be the first people to use this revolution in the field!
<br/>One word of caution, some of the materials we will be working with will be moderately hazardous, and we recommend that all Daltgreen personnel use appropriate personal protective equipment.
<br/>Your teams will be issued the correct PPE at your next pre-shift meeting.
";
```


### handwritten note with red ink
```sqf
private _structuredString = "
<br/>You found a handwritten note in the ION barracks under a bed:
<br/><font size='24' color='#ff000d' face='shaffilastri'>Take your team and go make sure that village elder cant bother us any more.</font>
";
```


### Images
```sqf
private _structuredString = format ["<img width='370' image='%1'/>", getMissionPath "intel\handdrawnmapws.paa" ];
```


### template
```sqf
private _structuredString = "
<font size='12' face='EtelkaMonospacePro'>
<br/>Message history:
</font>
";
```
