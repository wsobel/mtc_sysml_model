---
title: "Sample"
parent: "Observation Information Model Package"
nav_order: 13
layout: default
---

# Sample

**Supertype:** `Observation`
## Version Info

{: .auto-width }
| Introduced | Deprecated | Updated |"
|---|---|---|
| 1.0 |  |   |

[`Observation`]({% link model/ReferenceAgentArchitecture/InformationModel/Observation.md %}) that is continuously changing or analog data value.

### Description


It provides the information and data reported from a piece of equipment for those [`DataItem`]({% link model/DeviceInformationModel/DataItems/DataItem.md %}) entities defined with [`DataItem`]({% link model/DeviceInformationModel/DataItems/DataItem.md %})::`category` as `SAMPLE` in the <span class="hoverterm">MTConnectDevices Response Document<span class="definition" data-term="MTConnectDevices Response Document">*response document* published by an *MTConnect Agent* in response to a *probe request*.</span></span>.

[`Sample`]({% link model/DeviceInformationModel/DataItems/DataItemTypes/Sample.md %}) **MUST** always be reported in `float`.

*Figure Sample Example* shows [`Sample`]({% link model/DeviceInformationModel/DataItems/DataItemTypes/Sample.md %}) type examples. It also shows an example for when the [`Observation`]({% link model/ReferenceAgentArchitecture/InformationModel/Observation.md %})::`result` is not available (`dataItemId`=`cspeed`).

![Sample Example]({% link figures/mtconnect.png %} "Sample Example"){: width="80.0%"}

> Note: See sample-example for the *XML* representation of the same example.

The following *Section Value Properties of Sample* lists the additional and/or updated attributes for [`Sample`]({% link model/DeviceInformationModel/DataItems/DataItemTypes/Sample.md %}).

## Properties

<table><thead><tr><th>Name</th><th>Type</th><th>Int</th><th>Dep</th><th>Multiplicty</th><th>Description</th></tr></thead><tbody>
<tr><td><code>duration</code></td><td><code>SECOND</code></td><td>1.2</td><td></td><td>0..1</td>
<td markdown="block">

time-period over which the data was collected.

[`Sample`]({% link model/DeviceInformationModel/DataItems/DataItemTypes/Sample.md %})::`duration` **MUST** be provided when the [`DataItem`]({% link model/DeviceInformationModel/DataItems/DataItem.md %})::`statistic` is defined in the <span class="hoverterm">MTConnectDevices Response Document<span class="definition" data-term="MTConnectDevices Response Document">*response document* published by an *MTConnect Agent* in response to a *probe request*.</span></span>. 

</td>
</tr>
<tr><td><code>resetTriggered</code></td><td><a href="{% link model/Profile/DataTypes/ResetTriggeredEnum.md %}"><code>ResetTriggeredEnum</code></a></td><td>1.4</td><td></td><td>0..1</td>
<td markdown="block">

identifies when a reported value has been reset and what has caused that reset to occur for those [`DataItem`]({% link model/DeviceInformationModel/DataItems/DataItem.md %}) entities that may be periodically reset to an initial value.

`resetTriggered` **MUST** only be provided for the specific occurrence of a [`DataItem`]({% link model/DeviceInformationModel/DataItems/DataItem.md %}) reported in the <span class="hoverterm">MTConnectStreams Response Document<span class="definition" data-term="MTConnectStreams Response Document">*response document* published by an *MTConnect Agent* in response to a *current request* or a *sample request*.</span></span> when the reset occurred. 

</td>
</tr>
<tr><td><code>sampleRate</code></td><td><code>float</code></td><td>1.2</td><td></td><td>0..1</td>
<td markdown="block">

rate at which successive samples of the value are recorded.
 

</td>
</tr>
<tr><td><code>statistic</code></td><td><a href="{% link model/Profile/DataTypes/StatisticEnum.md %}"><code>StatisticEnum</code></a></td><td>1.2</td><td></td><td>0..1</td>
<td markdown="block">

