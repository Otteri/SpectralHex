;Please check @Resources/variables.inc before you touch this file.
;All options and necessary initialization fields can be found there.

;Under normal use, the only need to change this file may be the need to 
,add more Launcher meters. If you are looking to do so, do the following:
;Copy/Paste some already existing Launcher. Then:

;Change: 
;1. Metername (the number in brackets)
;2. ImageName,
;3. ImageAlpha, 
;4. LeftMouseUpAction, 
;5. MouseOverAction and 
;6. MouseLeaveAction.
;7. Now everything is done in this file and you can head to "variables.inc".

;----------------------------------------------------------------------------------
;Core meters & functions. There shouldn't be any need to change these unless you are 
;going modify the skin. Notice that almost everything is bound to IconSize variable.
;Launchers X and Y cordinates are automatically set in .lua script.


[Rainmeter]
Update=100
DefaultUpdateDivider=10
ContextTitle=Leto Settings
ContextAction=["#ROOTCONFIGPATH#@Resources\variables.inc"]

[Metadata]
Name=SpectralHex
Author=Otteri
License=Creative Commons BY-NC-SA 3.0
Version=1.0
Original (inspiration from): SPECTRUM
Author=BirdAlliance [birdalliance.deviantart.com]
Information=A set of hidden launchers that can be activated by using mouse.
License=Creative Commons BY-NC-SA 3.0
Version=1.0

[Variables]
;@Include="#@#variables.inc"
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
X=r
Y=r
SolidColor=255,255,255,1
MouseLeaveAction=[!CommandMeasure Fading "Stop 2"][!CommandMeasure Fading "Execute 1"][!SetOption HoldArea Hidden 1][!UpdateMeter HoldArea]
Hidden=1
Group=BG

[Activator]
Meter=Image
ImageName=#@#Images\Icons\0icon0.png
x=r
y=r
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



