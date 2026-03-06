---
title: "DataSet"
parent: "Representations Package"
grand_parent: "Observation Information Model Package"
nav_order: 2
layout: default
---

# DataSet

**Supertype:** `Representation`
## Version Info

{: .auto-width }
| Introduced | Deprecated | Updated |"
|---|---|---|
| 1.5 |  |   |

[`Representation`]({% link model/ObservationInformationModel/Representations/Representation.md %}) for an [`Observation`]({% link model/ReferenceAgentArchitecture/InformationModel/Observation.md %}) composed of value(s) represented as a set of <span class="hoverterm">key-value pairs<span class="definition" data-term="key-value pair">association between an identifier referred to as the *key* and a value which taken together create a *key-value pair*. </span></span>.

### Description


[`DataSet`]({% link model/ReferenceAgentArchitecture/InformationModel/DataSet.md %}) for an [`Observation`]({% link model/ReferenceAgentArchitecture/InformationModel/Observation.md %}) is defined by the associated [`DataItem`]({% link model/DeviceInformationModel/DataItems/DataItem.md %})::`representation` as `DATA_SET`.

[`DataItem`]({% link model/DeviceInformationModel/DataItems/DataItem.md %})::`representation` as `DATA_SET` **MUST** have [`DataItem`]({% link model/DeviceInformationModel/DataItems/DataItem.md %})::`category` as `SAMPLE` or `EVENT`.

*Figure VariableDataSet* shows the model for [`Variable`]({% link model/WIPDeviceExamples/MillwSmoothG/Representation/Variable.md %}) ([`Event`]({% link model/DeviceInformationModel/DataItems/DataItemTypes/Event.md %}) type) with a [`Representation`]({% link model/ObservationInformationModel/Representations/Representation.md %}) type of [`DataSet`]({% link model/ReferenceAgentArchitecture/InformationModel/DataSet.md %}). 

![VariableDataSet]({% link figures/mtconnect.png %} "VariableDataSet"){: width="80.0%"}

> Note: See *Figure DataSet Schema* for XML schema.

[`DataSet`]({% link model/ReferenceAgentArchitecture/InformationModel/DataSet.md %}) reports multiple values as a set of <span class="hoverterm">key-value pair<span class="definition" data-term="key-value pair">association between an identifier referred to as the *key* and a value which taken together create a *key-value pair*. </span></span> where each <span class="hoverterm">key<span class="definition" data-term="key">unique identifier in a *key-value pair* association.</span></span> **MUST** be unique. The representation of the <span class="hoverterm">key-value pair<span class="definition" data-term="key-value pair">association between an identifier referred to as the *key* and a value which taken together create a *key-value pair*. </span></span> is an [`Entry`]({% link model/ObservationInformationModel/Representations/Table/Entry.md %}). The value of each [`Entry`]({% link model/ObservationInformationModel/Representations/Table/Entry.md %}) **MUST** have the same constraints and format as the [`Observation`]({% link model/ReferenceAgentArchitecture/InformationModel/Observation.md %}) defined for [`DataItem`]({% link model/DeviceInformationModel/DataItems/DataItem.md %})::`representation` as `VALUE` for the [`DataItem`]({% link model/DeviceInformationModel/DataItems/DataItem.md %}) type. (See [`Value`]({% link model/ObservationInformationModel/Representations/Value.md %})). 

The meaning of each [`Entry`]({% link model/ObservationInformationModel/Representations/Table/Entry.md %}) **MAY** be provided as the [`DataItem`]({% link model/DeviceInformationModel/DataItems/DataItem.md %}) [`EntryDefinition`]({% link model/DeviceInformationModel/DataItems/PropertiesofDataItem/PropertiesofDefinition/EntryDefinition.md %}).

*Figure DataSet Example* shows [`Event`]({% link model/DeviceInformationModel/DataItems/DataItemTypes/Event.md %}) [`Observation`]({% link model/ReferenceAgentArchitecture/InformationModel/Observation.md %}) type [`Variable`]({% link model/WIPDeviceExamples/MillwSmoothG/Representation/Variable.md %}) with a [`Representation`]({% link model/ObservationInformationModel/Representations/Representation.md %}) type of `DataSet`.

![DataSet Example]({% link figures/mtconnect.png %} "DataSet Example"){: width="80.0%"}

> Note: See dataset-example for the *XML* representation of the same example.

#### Management of Data Set Observations

An <span class="hoverterm">agent<span class="definition" data-term="agent">software that collects data published from one or more piece(s) of equipment, organizes that data in a structured manner, and responds to requests for data from client software systems by providing a structured response in the form of a *response document* that is constructed using the *semantic data model* of a Standard. 
</span></span> **MUST** maintain the current state of the [`DataSet`]({% link model/ReferenceAgentArchitecture/InformationModel/DataSet.md %}) as described in `Fundamentals`.