type of statistical calculation defined by the [`DataItem`]({% link model/DeviceInformationModel/DataItems/DataItem.md %})::`statistic` defined in the <span class="hoverterm">MTConnectDevices Response Document<span class="definition" data-term="MTConnectDevices Response Document">*response document* published by an *MTConnect Agent* in response to a *probe request*.</span></span>. 

</td>
</tr>
<tr><td><code>result</code></td><td><code>float</code></td><td>1.0</td><td></td><td>0..1</td>
<td markdown="block">

 

</td>
</tr>
<tr><td><code>units</code></td><td><a href="{% link model/Profile/DataTypes/UnitEnum.md %}"><code>UnitEnum</code></a></td><td>1.0</td><td></td><td>1</td>
<td markdown="block">

 

</td>
</tr>
<tr><td><code>type</code></td><td><a href="{% link model/Profile/DataTypes/SampleEnum.md %}"><code>SampleEnum</code></a></td><td>1.0</td><td></td><td>1</td>
<td markdown="block">

 

</td>
</tr>
</tbody></table>

## Subclasses

{: .auto-width }
| Name | Int | Dep |
|---|---|---|
| [`Acceleration`]({% link model/ObservationInformationModel/ObservationTypes/SampleTypes/Acceleration.md %}) | 1.0 |  |
| [`AccumulatedTime`]({% link model/ObservationInformationModel/ObservationTypes/SampleTypes/AccumulatedTime.md %}) | 1.2 |  |
| [`Amperage`]({% link model/ObservationInformationModel/ObservationTypes/SampleTypes/Amperage.md %}) | 1.0 | 1.6 |
| [`AmperageAC`]({% link model/ObservationInformationModel/ObservationTypes/SampleTypes/AmperageAC.md %}) | 1.6 |  |
| [`AmperageDC`]({% link model/ObservationInformationModel/ObservationTypes/SampleTypes/AmperageDC.md %}) | 1.6 |  |
| [`Angle`]({% link model/WIPDeviceExamples/KinematicsSimulation/XArm7Model/Angle.md %}) | 1.0 |  |
| [`AngularAcceleration`]({% link model/ObservationInformationModel/ObservationTypes/SampleTypes/AngularAcceleration.md %}) | 1.0 |  |
| [`AngularDeceleration`]({% link model/ObservationInformationModel/ObservationTypes/SampleTypes/AngularDeceleration.md %}) | 1.7 |  |
| [`AngularVelocity`]({% link model/ObservationInformationModel/ObservationTypes/SampleTypes/AngularVelocity.md %}) | 1.0 |  |
| [`AssetUpdateRate`]({% link model/ObservationInformationModel/ObservationTypes/SampleTypes/AssetUpdateRate.md %}) | 1.7 |  |
| [`AxisFeedrate`]({% link model/ObservationInformationModel/ObservationTypes/SampleTypes/AxisFeedrate.md %}) | 1.0 |  |
| [`BatteryCapacity`]({% link model/ObservationInformationModel/ObservationTypes/SampleTypes/BatteryCapacity.md %}) | 2.1 |  |
| [`BatteryCharge`]({% link model/ObservationInformationModel/ObservationTypes/SampleTypes/BatteryCharge.md %}) | 2.1 |  |
| [`CapacityFluid`]({% link model/ObservationInformationModel/ObservationTypes/SampleTypes/CapacityFluid.md %}) | 1.5 |  |
| [`CapacitySpatial`]({% link model/ObservationInformationModel/ObservationTypes/SampleTypes/CapacitySpatial.md %}) | 1.5 |  |
| [`ChargeRate`]({% link model/ObservationInformationModel/ObservationTypes/SampleTypes/ChargeRate.md %}) | 2.1 |  |
| [`Concentration`]({% link model/ObservationInformationModel/ObservationTypes/SampleTypes/Concentration.md %}) | 1.2 |  |
| [`Conductivity`]({% link model/ObservationInformationModel/ObservationTypes/SampleTypes/Conductivity.md %}) | 1.2 |  |
| [`CuttingSpeed`]({% link model/ObservationInformationModel/ObservationTypes/SampleTypes/CuttingSpeed.md %}) | 1.5 |  |
| [`Deceleration`]({% link model/ObservationInformationModel/ObservationTypes/SampleTypes/Deceleration.md %}) | 1.7 |  |
| [`Density`]({% link model/ObservationInformationModel/ObservationTypes/SampleTypes/Density.md %}) | 1.5 |  |
| [`DepositionAccelerationVolumetric`]({% link model/ObservationInformationModel/ObservationTypes/SampleTypes/DepositionAccelerationVolumetric.md %}) | 1.5 |  |
| [`DepositionDensity`]({% link model/ObservationInformationModel/ObservationTypes/SampleTypes/DepositionDensity.md %}) | 1.5 |  |
| [`DepositionMass`]({% link model/ObservationInformationModel/ObservationTypes/SampleTypes/DepositionMass.md %}) | 1.5 |  |
| [`DepositionRateVolumetric`]({% link model/ObservationInformationModel/ObservationTypes/SampleTypes/DepositionRateVolumetric.md %}) | 1.5 |  |
| [`DepositionVolume`]({% link model/ObservationInformationModel/ObservationTypes/SampleTypes/DepositionVolume.md %}) | 1.5 |  |
| [`DewPoint`]({% link model/ObservationInformationModel/ObservationTypes/SampleTypes/DewPoint.md %}) | 2.1 |  |
| [`Diameter`]({% link model/ObservationInformationModel/ObservationTypes/SampleTypes/Diameter.md %}) | 1.6 |  |
| [`DischargeRate`]({% link model/ObservationInformationModel/ObservationTypes/SampleTypes/DischargeRate.md %}) | 2.1 |  |
| [`Displacement`]({% link model/ObservationInformationModel/ObservationTypes/SampleTypes/Displacement.md %}) | 1.0 |  |
| [`DisplacementAngular`]({% link model/ObservationInformationModel/ObservationTypes/SampleTypes/DisplacementAngular.md %}) | 2.1 |  |
| [`DisplacementLinear`]({% link model/ObservationInformationModel/ObservationTypes/SampleTypes/DisplacementLinear.md %}) | 2.1 |  |
| [`ElectricalEnergy`]({% link model/ObservationInformationModel/ObservationTypes/SampleTypes/ElectricalEnergy.md %}) | 1.2 |  |
| [`EquipmentTimer`]({% link model/ObservationInformationModel/ObservationTypes/SampleTypes/EquipmentTimer.md %}) | 1.4 |  |
| [`FillHeight`]({% link model/ObservationInformationModel/ObservationTypes/SampleTypes/FillHeight.md %}) | 2.5 |  |
| [`FillLevel`]({% link model/ObservationInformationModel/ObservationTypes/SampleTypes/FillLevel.md %}) | 1.2 |  |
| [`Flow`]({% link model/ObservationInformationModel/ObservationTypes/SampleTypes/Flow.md %}) | 1.2 |  |
| [`FollowingError`]({% link model/ObservationInformationModel/ObservationTypes/SampleTypes/FollowingError.md %}) | 2.1 |  |
| [`FollowingErrorAngular`]({% link model/ObservationInformationModel/ObservationTypes/SampleTypes/FollowingErrorAngular.md %}) | 2.1 |  |
| [`FollowingErrorLinear`]({% link model/ObservationInformationModel/ObservationTypes/SampleTypes/FollowingErrorLinear.md %}) | 2.1 |  |
| [`Frequency`]({% link model/ObservationInformationModel/ObservationTypes/SampleTypes/Frequency.md %}) | 1.0 |  |
| [`GlobalPosition`]({% link model/ObservationInformationModel/ObservationTypes/SampleTypes/GlobalPosition.md %}) | 1.0 | 1.1 |
| [`GravitationalAcceleration`]({% link model/ObservationInformationModel/ObservationTypes/SampleTypes/GravitationalAcceleration.md %}) | 2.1 |  |
| [`GravitationalForce`]({% link model/ObservationInformationModel/ObservationTypes/SampleTypes/GravitationalForce.md %}) | 2.1 |  |
| [`HumidityAbsolute`]({% link model/ObservationInformationModel/ObservationTypes/SampleTypes/HumidityAbsolute.md %}) | 1.6 |  |
| [`HumidityRelative`]({% link model/ObservationInformationModel/ObservationTypes/SampleTypes/HumidityRelative.md %}) | 1.6 |  |
| [`HumiditySpecific`]({% link model/ObservationInformationModel/ObservationTypes/SampleTypes/HumiditySpecific.md %}) | 1.6 |  |
| [`Length`]({% link model/ObservationInformationModel/ObservationTypes/SampleTypes/Length.md %}) | 1.3 |  |
| [`Level`]({% link model/ObservationInformationModel/ObservationTypes/SampleTypes/Level.md %}) | 1.1 | 1.2 |
| [`LinearForce`]({% link model/ObservationInformationModel/ObservationTypes/SampleTypes/LinearForce.md %}) | 1.2 |  |
| [`Load`]({% link model/ObservationInformationModel/ObservationTypes/SampleTypes/Load.md %}) | 1.0 |  |
| [`Mass`]({% link model/ObservationInformationModel/ObservationTypes/SampleTypes/Mass.md %}) | 1.2 |  |
| [`ObservationUpdateRate`]({% link model/ObservationInformationModel/ObservationTypes/SampleTypes/ObservationUpdateRate.md %}) | 1.7 |  |
| [`Openness`]({% link model/ObservationInformationModel/ObservationTypes/SampleTypes/Openness.md %}) | 2.0 |  |
| [`Orientation`]({% link model/ObservationInformationModel/ObservationTypes/SampleTypes/Orientation.md %}) | 1.6 |  |
| [`PH`]({% link model/ObservationInformationModel/ObservationTypes/SampleTypes/PH.md %}) | 1.1 |  |
| [`ParticleCount`]({% link model/ObservationInformationModel/ObservationTypes/SampleTypes/ParticleCount.md %}) | 2.5 |  |
| [`ParticleSize`]({% link model/ObservationInformationModel/ObservationTypes/SampleTypes/ParticleSize.md %}) | 2.5 |  |
| [`PathFeedrate`]({% link model/ObservationInformationModel/ObservationTypes/SampleTypes/PathFeedrate.md %}) | 1.0 |  |
| [`PathFeedratePerRevolution`]({% link model/ObservationInformationModel/ObservationTypes/SampleTypes/PathFeedratePerRevolution.md %}) | 1.5 |  |
| [`PathPosition`]({% link model/ObservationInformationModel/ObservationTypes/SampleTypes/PathPosition.md %}) | 1.1 |  |
| [`Position`]({% link model/WIPDeviceExamples/KinematicsSimulation/XArm7Model/Position.md %}) | 1.0 |  |
| [`PositionCartesian`]({% link model/ObservationInformationModel/ObservationTypes/SampleTypes/PositionCartesian.md %}) | 2.1 |  |
| [`PowerFactor`]({% link model/ObservationInformationModel/ObservationTypes/SampleTypes/PowerFactor.md %}) | 1.2 |  |
| [`Pressure`]({% link model/DeviceInformationModel/Components/ComponentTypes/Pressure.md %}) | 1.0 |  |
| [`PressureAbsolute`]({% link model/ObservationInformationModel/ObservationTypes/SampleTypes/PressureAbsolute.md %}) | 1.7 |  |
| [`PressurizationRate`]({% link model/ObservationInformationModel/ObservationTypes/SampleTypes/PressurizationRate.md %}) | 1.7 |  |
| [`ProcessTimer`]({% link model/ObservationInformationModel/ObservationTypes/SampleTypes/ProcessTimer.md %}) | 1.4 |  |
| [`Resistance`]({% link model/ObservationInformationModel/ObservationTypes/SampleTypes/Resistance.md %}) | 1.2 |  |
| [`Resistivity`]({% link model/ObservationInformationModel/ObservationTypes/SampleTypes/Resistivity.md %}) | 2.5 |  |
| [`RotaryVelocity`]({% link model/ObservationInformationModel/ObservationTypes/SampleTypes/RotaryVelocity.md %}) | 1.2 |  |
| [`SettlingError`]({% link model/ObservationInformationModel/ObservationTypes/SampleTypes/SettlingError.md %}) | 2.1 |  |
| [`SettlingErrorAngular`]({% link model/ObservationInformationModel/ObservationTypes/SampleTypes/SettlingErrorAngular.md %}) | 2.1 |  |
| [`SettlingErrorLinear`]({% link model/ObservationInformationModel/ObservationTypes/SampleTypes/SettlingErrorLinear.md %}) | 2.1 |  |
| [`SoundLevel`]({% link model/ObservationInformationModel/ObservationTypes/SampleTypes/SoundLevel.md %}) | 1.2 |  |
| [`SpindleSpeed`]({% link model/ObservationInformationModel/ObservationTypes/SampleTypes/SpindleSpeed.md %}) | 1.0 | 1.2 |
| [`Strain`]({% link model/ObservationInformationModel/ObservationTypes/SampleTypes/Strain.md %}) | 1.2 |  |
| [`Temperature`]({% link model/WIPDeviceExamples/MillwSmoothG/Representation/Temperature.md %}) |  |  |
| [`Temperature`]({% link model/WIPDeviceExamples/MillwSmoothG/Representation/Temperature.md %}) | 1.0 |  |
| [`Tension`]({% link model/ObservationInformationModel/ObservationTypes/SampleTypes/Tension.md %}) | 1.4 |  |
| [`Tilt`]({% link model/ObservationInformationModel/ObservationTypes/SampleTypes/Tilt.md %}) | 1.2 |  |
| [`Torque`]({% link model/ObservationInformationModel/ObservationTypes/SampleTypes/Torque.md %}) | 1.0 |  |
| [`Velocity`]({% link model/ObservationInformationModel/ObservationTypes/SampleTypes/Velocity.md %}) | 1.0 |  |
| [`Viscosity`]({% link model/ObservationInformationModel/ObservationTypes/SampleTypes/Viscosity.md %}) | 1.2 |  |
| [`VoltAmpere`]({% link model/ObservationInformationModel/ObservationTypes/SampleTypes/VoltAmpere.md %}) | 1.2 |  |
| [`VoltAmpereReactive`]({% link model/ObservationInformationModel/ObservationTypes/SampleTypes/VoltAmpereReactive.md %}) | 1.2 |  |
| [`Voltage`]({% link model/ObservationInformationModel/ObservationTypes/SampleTypes/Voltage.md %}) | 1.0 | 1.6 |
| [`VoltageAC`]({% link model/ObservationInformationModel/ObservationTypes/SampleTypes/VoltageAC.md %}) | 1.6 |  |
| [`VoltageDC`]({% link model/ObservationInformationModel/ObservationTypes/SampleTypes/VoltageDC.md %}) | 1.6 |  |
| [`VolumeFluid`]({% link model/ObservationInformationModel/ObservationTypes/SampleTypes/VolumeFluid.md %}) | 1.5 |  |
| [`VolumeSpatial`]({% link model/ObservationInformationModel/ObservationTypes/SampleTypes/VolumeSpatial.md %}) | 1.5 |  |
| [`WaterHardness`]({% link model/ObservationInformationModel/ObservationTypes/SampleTypes/WaterHardness.md %}) | 2.7 |  |
| [`Wattage`]({% link model/ObservationInformationModel/ObservationTypes/SampleTypes/Wattage.md %}) | 1.0 |  |
| [`XDimension`]({% link model/ObservationInformationModel/ObservationTypes/SampleTypes/XDimension.md %}) | 1.6 |  |
| [`YDimension`]({% link model/ObservationInformationModel/ObservationTypes/SampleTypes/YDimension.md %}) | 1.6 |  |
| [`ZDimension`]({% link model/ObservationInformationModel/ObservationTypes/SampleTypes/ZDimension.md %}) | 1.6 |  |

