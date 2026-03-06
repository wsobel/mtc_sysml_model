---
title: "Component"
parent: "Components Package"
grand_parent: "Device Information Model Package"
nav_order: 3
layout: default
---

# Component
## Version Info

{: .auto-width }
| Introduced | Deprecated | Updated |"
|---|---|---|
| 1.0 |  |   |

logical or physical entity that provides a capability.

### Description

[`Component`]({% link model/DeviceInformationModel/Components/Component.md %}) is an abstract entity and will be realized by specific [`Component`]({% link model/DeviceInformationModel/Components/Component.md %}) types for an [`MTConnectDevices`]({% link model/Fundamentals/MTConnectProtocol/MTConnectDevicesResponseDocument/MTConnectDevices.md %}) entity. See `Component Types` for more details on the [`Component`]({% link model/DeviceInformationModel/Components/Component.md %}) types.

[`Component`]({% link model/DeviceInformationModel/Components/Component.md %}) also provides structure for describing the <span class="hoverterm">lower level<span class="definition" data-term="lower level">nested element that is below a higher level element.</span></span> entities associated with it.

At least one of [`Component`]({% link model/DeviceInformationModel/Components/Component.md %}), [`DataItem`]({% link model/DeviceInformationModel/DataItems/DataItem.md %}), or [`Reference`]({% link model/DeviceInformationModel/References/Reference.md %}) entities **MUST** be provided for a [`Component`]({% link model/DeviceInformationModel/Components/Component.md %}).

![Component Example]({% link figures/mtconnect.png %} "Component Example"){: width="80.0%"}

> Note: See component-example for the *XML* representation of the same example.

## Properties

<table><thead><tr><th>Name</th><th>Type</th><th>Int</th><th>Dep</th><th>Multiplicty</th><th>Description</th></tr></thead><tbody>
<tr><td><code>id</code></td><td><code>ID</code></td><td>1.0</td><td></td><td>1</td>
<td markdown="block">

unique identifier for the [`Component`]({% link model/DeviceInformationModel/Components/Component.md %}). 

</td>
</tr>
<tr><td><code>name</code></td><td><code>string</code></td><td>1.0</td><td></td><td>0..1</td>
<td markdown="block">

name of the [`Component`]({% link model/DeviceInformationModel/Components/Component.md %}).

When provided, [`Component`]({% link model/DeviceInformationModel/Components/Component.md %})::`name` **MUST** be unique for all child [`Component`]({% link model/DeviceInformationModel/Components/Component.md %}) entities of a parent [`Component`]({% link model/DeviceInformationModel/Components/Component.md %}). 

</td>
</tr>
<tr><td><code>nativeName</code></td><td><code>string</code></td><td>1.1</td><td></td><td>0..1</td>
<td markdown="block">

common name associated with [`Component`]({% link model/DeviceInformationModel/Components/Component.md %}). 

</td>
</tr>
<tr><td><code>sampleInterval</code></td><td><code>float</code></td><td>1.2</td><td></td><td>0..1</td>
<td markdown="block">

interval in milliseconds between the completion of the reading of the data associated with the [`Component`]({% link model/DeviceInformationModel/Components/Component.md %}) until the beginning of the next sampling of that data.

This information may be used by client software applications to understand how often information from a [`Component`]({% link model/DeviceInformationModel/Components/Component.md %}) is expected to be refreshed.

The refresh rate for data from all child [`Component`]({% link model/DeviceInformationModel/Components/Component.md %}) entities will be the
same as for the parent [`Component`]({% link model/DeviceInformationModel/Components/Component.md %}) element unless specifically overridden by another [`Component`]({% link model/DeviceInformationModel/Components/Component.md %})::`sampleInterval` provided for the child [`Component`]({% link model/DeviceInformationModel/Components/Component.md %}). 

</td>
</tr>
<tr><td><s><code>sampleRate</code></s></td><td><code>float</code></td><td>1.0</td><td>1.2</td><td>0..1</td>
<td markdown="block">

**DEPRECATED** in *MTConnect Version 1.2*. Replaced by [`Component`]({% link model/DeviceInformationModel/Components/Component.md %})::`sampleInterval`. 

</td>
</tr>
<tr><td><code>uuid</code></td><td><code>UUID</code></td><td>1.0</td><td></td><td>0..1</td>
<td markdown="block">

universally unique identifier for the [`Component`]({% link model/DeviceInformationModel/Components/Component.md %}). 

</td>
</tr>
<tr><td><code>coordinateSystemIdRef</code></td><td><code>ID</code></td><td>1.8</td><td></td><td>0..1</td>
<td markdown="block">

