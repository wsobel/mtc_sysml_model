---
title: "Components Package"
parent: "Device Information Model Package"
nav_order: 1
has_children: true
layout: default
---

# Components Package

This section provides semantic information for the [`Component`]({% link model/DeviceInformationModel/Components/Component.md %}) entity. *Figure Components* shows the [`Component`]({% link model/DeviceInformationModel/Components/Component.md %}) model. 

![Components]({% link figures/mtconnect.png %} "Components"){: width="80.0%"}

> Note: See *Section Components Schema Diagrams* for XML schema.


**Components Model**

[`MTConnectDevices`]({% link model/Fundamentals/MTConnectProtocol/MTConnectDevicesResponseDocument/MTConnectDevices.md %}) provides the physical and logical architecture of a piece of equipment. *Figure Device Entity Hierarchy Example* provides an overview of the entities used in an example of an [`MTConnectDevices`]({% link model/Fundamentals/MTConnectProtocol/MTConnectDevicesResponseDocument/MTConnectDevices.md %}) entity.

![Device Entity Hierarchy Example]({% link figures/mtconnect.png %} "Device Entity Hierarchy Example"){: width="80.0%"}

> Note 1 to entry: See device-entity-hierarchy-example for the *XML* representation of the same example.

> Note 2 to entry: Example above only shows the [`Component`]({% link model/DeviceInformationModel/Components/Component.md %}) and [`Composition`]({% link model/DeviceInformationModel/Compositions/Composition.md %}) level hierarchy. For a complete semantics on each kind see `Components` and `Compositions`.

A variety of entities are defined to describe a piece of equipment.  Some of these entities **MUST** always be defined for an [`MTConnectDevices`]({% link model/Fundamentals/MTConnectProtocol/MTConnectDevicesResponseDocument/MTConnectDevices.md %}) entity, while others are optional and **MAY** be used, as required, to provide additional structure.

The first, or highest level, entity defined for an [`MTConnectDevices`]({% link model/Fundamentals/MTConnectProtocol/MTConnectDevicesResponseDocument/MTConnectDevices.md %}) entity is `Devices`. `Devices` is used to group one or more pieces of equipment into a single document.  `Devices` **MUST** always be defined for an [`MTConnectDevices`]({% link model/Fundamentals/MTConnectProtocol/MTConnectDevicesResponseDocument/MTConnectDevices.md %}) entity.

[`Device`]({% link model/DeviceInformationModel/Device.md %}) is the next entity defined for the [`MTConnectDevices`]({% link model/Fundamentals/MTConnectProtocol/MTConnectDevicesResponseDocument/MTConnectDevices.md %}) entity. A separate [`Device`]({% link model/DeviceInformationModel/Device.md %}) entity is used to identify each piece of equipment for an [`MTConnectDevices`]({% link model/Fundamentals/MTConnectProtocol/MTConnectDevicesResponseDocument/MTConnectDevices.md %}) entity. Each [`Device`]({% link model/DeviceInformationModel/Device.md %}) provides information on the physical and logical structure of the piece of equipment and the data associated with that equipment. [`Device`]({% link model/DeviceInformationModel/Device.md %}) can also represent any logical grouping of pieces of equipment that function as a unit or any other data source that provides data through an <span class="hoverterm">agent<span class="definition" data-term="agent">software that collects data published from one or more piece(s) of equipment, organizes that data in a structured manner, and responds to requests for data from client software systems by providing a structured response in the form of a *response document* that is constructed using the *semantic data model* of a Standard. 
</span></span>.

One or more [`Device`]({% link model/DeviceInformationModel/Device.md %}) entities **MUST** always be defined for an [`MTConnectDevices`]({% link model/Fundamentals/MTConnectProtocol/MTConnectDevicesResponseDocument/MTConnectDevices.md %}) entity.

`Components` is the next entity defined for the [`MTConnectDevices`]({% link model/Fundamentals/MTConnectProtocol/MTConnectDevicesResponseDocument/MTConnectDevices.md %}) entity. `Components` is used to group information describing lower level physical parts or logical functions of a piece of equipment.

[`Component`]({% link model/DeviceInformationModel/Components/Component.md %}) is the next level of entity defined for the [`MTConnectDevices`]({% link model/Fundamentals/MTConnectProtocol/MTConnectDevicesResponseDocument/MTConnectDevices.md %}) entity. [`Component`]({% link model/DeviceInformationModel/Components/Component.md %}) is both an abstract type entity and an <span class="hoverterm">organizer<span class="definition" data-term="organizer">entity that *organizes* one or more elements.</span></span> type entity. 

As an abstract entity, [`Component`]({% link model/DeviceInformationModel/Components/Component.md %}) will always be realized by a specific [`Component`]({% link model/DeviceInformationModel/Components/Component.md %}) type defined in `Component Types`. Each [`Component`]({% link model/DeviceInformationModel/Components/Component.md %}) can also be used to organize information describing <span class="hoverterm">lower level<span class="definition" data-term="lower level">nested element that is below a higher level element.</span></span> entities or <span class="hoverterm">DataItems<span class="definition" data-term="DataItem">*observable* observed by a *Component* that may make *Observations*</span></span> associated with the [`Component`]({% link model/DeviceInformationModel/Components/Component.md %}).

If <span class="hoverterm">lower level<span class="definition" data-term="lower level">nested element that is below a higher level element.</span></span> entities are described, these entities are by definition child [`Component`]({% link model/DeviceInformationModel/Components/Component.md %}) entities of a parent [`Component`]({% link model/DeviceInformationModel/Components/Component.md %}). At this next level, the <span class="hoverterm">lower level<span class="definition" data-term="lower level">nested element that is below a higher level element.</span></span> child [`Component`]({% link model/DeviceInformationModel/Components/Component.md %}) entities are grouped by `Components`.

A [`Component`]({% link model/DeviceInformationModel/Components/Component.md %}) **MAY** be further decomposed into [`Composition`]({% link model/DeviceInformationModel/Compositions/Composition.md %}) entities that are grouped by `Compositions`. These describe the lowest level basic structural or functional building blocks contained within a [`Component`]({% link model/DeviceInformationModel/Components/Component.md %}). Data provided for a [`Component`]({% link model/DeviceInformationModel/Components/Component.md %}) provides more specific meaning when it is associated with one of the [`Composition`]({% link model/DeviceInformationModel/Compositions/Composition.md %}) entities of the [`Component`]({% link model/DeviceInformationModel/Components/Component.md %}). The different [`Composition`]({% link model/DeviceInformationModel/Compositions/Composition.md %}) types that **MAY** be defined for the [`MTConnectDevices`]({% link model/Fundamentals/MTConnectProtocol/MTConnectDevicesResponseDocument/MTConnectDevices.md %}) entity are defined in `Compositions`.

This parent-child relationship can continue to any depth required to fully define a piece of equipment.

> Note: See *Figure Device Entity Hierarchy Example* for an example.

