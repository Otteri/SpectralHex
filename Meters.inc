;Core meters & functions are in this file. There shouldn't be any need to change these unless you are 
;going to heavily modify the skin. All user settings can be found in: "SpectralHex.ini", so head there
;if you are looking to set up this skin for the first time.

;-----------------------------------------------------------------------------------------------------------
;Notice that almost everything is bound to IconSize variable.
;Launchers X and Y cordinates are automatically set in .lua script.
;Basically all meters are created here and the script handles almost all the logic.
;Fading is implemented here because it works better (less latency) than in the script file.
;Fade logic is from BirdAliance's SPECTRUM skin.


[Rainmeter]
Update=100
DefaultUpdateDivider=10
ContextTitle=Leto Settings
ContextAction=["#ROOTCONFIGPATH#@Resources\variables.inc"]

[Variables]
Alpha=0
U=[!UpdateMeterGroup BG][!UpdateMeterGroup Icons][!Redraw]

[Fading]
Measure=Plugin
Plugin=ActionTimer
ActionList1=Repeat FadeIn,5,60
FadeIn=[!SetVariable Alpha "(Clamp(#Alpha#-20,0,1200))"][!UpdateMeasure Fading]#U#
ActionList2=Repeat FadeOut,10,80
FadeOut=[!SetVariable Alpha "(Clamp(#Alpha#+20,0,1200))"][!UpdateMeasure Fading]#U#
DynamicVariables=1
IgnoreWarnings=1
IfCondition=(#Alpha#<1)
IfTrueAction=[!HideMeterGroup Icons]
IfCondition2=(#Alpha#>1)
IfTrueAction2=[!ShowMeterGroup Icons]

[HoldArea]
Meter=Image
SolidColor=255,255,255,1
MouseLeaveAction=[!CommandMeasure Fading "Stop 2"][!CommandMeasure Fading "Execute 1"][!SetOption HoldArea Hidden 1][!UpdateMeter HoldArea]
Hidden=1
Group=BG

[Activator]
Meter=Image
SolidColor=255,0,0,1
ImageName=#@#Images\Icons\0icon0.png
w=#IconSize#
h=#IconSize#
ImageAlpha=(#Alpha#+#ActivatorVisibility#)
MouseOverAction=[!CommandMeasure Fading "Stop 1"][!CommandMeasure Fading "Execute 2"] [!SetOption #CURRENTSECTION# ImageName "#@#Images\Icons\0icon0.png"][!UpdateMeter #CURRENTSECTION#][!SetOption HoldArea Hidden 0][!Redraw]
DynamicVariables=1
UpdateDivider=-1
Group=BG

[MeasureLuaScript]
Measure=Script
ScriptFile="#CURRENTPATH#Layout.lua"