One or more <span class="hoverterm">key-value pairs<span class="definition" data-term="key-value pair">association between an identifier referred to as the *key* and a value which taken together create a *key-value pair*. </span></span> **MAY** be added, removed, or changed in an [`Observation`]({% link model/ReferenceAgentArchitecture/InformationModel/Observation.md %}). An <span class="hoverterm">agent<span class="definition" data-term="agent">software that collects data published from one or more piece(s) of equipment, organizes that data in a structured manner, and responds to requests for data from client software systems by providing a structured response in the form of a *response document* that is constructed using the *semantic data model* of a Standard. 
</span></span> **MUST** publish the changes to one or more <span class="hoverterm">key-value pairs<span class="definition" data-term="key-value pair">association between an identifier referred to as the *key* and a value which taken together create a *key-value pair*. </span></span> as a single [`Observation`]({% link model/ReferenceAgentArchitecture/InformationModel/Observation.md %}). An <span class="hoverterm">agent<span class="definition" data-term="agent">software that collects data published from one or more piece(s) of equipment, organizes that data in a structured manner, and responds to requests for data from client software systems by providing a structured response in the form of a *response document* that is constructed using the *semantic data model* of a Standard. 
</span></span> **MUST** indicate the removal of a <span class="hoverterm">key-value pair<span class="definition" data-term="key-value pair">association between an identifier referred to as the *key* and a value which taken together create a *key-value pair*. </span></span> from a [`DataSet`]({% link model/ReferenceAgentArchitecture/InformationModel/DataSet.md %}) using the [`Entry`]({% link model/ObservationInformationModel/Representations/Table/Entry.md %})::`removed` as `true`.

When the [`DataItem`]({% link model/DeviceInformationModel/DataItems/DataItem.md %})::`discrete` is `false` or is not present, an <span class="hoverterm">agent<span class="definition" data-term="agent">software that collects data published from one or more piece(s) of equipment, organizes that data in a structured manner, and responds to requests for data from client software systems by providing a structured response in the form of a *response document* that is constructed using the *semantic data model* of a Standard. 
</span></span> in response to a <span class="hoverterm">sample request<span class="definition" data-term="sample request">*request* to an *agent* to produce an *MTConnectStreams Response Document* containing the *Observation Information Model* for a set of timestamped *observations* made by *Components*.</span></span> **MUST** only publish the changed <span class="hoverterm">key-value pair<span class="definition" data-term="key-value pair">association between an identifier referred to as the *key* and a value which taken together create a *key-value pair*. </span></span> since the previous state of the [`DataSet`]({% link model/ReferenceAgentArchitecture/InformationModel/DataSet.md %}).

When the [`DataItem`]({% link model/DeviceInformationModel/DataItems/DataItem.md %})::`discrete` attribute is `true`, an <span class="hoverterm">agent<span class="definition" data-term="agent">software that collects data published from one or more piece(s) of equipment, organizes that data in a structured manner, and responds to requests for data from client software systems by providing a structured response in the form of a *response document* that is constructed using the *semantic data model* of a Standard. 
</span></span>, in response to a <span class="hoverterm">sample request<span class="definition" data-term="sample request">*request* to an *agent* to produce an *MTConnectStreams Response Document* containing the *Observation Information Model* for a set of timestamped *observations* made by *Components*.</span></span>, **MUST** report all <span class="hoverterm">key-value pairs<span class="definition" data-term="key-value pair">association between an identifier referred to as the *key* and a value which taken together create a *key-value pair*. </span></span> ignoring the state of the [`DataSet`]({% link model/ReferenceAgentArchitecture/InformationModel/DataSet.md %}).

When an <span class="hoverterm">agent<span class="definition" data-term="agent">software that collects data published from one or more piece(s) of equipment, organizes that data in a structured manner, and responds to requests for data from client software systems by providing a structured response in the form of a *response document* that is constructed using the *semantic data model* of a Standard. 
</span></span> responds to a <span class="hoverterm">current request<span class="definition" data-term="current request">*request* to an *agent* to produce an *MTConnectStreams Response Document* containing the *Observation Information Model* for a snapshot of the latest *observations* at the moment of the *request* or at a given *sequence number*.</span></span>, the <span class="hoverterm">response document<span class="definition" data-term="response document">electronic *document* published by an *MTConnect Agent* in response to a *probe request*, *current request*, *sample request* or *asset request*.</span></span> **MUST** include the full set of <span class="hoverterm">key-value pairs<span class="definition" data-term="key-value pair">association between an identifier referred to as the *key* and a value which taken together create a *key-value pair*. </span></span>. If the <span class="hoverterm">current request<span class="definition" data-term="current request">*request* to an *agent* to produce an *MTConnectStreams Response Document* containing the *Observation Information Model* for a snapshot of the latest *observations* at the moment of the *request* or at a given *sequence number*.</span></span> includes an `at` query parameter, the <span class="hoverterm">agent<span class="definition" data-term="agent">software that collects data published from one or more piece(s) of equipment, organizes that data in a structured manner, and responds to requests for data from client software systems by providing a structured response in the form of a *response document* that is constructed using the *semantic data model* of a Standard. 
</span></span> **MUST** provide the set of <span class="hoverterm">key-value pairs<span class="definition" data-term="key-value pair">association between an identifier referred to as the *key* and a value which taken together create a *key-value pair*. </span></span> at the  <span class="hoverterm">sequence number<span class="definition" data-term="sequence number">primary key identifier used to manage and locate a specific piece of *streaming data* in an *agent*.</span></span>.

