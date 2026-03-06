---
title: "Observation"
parent: "Observation Information Model Package"
nav_order: 11
layout: default
---

# Observation
## Version Info

{: .auto-width }
| Introduced | Deprecated | Updated |"
|---|---|---|
| 1.0 |  |   |

abstract entity that provides telemetry data for a [`DataItem`]({% link model/DeviceInformationModel/DataItems/DataItem.md %}) at a point in time.

### Description

![Observations]({% link figures/mtconnect.png %} "Observations"){: width="80.0%"}

> Note: See *Section Observations Schema Diagrams* for XML schema. The XML schema also shows differences in XML representation of certain MTConnect entities.

*Figure DeviceStream Example* shows a complete example of [`DeviceStream`]({% link model/ObservationInformationModel/DeviceStream.md %}) for the [`Device`]({% link model/DeviceInformationModel/Device.md %}) shown in `Device Information Model`.

![DeviceStream Example]({% link figures/mtconnect.png %} "DeviceStream Example"){: width="80.0%"}

> Note: See devicestream-example for the *XML* representation of the same example.


This section provides semantic information for the [`Observation`]({% link model/ReferenceAgentArchitecture/InformationModel/Observation.md %}) model.

> Note: See *Section Observations Schema Diagrams* for XML schema of [`Observation`]({% link model/ReferenceAgentArchitecture/InformationModel/Observation.md %}) types.

#### Observations made for DataItem

[`Component`]({% link model/DeviceInformationModel/Components/Component.md %}) <span class="hoverterm">observes<span class="definition" data-term="observe">act of measuring or determining the value of a property at a point in time.</span></span> [`DataItem`]({% link model/DeviceInformationModel/DataItems/DataItem.md %}) entities and creates [`Observation`]({% link model/ReferenceAgentArchitecture/InformationModel/Observation.md %}) entities for the [`DataItem`]({% link model/DeviceInformationModel/DataItems/DataItem.md %}) entities. See *Figure Observations*.

[`Observation`]({% link model/ReferenceAgentArchitecture/InformationModel/Observation.md %}) entities made by a [`Component`]({% link model/DeviceInformationModel/Components/Component.md %}) are organized by a [`ComponentStream`]({% link model/ObservationInformationModel/ComponentStream.md %}) which is specifically created for that [`Component`]({% link model/DeviceInformationModel/Components/Component.md %}).

![Observations made for DataItem Example]({% link figures/mtconnect.png %} "Observations made for DataItem Example"){: width="80.0%"}

> Note: See *Section Observations made for DataItem Example* for how XML representation of the same example is separated into <span class="hoverterm">MTConnectDevices Response Document<span class="definition" data-term="MTConnectDevices Response Document">*response document* published by an *MTConnect Agent* in response to a *probe request*.</span></span> and <span class="hoverterm">MTConnectStreams Response Document<span class="definition" data-term="MTConnectStreams Response Document">*response document* published by an *MTConnect Agent* in response to a *current request* or a *sample request*.</span></span>.

*Figure Observations made for DataItem Example* is a subset of *Figure DeviceStream Example*. It shows an example of the association between a [`DataItem`]({% link model/DeviceInformationModel/DataItems/DataItem.md %}) [`Event`]({% link model/DeviceInformationModel/DataItems/DataItemTypes/Event.md %}) type (`EMERGENCY_STOP`) and an [`Observation`]({% link model/ReferenceAgentArchitecture/InformationModel/Observation.md %}) [`Event`]({% link model/DeviceInformationModel/DataItems/DataItemTypes/Event.md %}) type (`EmergencyStop`). See *Section Naming Convention for Observation types*.

*Figure Observations made for DataItem Example* also shows example of the association between a [`Component`]({% link model/DeviceInformationModel/Components/Component.md %}) type (`Controller`) and related [`ComponentStream`]({% link model/ObservationInformationModel/ComponentStream.md %}).

#### Naming Convention for Observation types

The name of an [`Observation`]({% link model/ReferenceAgentArchitecture/InformationModel/Observation.md %}) type **MUST** derive from the associated [`DataItem`]({% link model/DeviceInformationModel/DataItems/DataItem.md %})::`type` converted to Pascal-Case by removing underscores (_ ) and capitalizing each word. The conversion **MUST NOT** apply to the following abbreviated words: `PH`, `AC`, `DC` and `URI`. `MTCONNECT` **MUST** be converted to `MTConnect`. See *Figure Observations made for DataItem Example* for an example.

The name of an [`Observation`]({% link model/ReferenceAgentArchitecture/InformationModel/Observation.md %}) type reported in the <span class="hoverterm">MTConnectStreams Response Document<span class="definition" data-term="MTConnectStreams Response Document">*response document* published by an *MTConnect Agent* in response to a *current request* or a *sample request*.</span></span> is extended when the [`DataItem`]({% link model/DeviceInformationModel/DataItems/DataItem.md %})::`representation` is used to further describe that [`DataItem`]({% link model/DeviceInformationModel/DataItems/DataItem.md %}) in the <span class="hoverterm">MTConnectDevices Response Document<span class="definition" data-term="MTConnectDevices Response Document">*response document* published by an *MTConnect Agent* in response to a *probe request*.</span></span>. See `Representations` for more details.