specifies the [`CoordinateSystem`]({% link model/DeviceInformationModel/Configurations/CoordinateSystems/CoordinateSystem.md %}) for this [`Component`]({% link model/DeviceInformationModel/Components/Component.md %}) and its children. 

</td>
</tr>
</tbody></table>

## Relations

<table><thead><tr><th>Name</th><th>Type</th><th>Int</th><th>Dep</th><th>Multiplicty</th><th>Description</th></tr></thead><tbody>
<tr><td><code>hasDescription</code></td><td><a href="{% link model/DeviceInformationModel/Components/Description.md %}"><code>Description</code></a></td><td>1.0</td><td></td><td>0..1</td>
<td markdown="block">

 

</td>
</tr>
<tr><td><code>hasComposition</code></td><td><a href="{% link model/DeviceInformationModel/Compositions/Composition.md %}"><code>Composition</code></a></td><td>1.4</td><td></td><td>0..*</td>
<td markdown="block">

 

</td>
</tr>
<tr><td><code>hasComponent</code></td><td><a href="{% link model/DeviceInformationModel/Components/Component.md %}"><code>Component</code></a></td><td>1.0</td><td></td><td>0..*</td>
<td markdown="block">

 

</td>
</tr>
<tr><td><code>hasConfiguration</code></td><td><a href="{% link model/DeviceInformationModel/Configurations/Configuration.md %}"><code>Configuration</code></a></td><td>1.2</td><td></td><td>0..1</td>
<td markdown="block">

 

</td>
</tr>
<tr><td><code>observes</code></td><td><a href="{% link model/DeviceInformationModel/DataItems/DataItem.md %}"><code>DataItem</code></a></td><td>1.0</td><td></td><td>0..*</td>
<td markdown="block">

 

</td>
</tr>
<tr><td><code>madeObservation</code></td><td><a href="{% link model/ObservationInformationModel/Observation.md %}"><code>Observation</code></a></td><td>1.0</td><td></td><td>0..*</td>
<td markdown="block">

 

</td>
</tr>
<tr><td><code>hasReference</code></td><td><a href="{% link model/DeviceInformationModel/References/Reference.md %}"><code>Reference</code></a></td><td>1.3</td><td></td><td>0..*</td>
<td markdown="block">

 

</td>
</tr>
<tr><td><code>hasComponentStream</code></td><td><a href="{% link model/ObservationInformationModel/ComponentStream.md %}"><code>ComponentStream</code></a></td><td>1.0</td><td></td><td>0..1</td>
<td markdown="block">

 

</td>
</tr>
<tr><td><code>isComponentOf</code></td><td><a href="{% link model/DeviceInformationModel/Components/Component.md %}"><code>Component</code></a></td><td>1.0</td><td></td><td>0..*</td>
<td markdown="block">

 

</td>
</tr>

</tbody></table>

## Constraints

<table><thead><tr><th>Error Message</th><th>OCL Expression</th></tr></thead><tbody>

<tr><td markdown="block">

`Component` **MUST** have at least one of `Component`, `DataItem` or  `Reference` entities.

</td><td markdown="block">

```
val:MustHaveComponentOrDataItemOrReference
    a sh:NodeShape ;
    sh:message "`Component` **MUST** have at least one of `Component`, `DataItem` or  `Reference` entities." ;
    sh:targetClass mt:Component ;
    sh:or (
        [ sh:property [
            sh:path mt:hasComponent ;
            sh:minCount 1 ;
            sh:class mt:Component ;
        ] ]
        [ sh:property [
            sh:path mt:observes ;
            sh:minCount 1 ;
            sh:class mt:DataItem ;
        ] ]
        [ sh:property [
            sh:path mt:hasReference ;
            sh:minCount 1 ;
            sh:class mt:Reference ;
        ] ]
    ) .
```

</td></tr>

</tbody></table>

## Subclasses