When an [`Observation`]({% link model/ReferenceAgentArchitecture/InformationModel/Observation.md %}) <span class="hoverterm">reset<span class="definition" data-term="reset">act of reverting back the accumulated value or statistic to their initial value.

> Note: An *Observation* with a *data set* representation removes all *key-value pairs*, setting the *data set* to an empty set.

</span></span> occurs, the [`DataSet`]({% link model/ReferenceAgentArchitecture/InformationModel/DataSet.md %}) **MUST** remove all <span class="hoverterm">key-value pairs<span class="definition" data-term="key-value pair">association between an identifier referred to as the *key* and a value which taken together create a *key-value pair*. </span></span> making the set empty. The [`Observation`]({% link model/ReferenceAgentArchitecture/InformationModel/Observation.md %}) **MAY** simultaneously populate the [`DataSet`]({% link model/ReferenceAgentArchitecture/InformationModel/DataSet.md %}) with new <span class="hoverterm">key-value pairs<span class="definition" data-term="key-value pair">association between an identifier referred to as the *key* and a value which taken together create a *key-value pair*. </span></span>. The previous entries **MUST NOT** be included and **MUST NOT** have [`Entry`]({% link model/ObservationInformationModel/Representations/Table/Entry.md %})::`removed` as `true`.

When the [`Observation`]({% link model/ReferenceAgentArchitecture/InformationModel/Observation.md %})  is `UNAVAILABLE` the [`DataSet`]({% link model/ReferenceAgentArchitecture/InformationModel/DataSet.md %}) **MUST** remove all <span class="hoverterm">key-value pairs<span class="definition" data-term="key-value pair">association between an identifier referred to as the *key* and a value which taken together create a *key-value pair*. </span></span> making the set empty.

## Properties

<table><thead><tr><th>Name</th><th>Type</th><th>Int</th><th>Dep</th><th>Multiplicty</th><th>Description</th></tr></thead><tbody>
<tr><td><code>count</code></td><td><code>integer</code></td><td>1.5</td><td></td><td>1</td>
<td markdown="block">

number of [`Entry`]({% link model/ObservationInformationModel/Representations/Table/Entry.md %}) elements for the [`Observation`]({% link model/ReferenceAgentArchitecture/InformationModel/Observation.md %}). 

</td>
</tr>
</tbody></table>

## Relations

<table><thead><tr><th>Name</th><th>Type</th><th>Int</th><th>Dep</th><th>Multiplicty</th><th>Description</th></tr></thead><tbody>
<tr><td><code>result</code></td><td><a href="{% link model/ObservationInformationModel/Representations/Entry.md %}"><code>Entry</code></a></td><td>1.5</td><td></td><td>0..*</td>
<td markdown="block">

 

</td>
</tr>

</tbody></table>

## Subclasses

{: .auto-width }
| Name | Int | Dep |
|---|---|---|
| [`AlarmLimitResult`]({% link model/Profile/DataTypes/AlarmLimitResult.md %}) | 1.7 |  |
| [`AxisDataSet`]({% link model/DeviceInformationModel/Configurations/Motion/AxisDataSet.md %}) | 2.5 |  |
| [`ControlLimitResult`]({% link model/Profile/DataTypes/ControlLimitResult.md %}) | 1.7 |  |
| [`LocationAddressResult`]({% link model/Profile/DataTypes/LocationAddressResult.md %}) | 2.3 |  |
| [`LocationSpatialGeographicResult`]({% link model/Profile/DataTypes/LocationSpatialGeographicResult.md %}) | 2.4 |  |
| [`OriginDataSet`]({% link model/DeviceInformationModel/Configurations/CoordinateSystems/OriginDataSet.md %}) | 2.5 |  |
| [`RotationDataSet`]({% link model/DeviceInformationModel/Configurations/CoordinateSystems/RotationDataSet.md %}) | 2.5 |  |
| [`ScaleDataSet`]({% link model/DeviceInformationModel/Configurations/SolidModel/ScaleDataSet.md %}) | 2.5 |  |
| [`SensorAttachmentResult`]({% link model/Profile/DataTypes/SensorAttachmentResult.md %}) | 1.7 |  |
| [`SpecificationLimitResult`]({% link model/Profile/DataTypes/SpecificationLimitResult.md %}) | 1.7 |  |
| [`TranslationDataSet`]({% link model/DeviceInformationModel/Configurations/CoordinateSystems/TranslationDataSet.md %}) | 2.5 |  |