## Properties

<table><thead><tr><th>Name</th><th>Type</th><th>Int</th><th>Dep</th><th>Multiplicty</th><th>Description</th></tr></thead><tbody>
<tr><td><code>compositionId</code></td><td><code>ID</code></td><td>1.4</td><td></td><td>0..1</td>
<td markdown="block">

identifier of the [`Composition`]({% link model/DeviceInformationModel/Compositions/Composition.md %}) entity defined in the <span class="hoverterm">MTConnectDevices Response Document<span class="definition" data-term="MTConnectDevices Response Document">*response document* published by an *MTConnect Agent* in response to a *probe request*.</span></span> associated with the data reported for the [`Observation`]({% link model/ReferenceAgentArchitecture/InformationModel/Observation.md %}). 

</td>
</tr>
<tr><td><code>dataItemId</code></td><td><code>ID</code></td><td>1.0</td><td></td><td>1</td>
<td markdown="block">

unique identifier of the [`DataItem`]({% link model/DeviceInformationModel/DataItems/DataItem.md %}) associated with this [`Observation`]({% link model/ReferenceAgentArchitecture/InformationModel/Observation.md %}).

[`Observation`]({% link model/ReferenceAgentArchitecture/InformationModel/Observation.md %})::`dataItemId` **MUST** match the associated [`DataItem`]({% link model/DeviceInformationModel/DataItems/DataItem.md %})::`id` defined in the <span class="hoverterm">MTConnectDevices Response Document<span class="definition" data-term="MTConnectDevices Response Document">*response document* published by an *MTConnect Agent* in response to a *probe request*.</span></span>. 

</td>
</tr>
<tr><td><code>name</code></td><td><code>string</code></td><td>1.0</td><td></td><td>0..1</td>
<td markdown="block">

name of the [`DataItem`]({% link model/DeviceInformationModel/DataItems/DataItem.md %}) associated with this [`Observation`]({% link model/ReferenceAgentArchitecture/InformationModel/Observation.md %}).

[`Observation`]({% link model/ReferenceAgentArchitecture/InformationModel/Observation.md %})::`name` **MUST** match the associated [`DataItem`]({% link model/DeviceInformationModel/DataItems/DataItem.md %})::`name` defined in the <span class="hoverterm">MTConnectDevices Response Document<span class="definition" data-term="MTConnectDevices Response Document">*response document* published by an *MTConnect Agent* in response to a *probe request*.</span></span>. 

</td>
</tr>
<tr><td><code>sequence</code></td><td><code>integer</code></td><td>1.0</td><td></td><td>1</td>
<td markdown="block">

number representing the sequential position of an occurrence of an <span class="hoverterm">observation<span class="definition" data-term="observation">observed value of a property at a point in time.</span></span> in the data buffer of an <span class="hoverterm">agent<span class="definition" data-term="agent">software that collects data published from one or more piece(s) of equipment, organizes that data in a structured manner, and responds to requests for data from client software systems by providing a structured response in the form of a *response document* that is constructed using the *semantic data model* of a Standard. 
</span></span>.

[`Observation`]({% link model/ReferenceAgentArchitecture/InformationModel/Observation.md %})::`sequence` **MUST** have a value represented as an unsigned 64-bit value from 1 to $$ 2^{64}-1 $$. 

</td>
</tr>
<tr><td><code>subType</code></td><td><a href="{% link model/Profile/DataTypes/DataItemSubTypeEnum.md %}"><code>DataItemSubTypeEnum</code></a></td><td>1.2</td><td></td><td>0..1</td>
<td markdown="block">

subtype of the [`DataItem`]({% link model/DeviceInformationModel/DataItems/DataItem.md %}) associated with this [`Observation`]({% link model/ReferenceAgentArchitecture/InformationModel/Observation.md %}).

[`Observation`]({% link model/ReferenceAgentArchitecture/InformationModel/Observation.md %})::`subType` **MUST** match the associated [`DataItem`]({% link model/DeviceInformationModel/DataItems/DataItem.md %})::`subType` defined in the <span class="hoverterm">MTConnectDevices Response Document<span class="definition" data-term="MTConnectDevices Response Document">*response document* published by an *MTConnect Agent* in response to a *probe request*.</span></span>. 

</td>
</tr>
<tr><td><code>timestamp</code></td><td><code>datetime</code></td><td>1.0</td><td></td><td>1</td>
<td markdown="block">

most accurate time available to a piece of equipment that represents the point in time that the data reported was measured. 

</td>
</tr>
<tr><td><code>type</code></td><td><a href="{% link model/Profile/DataTypes/DataItemTypeEnum.md %}"><code>DataItemTypeEnum</code></a></td><td>1.0</td><td></td><td>1</td>
<td markdown="block">

type of the [`DataItem`]({% link model/DeviceInformationModel/DataItems/DataItem.md %}) associated with this [`Observation`]({% link model/ReferenceAgentArchitecture/InformationModel/Observation.md %}).