{: .auto-width }
| Name | Int | Dep |
|---|---|---|
| [`Adapter`]({% link model/DeviceInformationModel/Components/ComponentTypes/Adapter.md %}) | 1.7 |  |
| [`Adapters`]({% link model/DeviceInformationModel/Components/ComponentTypes/ComponentOrganizerTypes/Adapters.md %}) | 1.7 |  |
| [`Amplifier`]({% link model/DeviceInformationModel/Components/ComponentTypes/Amplifier.md %}) | 1.4 |  |
| [`Auxiliaries`]({% link model/DeviceInformationModel/Components/ComponentTypes/ComponentOrganizerTypes/Auxiliaries.md %}) | 1.4 |  |
| [`Auxiliary`]({% link model/DeviceInformationModel/Components/ComponentTypes/Auxiliary.md %}) | 1.4 |  |
| [`Axes`]({% link model/DeviceInformationModel/Components/ComponentTypes/ComponentOrganizerTypes/Axes.md %}) | 1.0 |  |
| [`Axis`]({% link model/DeviceInformationModel/Configurations/Motion/Axis.md %}) | 1.0 |  |
| [`Ballscrew`]({% link model/DeviceInformationModel/Components/ComponentTypes/Ballscrew.md %}) | 1.4 |  |
| [`Belt`]({% link model/DeviceInformationModel/Components/ComponentTypes/Belt.md %}) | 1.4 |  |
| [`Brake`]({% link model/DeviceInformationModel/Components/ComponentTypes/Brake.md %}) | 1.4 |  |
| [`Chain`]({% link model/DeviceInformationModel/Components/ComponentTypes/Chain.md %}) | 1.4 |  |
| [`Chopper`]({% link model/DeviceInformationModel/Components/ComponentTypes/Chopper.md %}) | 1.4 |  |
| [`Chuck`]({% link model/DeviceInformationModel/Components/ComponentTypes/Chuck.md %}) | 1.3 |  |
| [`Chute`]({% link model/DeviceInformationModel/Components/ComponentTypes/Chute.md %}) | 1.4 |  |
| [`CircuitBreaker`]({% link model/DeviceInformationModel/Components/ComponentTypes/CircuitBreaker.md %}) | 1.4 |  |
| [`Clamp`]({% link model/DeviceInformationModel/Components/ComponentTypes/Clamp.md %}) | 1.4 |  |
| [`Compressor`]({% link model/DeviceInformationModel/Components/ComponentTypes/Compressor.md %}) | 1.4 |  |
| [`CoolingTower`]({% link model/DeviceInformationModel/Components/ComponentTypes/CoolingTower.md %}) | 1.7 |  |
| [`Device`]({% link model/DeviceInformationModel/Device.md %}) | 1.0 |  |
| [`Door`]({% link model/DeviceInformationModel/Components/ComponentTypes/Door.md %}) | 1.1 |  |
| [`Drain`]({% link model/DeviceInformationModel/Components/ComponentTypes/Drain.md %}) | 1.4 |  |
| [`Encoder`]({% link model/DeviceInformationModel/Components/ComponentTypes/Encoder.md %}) | 1.4 |  |
| [`Environmental`]({% link model/DeviceInformationModel/Components/ComponentTypes/Environmental.md %}) | 1.4 |  |
| [`ExpiredPot`]({% link model/DeviceInformationModel/Components/ComponentTypes/ExpiredPot.md %}) | 1.7 |  |
| [`ExposureUnit`]({% link model/DeviceInformationModel/Components/ComponentTypes/ExposureUnit.md %}) | 1.5 |  |
| [`ExtrusionUnit`]({% link model/DeviceInformationModel/Components/ComponentTypes/ExtrusionUnit.md %}) | 1.5 |  |
| [`Fan`]({% link model/DeviceInformationModel/Components/ComponentTypes/Fan.md %}) | 1.4 |  |
| [`Filter`]({% link model/DeviceInformationModel/DataItems/PropertiesofDataItem/Filter.md %}) | 1.4 |  |
| [`Galvanomotor`]({% link model/DeviceInformationModel/Components/ComponentTypes/Galvanomotor.md %}) | 1.5 |  |
| [`Gripper`]({% link model/DeviceInformationModel/Components/ComponentTypes/Gripper.md %}) | 1.4 |  |
| [`Hopper`]({% link model/DeviceInformationModel/Components/ComponentTypes/Hopper.md %}) | 1.4 |  |
| [`Interface`]({% link model/InterfaceInteractionModel/Interface.md %}) | 1.3 |  |
| [`Interfaces`]({% link model/DeviceInformationModel/Components/ComponentTypes/ComponentOrganizerTypes/Interfaces.md %}) | 1.3 |  |
| [`LinearPositionFeedback`]({% link model/DeviceInformationModel/Components/ComponentTypes/LinearPositionFeedback.md %}) | 1.4 |  |
| [`Lock`]({% link model/DeviceInformationModel/Components/ComponentTypes/Lock.md %}) | 1.8 |  |
| [`Motor`]({% link model/DeviceInformationModel/Components/ComponentTypes/Motor.md %}) | 1.4 |  |
| [`Oil`]({% link model/DeviceInformationModel/Components/ComponentTypes/Oil.md %}) | 1.4 |  |
| [`Part`]({% link model/DeviceInformationModel/Components/ComponentTypes/Part.md %}) | 1.7 |  |
| [`Parts`]({% link model/DeviceInformationModel/Components/ComponentTypes/ComponentOrganizerTypes/Parts.md %}) | 1.8 |  |
| [`Path`]({% link model/DeviceInformationModel/Components/ComponentTypes/Path.md %}) | 1.1 |  |
| [`Pot`]({% link model/DeviceInformationModel/Components/ComponentTypes/Pot.md %}) | 1.7 |  |
| [`Power`]({% link model/DeviceInformationModel/Components/ComponentTypes/Power.md %}) | 1.0 | 1.1 |
| [`PowerSupply`]({% link model/DeviceInformationModel/Components/ComponentTypes/PowerSupply.md %}) | 1.4 |  |
| [`Process`]({% link model/DeviceInformationModel/Components/ComponentTypes/Process.md %}) | 1.7 |  |
| [`Processes`]({% link model/DeviceInformationModel/Components/ComponentTypes/ComponentOrganizerTypes/Processes.md %}) | 1.7 |  |
| [`Pulley`]({% link model/DeviceInformationModel/Components/ComponentTypes/Pulley.md %}) | 1.4 |  |
| [`Pump`]({% link model/DeviceInformationModel/Components/ComponentTypes/Pump.md %}) | 1.4 |  |
| [`Reel`]({% link model/DeviceInformationModel/Components/ComponentTypes/Reel.md %}) | 1.5 |  |
| [`RemovalPot`]({% link model/DeviceInformationModel/Components/ComponentTypes/RemovalPot.md %}) | 1.7 |  |
| [`Resource`]({% link model/DeviceInformationModel/Components/ComponentTypes/Resource.md %}) | 1.4 |  |
| [`Resources`]({% link model/DeviceInformationModel/Components/ComponentTypes/ComponentOrganizerTypes/Resources.md %}) | 1.4 |  |
| [`ReturnPot`]({% link model/DeviceInformationModel/Components/ComponentTypes/ReturnPot.md %}) | 1.7 |  |
| [`SensingElement`]({% link model/DeviceInformationModel/Components/ComponentTypes/SensingElement.md %}) | 1.4 |  |
| [`Sensor`]({% link model/DeviceInformationModel/Components/ComponentTypes/Sensor.md %}) | 1.2 |  |
| [`Spreader`]({% link model/DeviceInformationModel/Components/ComponentTypes/Spreader.md %}) | 1.5 |  |
| [`StagingPot`]({% link model/DeviceInformationModel/Components/ComponentTypes/StagingPot.md %}) | 1.7 |  |
| [`Station`]({% link model/DeviceInformationModel/Components/ComponentTypes/Station.md %}) | 1.7 |  |
| [`StorageBattery`]({% link model/DeviceInformationModel/Components/ComponentTypes/StorageBattery.md %}) | 1.4 |  |
| [`Structure`]({% link model/DeviceInformationModel/Components/ComponentTypes/Structure.md %}) | 1.7 |  |
| [`Structures`]({% link model/DeviceInformationModel/Components/ComponentTypes/ComponentOrganizerTypes/Structures.md %}) | 1.7 |  |
| [`Switch`]({% link model/DeviceInformationModel/Components/ComponentTypes/Switch.md %}) | 1.4 |  |
| [`System`]({% link model/DeviceInformationModel/Components/ComponentTypes/System.md %}) | 1.1 |  |
| [`Systems`]({% link model/DeviceInformationModel/Components/ComponentTypes/ComponentOrganizerTypes/Systems.md %}) | 1.1 |  |
| [`Table`]({% link model/DeviceInformationModel/Components/ComponentTypes/Table.md %}) | 1.5 |  |
| [`Tank`]({% link model/DeviceInformationModel/Components/ComponentTypes/Tank.md %}) | 1.4 |  |
| [`Tensioner`]({% link model/DeviceInformationModel/Components/ComponentTypes/Tensioner.md %}) | 1.4 |  |
| [`TransferArm`]({% link model/DeviceInformationModel/Components/ComponentTypes/TransferArm.md %}) | 1.7 |  |
| [`TransferPot`]({% link model/DeviceInformationModel/Components/ComponentTypes/TransferPot.md %}) | 1.7 |  |
| [`Transformer`]({% link model/DeviceInformationModel/Components/ComponentTypes/Transformer.md %}) | 1.5 |  |
| [`Valve`]({% link model/DeviceInformationModel/Components/ComponentTypes/Valve.md %}) | 1.4 |  |
| [`Vat`]({% link model/DeviceInformationModel/Components/ComponentTypes/Vat.md %}) | 1.5 |  |
| [`Water`]({% link model/DeviceInformationModel/Components/ComponentTypes/Water.md %}) | 1.4 |  |
| [`Wire`]({% link model/DeviceInformationModel/Components/ComponentTypes/Wire.md %}) | 1.4 |  |
| [`Workpiece`]({% link model/DeviceInformationModel/Components/ComponentTypes/Workpiece.md %}) | 1.6 |  |

