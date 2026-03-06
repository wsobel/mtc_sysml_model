---
title: "TimeSeries"
parent: "Representations Package"
grand_parent: "Observation Information Model Package"
nav_order: 6
layout: default
---

# TimeSeries

**Supertype:** `Representation`
## Version Info

{: .auto-width }
| Introduced | Deprecated | Updated |"
|---|---|---|
| 1.2 |  |   |

[`Representation`]({% link model/ObservationInformationModel/Representations/Representation.md %}) for an [`Observation`]({% link model/ReferenceAgentArchitecture/InformationModel/Observation.md %}) composed of a series of sampled data.

### Description


[`TimeSeries`]({% link model/ReferenceAgentArchitecture/InformationModel/TimeSeries.md %}) for an [`Observation`]({% link model/ReferenceAgentArchitecture/InformationModel/Observation.md %}) is defined by the associated [`DataItem`]({% link model/DeviceInformationModel/DataItems/DataItem.md %})::`representation` as `TIME_SERIES`.

[`DataItem`]({% link model/DeviceInformationModel/DataItems/DataItem.md %})::`representation` as `TIME_SERIES` **MUST** have [`DataItem`]({% link model/DeviceInformationModel/DataItems/DataItem.md %})::`category` of `SAMPLE`.

*Figure TemperatureTimeSeries* shows the model for [`Temperature`]({% link model/WIPDeviceExamples/MillwSmoothG/Representation/Temperature.md %}) ([`Sample`]({% link model/DeviceInformationModel/DataItems/DataItemTypes/Sample.md %}) type) with a [`Representation`]({% link model/ObservationInformationModel/Representations/Representation.md %}) type of [`TimeSeries`]({% link model/ReferenceAgentArchitecture/InformationModel/TimeSeries.md %}). 

![TemperatureTimeSeries]({% link figures/mtconnect.png %} "TemperatureTimeSeries"){: width="80.0%"}

> Note: See *Section Representation Schema Diagrams* for XML schema.

[`TimeSeries`]({% link model/ReferenceAgentArchitecture/InformationModel/TimeSeries.md %}) **MUST** report multiple values at fixed intervals in a single [`Observation`]({% link model/ReferenceAgentArchitecture/InformationModel/Observation.md %}). At minimum, one of [`DataItem`]({% link model/DeviceInformationModel/DataItems/DataItem.md %})::`sampleRate` or [`Sample`]({% link model/DeviceInformationModel/DataItems/DataItemTypes/Sample.md %})::`sampleRate` **MUST** be specified. When both are specified, the [`Sample`]({% link model/DeviceInformationModel/DataItems/DataItemTypes/Sample.md %})::`sampleRate` supersedes the [`DataItem`]({% link model/DeviceInformationModel/DataItems/DataItem.md %})::`sampleRate`.

[`Observation`]({% link model/ReferenceAgentArchitecture/InformationModel/Observation.md %})::`timestamp` **MUST** be set to the time the last value was observed. The [`Sample`]({% link model/DeviceInformationModel/DataItems/DataItemTypes/Sample.md %})::`duration` **MAY** indicate the time interval from the first to the last value in the series.

*Section Value Properties of TimeSeries* defines additional attributes for an [`Observation`]({% link model/ReferenceAgentArchitecture/InformationModel/Observation.md %}) with [`TimeSeries`]({% link model/ReferenceAgentArchitecture/InformationModel/TimeSeries.md %}) [`Representation`]({% link model/ObservationInformationModel/Representations/Representation.md %}) type.

## Properties

<table><thead><tr><th>Name</th><th>Type</th><th>Int</th><th>Dep</th><th>Multiplicty</th><th>Description</th></tr></thead><tbody>
<tr><td><code>sampleCount</code></td><td><code>integer</code></td><td>1.2</td><td></td><td>1</td>
<td markdown="block">

number of values given for the [`Observation`]({% link model/ReferenceAgentArchitecture/InformationModel/Observation.md %}). 

</td>
</tr>
<tr><td><code>result</code></td><td><code>float</code></td><td>1.2</td><td></td><td>1..*</td>
<td markdown="block">

 

</td>
</tr>
</tbody></table>
