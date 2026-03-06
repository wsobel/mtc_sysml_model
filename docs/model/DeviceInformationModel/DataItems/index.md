---
title: "DataItems Package"
parent: "Device Information Model Package"
nav_order: 4
has_children: true
layout: default
---

# DataItems Package

This section provides semantic information for the [`DataItem`]({% link model/DeviceInformationModel/DataItems/DataItem.md %}) entity. *Figure DataItems* shows the [`DataItem`]({% link model/DeviceInformationModel/DataItems/DataItem.md %}) model. 

![DataItems]({% link figures/mtconnect.png %} "DataItems"){: width="80.0%"}

> Note: See *Section DataItems Schema Diagrams* for XML schema.

**DataItems Model**

For an [`MTConnectDevices`]({% link model/Fundamentals/MTConnectProtocol/MTConnectDevicesResponseDocument/MTConnectDevices.md %}) entity, <span class="hoverterm">DataItems<span class="definition" data-term="DataItem">*observable* observed by a *Component* that may make *Observations*</span></span> describe data that can be reported by a piece of equipment and are associated with [`Device`]({% link model/DeviceInformationModel/Device.md %}) and [`Component`]({% link model/DeviceInformationModel/Components/Component.md %}) entities. While the <span class="hoverterm">DataItems<span class="definition" data-term="DataItem">*observable* observed by a *Component* that may make *Observations*</span></span> describe the data that can be reported by a piece of equipment as an [`MTConnectDevices`]({% link model/Fundamentals/MTConnectProtocol/MTConnectDevicesResponseDocument/MTConnectDevices.md %}) entity, the actual data values are provided by the [`MTConnectStreams`]({% link model/Fundamentals/MTConnectProtocol/MTConnectStreamsResponseDocument/MTConnectStreams.md %}) entity in the <span class="hoverterm">MTConnectStreams Response Document<span class="definition" data-term="MTConnectStreams Response Document">*response document* published by an *MTConnect Agent* in response to a *current request* or a *sample request*.</span></span>. See `Observation Information Model` for detail on the reported values.

Each <span class="hoverterm">DataItem<span class="definition" data-term="DataItem">*observable* observed by a *Component* that may make *Observations*</span></span> **SHOULD** be modeled for the [`MTConnectDevices`]({% link model/Fundamentals/MTConnectProtocol/MTConnectDevicesResponseDocument/MTConnectDevices.md %}) entity such that it is associated with the entity that the reported data directly applies.

[`DataItem`]({% link model/DeviceInformationModel/DataItems/DataItem.md %}) describes specific types of <span class="hoverterm">DataItems<span class="definition" data-term="DataItem">*observable* observed by a *Component* that may make *Observations*</span></span> that represent a numeric value, a functioning state, or a health status reported by a piece of equipment. [`DataItem`]({% link model/DeviceInformationModel/DataItems/DataItem.md %}) provides a detailed description for each <span class="hoverterm">DataItem<span class="definition" data-term="DataItem">*observable* observed by a *Component* that may make *Observations*</span></span> that is reported; it defines the type of data being reported and an array of optional attributes that further describe that data. The different types of [`DataItem`]({% link model/DeviceInformationModel/DataItems/DataItem.md %}) elements are defined in `DataItem Types`.
