---
title: "Condition"
parent: "Observation Information Model Package"
nav_order: 5
layout: default
---

# Condition

**Supertype:** `Observation`
## Version Info

{: .auto-width }
| Introduced | Deprecated | Updated |"
|---|---|---|
| 1.1 |  |   |

[`Observation`]({% link model/ReferenceAgentArchitecture/InformationModel/Observation.md %}) that provides the <span class="hoverterm">condition<span class="definition" data-term="condition">ability of a piece of equipment or *Component* to function to specification.</span></span> of a piece of equipment or a <span class="hoverterm">Component<span class="definition" data-term="Component">*engineered system*  part of a *Device* composed of zero or more *Components*</span></span>.


### Description

It provides the information and data reported from a piece of equipment with [`DataItem`]({% link model/DeviceInformationModel/DataItems/DataItem.md %})::`category` as `CONDITION` in the <span class="hoverterm">MTConnectDevices Response Document<span class="definition" data-term="MTConnectDevices Response Document">*response document* published by an *MTConnect Agent* in response to a *probe request*.</span></span>.

*Figure Condition Example* shows [`Condition`]({% link model/DeviceInformationModel/DataItems/DataItemTypes/Condition.md %}) type examples for various [`Condition`]({% link model/DeviceInformationModel/DataItems/DataItemTypes/Condition.md %})::`state`: `Normal` (`dataItemId` = `path_system`) and `Warning` (`dataItemId` = `logic_cond`). It also shows an example for when the [`Condition`]({% link model/DeviceInformationModel/DataItems/DataItemTypes/Condition.md %})::`state` is not available (`dataItemId` = `cont_system`).

![Condition Example]({% link figures/mtconnect.png %} "Condition Example"){: width="80.0%"}

> Note: See condition-example for the *XML* representation of the same example.

The following *Section Value Properties of Condition* lists the additional and/or updated attributes for [`Condition`]({% link model/DeviceInformationModel/DataItems/DataItemTypes/Condition.md %}).

## Properties

<table><thead><tr><th>Name</th><th>Type</th><th>Int</th><th>Dep</th><th>Multiplicty</th><th>Description</th></tr></thead><tbody>
<tr><td><code>nativeCode</code></td><td><code>string</code></td><td>1.1</td><td></td><td>0..1</td>
<td markdown="block">

native code is the proprietary identifier designating a specific alarm, fault or warning code provided by the piece of equipment. 

</td>
</tr>
<tr><td><code>nativeSeverity</code></td><td><code>string</code></td><td>1.1</td><td></td><td>0..1</td>
<td markdown="block">

severity information to a client software application if the piece of equipment designates a severity level to a fault. 

</td>
</tr>
<tr><td><code>qualifier</code></td><td><a href="{% link model/Profile/DataTypes/QualifierEnum.md %}"><code>QualifierEnum</code></a></td><td>1.1</td><td></td><td>0..1</td>
<td markdown="block">

additional information regarding a <span class="hoverterm">condition state<span class="definition" data-term="condition state">indicator of the *condition*.</span></span> associated with the measured value of a process variable.

[`Condition`]({% link model/DeviceInformationModel/DataItems/DataItemTypes/Condition.md %})::`qualifier` defines whether the <span class="hoverterm">condition state<span class="definition" data-term="condition state">indicator of the *condition*.</span></span> represented indicates a measured value that is above or below an expected value of a process variable. 

</td>
</tr>
<tr><td><code>statistic</code></td><td><a href="{% link model/Profile/DataTypes/StatisticEnum.md %}"><code>StatisticEnum</code></a></td><td>1.2</td><td></td><td>0..1</td>
<td markdown="block">

[`Condition`]({% link model/DeviceInformationModel/DataItems/DataItemTypes/Condition.md %})::`statistic` provides additional information describing the meaning of the [`Condition`]({% link model/DeviceInformationModel/DataItems/DataItemTypes/Condition.md %}) entity.

[`Condition`]({% link model/DeviceInformationModel/DataItems/DataItemTypes/Condition.md %})::`statistic` **MUST** match the [`DataItem`]({% link model/DeviceInformationModel/DataItems/DataItem.md %})::`statistic` defined in the <span class="hoverterm">MTConnectDevices Response Document<span class="definition" data-term="MTConnectDevices Response Document">*response document* published by an *MTConnect Agent* in response to a *probe request*.</span></span>. 

