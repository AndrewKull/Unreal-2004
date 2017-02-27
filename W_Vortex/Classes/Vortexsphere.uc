/*******************************************************************************
 * Vortexsphere generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2013 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class Vortexsphere extends Actor
    notplaceable;

var float StartLifespan;
var() float StartSize;
var() float FinalSize;
var() float CollapseTime;
var bool bStartedCollapsing;

event Tick(float DeltaTime)
{
    local float timescaler;

    // End:0x18
    if(StartLifespan == float(0))
    {
        StartLifespan = LifeSpan;
    }
    // End:0x56
    if(LifeSpan > CollapseTime)
    {
        timescaler = Lerp((LifeSpan - CollapseTime) / (StartLifespan - CollapseTime), FinalSize, StartSize);
    }
    // End:0x74
    else
    {
        timescaler = Lerp(LifeSpan / CollapseTime, 0.10, FinalSize);
    }
    SetDrawScale(timescaler);
    ScaleGlow = timescaler;
    //return;    
}

defaultproperties
{
    StartSize=2.70
    FinalSize=3.50
    CollapseTime=0.50
    LightEffect=6
    LightHue=170
    LightSaturation=76
    LightBrightness=102.0
    LightRadius=255.0
    DrawType=8
    StaticMesh=StaticMesh'ChaosExtras.Vortex.ChaosSphere1'
    bLightChanged=true
    Physics=10
    RemoteRole=0
    Skins(0)=FinalBlend'XEffectMat.Shock.ShockDarkFB'
    bUnlit=true
}