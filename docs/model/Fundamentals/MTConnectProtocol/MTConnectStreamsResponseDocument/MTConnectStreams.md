---
title: "MTConnectStreams"
parent: "MTConnectStreams Response Document Package"
grand_parent: "MTConnect Protocol Package"
nav_order: 3
layout: default
---

# MTConnectStreams
## Version Info

{: .auto-width }
| Introduced | Deprecated | Updated |"
|---|---|---|
| 1.0 |  |   |

root entity of an <span class="hoverterm">MTConnectStreams Response Document<span class="definition" data-term="MTConnectStreams Response Document">*response document* published by an *MTConnect Agent* in response to a *current request* or a *sample request*.</span></span> that contains the <span class="hoverterm">Observation Information Model<span class="definition" data-term="Observation Information Model">*information model* that describes the *streaming data* reported by a piece of equipment.</span></span> of one or more [`Device`]({% link model/DeviceInformationModel/Device.md %}) entities.

![MTConnectStreams]({% link figures/mtconnect.png %} "MTConnectStreams"){: width="80.0%"}

> Note: Additional properties of [`MTConnectStreams`]({% link model/Fundamentals/MTConnectProtocol/MTConnectStreamsResponseDocument/MTConnectStreams.md %}) **MAY** be defined for schema and namespace declaration. See *Section Schema and Namespace Declaration Information* for an *XML* example.

## Relations

<table><thead><tr><th>Name</th><th>Type</th><th>Int</th><th>Dep</th><th>Multiplicty</th><th>Description</th></tr></thead><tbody>
<tr><td><code>hasHeader</code></td><td><a href="{% link model/Fundamentals/MTConnectProtocol/MTConnectStreamsResponseDocument/Header.md %}"><code>Header</code></a></td><td>1.0</td><td></td><td>1</td>
<td markdown="block">

 

</td>
</tr>
<tr><td><code>hasDeviceStream</code></td><td><a href="{% link model/ObservationInformationModel/DeviceStream.md %}"><code>DeviceStream</code></a></td><td>1.0</td><td></td><td>0..*</td>
<td markdown="block">

 

</td>
</tr>

</tbody></table>