</td>
</tr>
<tr><td><code>xs:lang</code></td><td><code>xslang</code></td><td>1.1</td><td></td><td>0..1</td>
<td markdown="block">

specifies the language of the [`Observation`]({% link model/ReferenceAgentArchitecture/InformationModel/Observation.md %})::`result` returned for the [`Condition`]({% link model/DeviceInformationModel/DataItems/DataItemTypes/Condition.md %}). 

See <em>IETF RFC 4646</em> (http://www.ietf.org/rfc/rfc4646.txt). 

</td>
</tr>
<tr><td><code>state</code></td><td><a href="{% link model/Profile/DataTypes/ConditionStateEnum.md %}"><code>ConditionStateEnum</code></a></td><td>1.1</td><td></td><td>0..1</td>
<td markdown="block">

<span class="hoverterm">condition state<span class="definition" data-term="condition state">indicator of the *condition*.</span></span> of the piece of equipment or [`Component`]({% link model/DeviceInformationModel/Components/Component.md %}). 

</td>
</tr>
<tr><td><code>type</code></td><td><a href="{% link model/Profile/DataTypes/ConditionEnum.md %}"><code>ConditionEnum</code></a></td><td>1.1</td><td></td><td>1</td>
<td markdown="block">

 

</td>
</tr>
<tr><td><code>conditionId</code></td><td><code>string</code></td><td>2.3</td><td></td><td>1</td>
<td markdown="block">

identifier of an individual <span class="hoverterm">condition activation<span class="definition" data-term="condition activation">state transition from `Normal` to either `Warning` or `Fault`.</span></span> provided by a piece of equipment.

[`Condition`]({% link model/DeviceInformationModel/DataItems/DataItemTypes/Condition.md %})::`conditionId` **MUST** be unique for all concurrent condition activation.

[`Condition`]({% link model/DeviceInformationModel/DataItems/DataItemTypes/Condition.md %})::`conditionId` **MUST** be maintained for all state transitions related to the same <span class="hoverterm">condition activation<span class="definition" data-term="condition activation">state transition from `Normal` to either `Warning` or `Fault`.</span></span>.

Multiple [`Condition`]({% link model/DeviceInformationModel/DataItems/DataItemTypes/Condition.md %})::`conditionId`s **MAY** exist for the same `nativeCode`.

If [`Condition`]({% link model/DeviceInformationModel/DataItems/DataItemTypes/Condition.md %})::`conditionId` is not given, the value is the [`Condition`]({% link model/DeviceInformationModel/DataItems/DataItemTypes/Condition.md %})::`nativeCode`. If [`Condition`]({% link model/DeviceInformationModel/DataItems/DataItemTypes/Condition.md %})::`nativeCode` and [`Condition`]({% link model/DeviceInformationModel/DataItems/DataItemTypes/Condition.md %})::`conditionId` are not given, [`Condition`]({% link model/DeviceInformationModel/DataItems/DataItemTypes/Condition.md %})::`conditionId` **MUST** be generated. 

</td>
</tr>
</tbody></table>

## Subclasses

{: .auto-width }
| Name | Int | Dep |
|---|---|---|
| [`Actuator`]({% link model/DeviceInformationModel/Components/ComponentTypes/Actuator.md %}) | 1.1 |  |
| [`Communications`]({% link model/ObservationInformationModel/ObservationTypes/ConditionTypes/Communications.md %}) | 1.1 |  |
| [`DataRange`]({% link model/ObservationInformationModel/ObservationTypes/ConditionTypes/DataRange.md %}) | 1.2 |  |
| [`LogicProgram`]({% link model/ObservationInformationModel/ObservationTypes/ConditionTypes/LogicProgram.md %}) | 1.1 |  |
| [`MotionProgram`]({% link model/ObservationInformationModel/ObservationTypes/ConditionTypes/MotionProgram.md %}) | 1.1 |  |
| [`System`]({% link model/DeviceInformationModel/Components/ComponentTypes/System.md %}) | 1.1 |  |

