<Cabbage>
form caption("HRange Example") size(380, 500), guiMode("queue"), colour(2, 145, 209) pluginId("def1")
texteditor bounds(14, 260, 352, 228) channel("infoText"), readOnly(1), wrap(1), scrollbars(1)

hrange bounds(22, 20, 336, 40) channel("rangeMin1", "rangeMax1") range(0, 1000, 100:200, 1, 0.001)
hrange bounds(22, 60, 336, 40) channel("rangeMin2", "rangeMax2") range(0, 1000, 200:300, 1, 0.001)
hrange bounds(22, 100, 336, 40) channel("rangeMin3", "rangeMax3") range(0, 1000, 400:500, 1, 0.001)
hrange bounds(22, 140, 336, 40) channel("rangeMin4", "rangeMax4") range(0, 1000, 600:700, 1, 0.001)
hrange bounds(22, 180, 336, 40) channel("rangeMin5", "rangeMax5") range(0, 1000, 800:900, 1, 0.001)
</Cabbage>
<CsoundSynthesizer>
<CsOptions>
-n -d 
</CsOptions>e
<CsInstruments>
; Initialize the global variables. 
ksmps = 16
nchnls = 2
0dbfs = 1

; Rory Walsh 2021 
;
; License: CC0 1.0 Universal
; You can copy, modify, and distribute this file, 
; even for commercial purposes, all without asking permission. 

instr 99

    SText  = "A form represents an instrument plugin window. All widgets are positioned relative to the top left of the form, i.e., position 0,0.\n\nWhen declaring a form, you can also set some useful attributes of your plugin such as the pluginId and plugin delay compensation (latency)."
    cabbageSet "infoText", "text", SText
    
endin

instr 1
    kMin cabbageGetValue sprintf("rangeMin%d", p4)
    kMax cabbageGetValue sprintf("rangeMax%d", p4)
    
    a1 pinker
    aBp butterbp a1, kMin+(kMax-kMin/2), kMax-kMin
    outs aBp, aBp

    kFreq = abs(jspline(900, .1, .3))
    cabbageSetValue sprintf("rangeMin%d", p4), kFreq, metro(1)
    cabbageSetValue sprintf("rangeMax%d", p4), kFreq+100, metro(1)

endin

</CsInstruments>
<CsScore>
;causes Csound to run for about 7000 years...
f0 z
;starts instrument 1 and runs it for a week
i1 0 z 1
i1 0 z 2
i1 0 z 3
i1 0 z 4
i1 0 z 5
i99 0 z

</CsScore>
</CsoundSynthesizer>