[`Observation`]({% link model/ReferenceAgentArchitecture/InformationModel/Observation.md %})::`type` **MUST** match the associated [`DataItem`]({% link model/DeviceInformationModel/DataItems/DataItem.md %})::`type` defined in the <span class="hoverterm">MTConnectDevices Response Document<span class="definition" data-term="MTConnectDevices Response Document">*response document* published by an *MTConnect Agent* in response to a *probe request*.</span></span>. 

</td>
</tr>
<tr><td><code>units</code></td><td><a href="{% link model/Profile/DataTypes/UnitEnum.md %}"><code>UnitEnum</code></a></td><td>1.0</td><td></td><td>0..1</td>
<td markdown="block">

units of the [`DataItem`]({% link model/DeviceInformationModel/DataItems/DataItem.md %}) associated with this [`Observation`]({% link model/ReferenceAgentArchitecture/InformationModel/Observation.md %}).

[`Observation`]({% link model/ReferenceAgentArchitecture/InformationModel/Observation.md %})::`units` **MUST** match the associated [`DataItem`]({% link model/DeviceInformationModel/DataItems/DataItem.md %})::`units` defined in the <span class="hoverterm">MTConnectDevices Response Document<span class="definition" data-term="MTConnectDevices Response Document">*response document* published by an *MTConnect Agent* in response to a *probe request*.</span></span>. 

</td>
</tr>
<tr><td><code>isUnavailable</code></td><td><code>boolean</code></td><td>1.0</td><td></td><td>1</td>
<td markdown="block">

when `true`, [`Observation`]({% link model/ReferenceAgentArchitecture/InformationModel/Observation.md %})::`result` is indeterminate.

> Note 1 to entry: In *XML*, when `isUnavailable` is `true`, the *XML* `CDATA` of the `Observation` **MUST** be `UNAVAILABLE`.
 ```xml
<Execution dataItemId="..." ...>UNAVAILABLE</Execution>
```

> Note 2 to entry: In *JSON*, when `isUnavailable` is `true`, the *JSON* `value` of the `Observation` **MUST** be `UNAVAILABLE`.
```json
  "Execution" : [ { "dataItemId": "..." ..., "value": "UNAVAILABLE" } ]
``` 

</td>
</tr>
<tr><td><code>result</code></td><td><code>string</code></td><td>1.0</td><td></td><td>0..1</td>
<td markdown="block">

<span class="hoverterm">observation<span class="definition" data-term="observation">observed value of a property at a point in time.</span></span> of the [`Observation`]({% link model/ReferenceAgentArchitecture/InformationModel/Observation.md %}) entity.

The default value type for [`Observation`]({% link model/ReferenceAgentArchitecture/InformationModel/Observation.md %})::`result` is `string`.

> Note 1 to entry: in *XML* the [`Observation`]({% link model/ReferenceAgentArchitecture/InformationModel/Observation.md %})::`result` is the `CDATA` of the Observation <span class="hoverterm">element<span class="definition" data-term="element">constituent part or a basic unit of identifiable and definable data.</span></span>.

~~~~xml
<Execution dataItemId="..." ...>READY</Execution>
~~~~

> Note 2 to entry: in *JSON* the [`Observation`]({% link model/ReferenceAgentArchitecture/InformationModel/Observation.md %})::`result` is the member `value` of the Observation object.

~~~~json
"Execution" : [ { "dataItemId": "..." ..., "value": "READY" } ]
~~~~ 

</td>
</tr>
</tbody></table>

## Relations

<table><thead><tr><th>Name</th><th>Type</th><th>Int</th><th>Dep</th><th>Multiplicty</th><th>Description</th></tr></thead><tbody>
<tr><td><code>isObservationOf</code></td><td><a href="{% link model/DeviceInformationModel/Components/Component.md %}"><code>Component</code></a></td><td>1.0</td><td></td><td>0..*</td>
<td markdown="block">

 

</td>
</tr>
<tr><td><code>isObservationOf</code></td><td><a href="{% link model/Fundamentals/MTConnectProtocol/RESTProtocol/Agent.md %}"><code>Agent</code></a></td><td>1.0</td><td></td><td>0..*</td>
<td markdown="block">

 

</td>
</tr>
<tr><td><code>isObservationOf</code></td><td><a href="{% link model/DeviceInformationModel/DataItems/DataItem.md %}"><code>DataItem</code></a></td><td>1.0</td><td></td><td>0..*</td>
<td markdown="block">

 

</td>
</tr>

</tbody></table>

## Subclasses

{: .auto-width }
| Name | Int | Dep |
|---|---|---|
| [`Condition`]({% link model/DeviceInformationModel/DataItems/DataItemTypes/Condition.md %}) | 1.1 |  |
| [`Event`]({% link model/DeviceInformationModel/DataItems/DataItemTypes/Event.md %}) | 1.0 |  |
| [`Sample`]({% link model/DeviceInformationModel/DataItems/DataItemTypes/Sample.md %}) | 1.0 |  |

