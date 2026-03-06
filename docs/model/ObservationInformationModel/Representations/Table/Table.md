---
title: "Table"
parent: "Table Package"
grand_parent: "Representations Package"
nav_order: 5
layout: default
---

# Table

**Supertype:** `Representation`
## Version Info

{: .auto-width }
| Introduced | Deprecated | Updated |"
|---|---|---|
| 1.6 |  |   |

[`Representation`]({% link model/ObservationInformationModel/Representations/Representation.md %}) for an [`Observation`]({% link model/ReferenceAgentArchitecture/InformationModel/Observation.md %}) composed of two-dimensional sets of <span class="hoverterm">key-value pairs<span class="definition" data-term="key-value pair">association between an identifier referred to as the *key* and a value which taken together create a *key-value pair*. </span></span> where the [`Entry`]({% link model/ObservationInformationModel/Representations/Table/Entry.md %}) represents rows containing sets of <span class="hoverterm">key-value pairs<span class="definition" data-term="key-value pair">association between an identifier referred to as the *key* and a value which taken together create a *key-value pair*. </span></span> given by [`Cell`]({% link model/ObservationInformationModel/Representations/Table/Cell.md %}) entities. 

### Description

[`Table`]({% link model/DeviceInformationModel/Components/ComponentTypes/Table.md %}) for an [`Observation`]({% link model/ReferenceAgentArchitecture/InformationModel/Observation.md %}) is defined by the associated [`DataItem`]({% link model/DeviceInformationModel/DataItems/DataItem.md %})::`representation` as `TABLE`.

[`DataItem`]({% link model/DeviceInformationModel/DataItems/DataItem.md %})::`representation` as `TABLE` **MUST** have [`DataItem`]({% link model/DeviceInformationModel/DataItems/DataItem.md %})::`category` as `SAMPLE` or `EVENT`.

*Figure WorkOffsetTable* shows the model for [`WorkOffset`]({% link model/ObservationInformationModel/ObservationTypes/EventTypes/WorkOffset.md %}) ([`Event`]({% link model/DeviceInformationModel/DataItems/DataItemTypes/Event.md %}) type) with a [`Representation`]({% link model/ObservationInformationModel/Representations/Representation.md %}) type of [`Table`]({% link model/DeviceInformationModel/Components/ComponentTypes/Table.md %}). 

![WorkOffsetTable]({% link figures/mtconnect.png %} "WorkOffsetTable"){: width="80.0%"}

> Note: See *Section Representation Schema Diagrams* for XML schema.

[`Table`]({% link model/DeviceInformationModel/Components/ComponentTypes/Table.md %}) has the same behavior as the [`DataSet`]({% link model/ReferenceAgentArchitecture/InformationModel/DataSet.md %}) for change tracking, clearing, and history. When an [`Entry`]({% link model/ObservationInformationModel/Representations/Table/Entry.md %}) changes, all [`Cell`]({% link model/ObservationInformationModel/Representations/Table/Cell.md %}) entities update at the same time; they are not tracked separately like [`Entry`]({% link model/ObservationInformationModel/Representations/Table/Entry.md %}).

The meaning of each [`Entry`]({% link model/ObservationInformationModel/Representations/Table/Entry.md %}) and [`Cell`]({% link model/ObservationInformationModel/Representations/Table/Cell.md %}) **MAY** be provided as the [`DataItem`]({% link model/DeviceInformationModel/DataItems/DataItem.md %}) [`EntryDefinition`]({% link model/DeviceInformationModel/DataItems/PropertiesofDataItem/PropertiesofDefinition/EntryDefinition.md %}) and [`CellDefinition`]({% link model/DeviceInformationModel/DataItems/PropertiesofDataItem/PropertiesofDefinition/CellDefinition.md %}).

[`Entry`]({% link model/ObservationInformationModel/Representations/Table/Entry.md %})::`key`  **MUST** be the unique identity of the [`Entry`]({% link model/ObservationInformationModel/Representations/Table/Entry.md %}) within an [`Observation`]({% link model/ReferenceAgentArchitecture/InformationModel/Observation.md %}). [`Cell`]({% link model/ObservationInformationModel/Representations/Table/Cell.md %})::`key` **MUST** be the unique identity of the [`Cell`]({% link model/ObservationInformationModel/Representations/Table/Cell.md %}) within an [`Entry`]({% link model/ObservationInformationModel/Representations/Table/Entry.md %}).

*Figure Table Example* shows [`Event`]({% link model/DeviceInformationModel/DataItems/DataItemTypes/Event.md %}) [`Observation`]({% link model/ReferenceAgentArchitecture/InformationModel/Observation.md %}) type [`WorkOffset`]({% link model/ObservationInformationModel/ObservationTypes/EventTypes/WorkOffset.md %}) with a [`Representation`]({% link model/ObservationInformationModel/Representations/Representation.md %}) type of `Table`.

![Table Example]({% link figures/mtconnect.png %} "Table Example"){: width="80.0%"}

> Note: See table-example for the *XML* representation of the same example.


## Properties

<table><thead><tr><th>Name</th><th>Type</th><th>Int</th><th>Dep</th><th>Multiplicty</th><th>Description</th></tr></thead><tbody>
<tr><td><code>count</code></td><td><code>integer</code></td><td>1.6</td><td></td><td>1</td>
<td markdown="block">

number of <span class="hoverterm">key-value pairs<span class="definition" data-term="key-value pair">association between an identifier referred to as the *key* and a value which taken together create a *key-value pair*. </span></span> represented as [`Entry`]({% link model/ObservationInformationModel/Representations/Table/Entry.md %}) entities. 

</td>
</tr>
</tbody></table>

## Relations

<table><thead><tr><th>Name</th><th>Type</th><th>Int</th><th>Dep</th><th>Multiplicty</th><th>Description</th></tr></thead><tbody>
<tr><td><code>result</code></td><td><a href="{% link model/ObservationInformationModel/Representations/Table/Entry.md %}"><code>Entry</code></a></td><td>1.6</td><td></td><td>0..*</td>
<td markdown="block">

 

</td>
</tr>

</tbody></table>

## Subclasses

{: .auto-width }
| Name | Int | Dep |
|---|---|---|
| [`FeatureMeasurementResult`]({% link model/Profile/DataTypes/FeatureMeasurementResult.md %}) | 2.2 |  |
| [`MaintenanceListResult`]({% link model/Profile/DataTypes/MaintenanceListResult.md %}) | 2.0 |  |

