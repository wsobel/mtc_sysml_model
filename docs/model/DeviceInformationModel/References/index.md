---
title: "References Package"
parent: "Device Information Model Package"
nav_order: 5
has_children: true
layout: default
---

# References Package

This section provides semantic information for the [`Reference`]({% link model/DeviceInformationModel/References/Reference.md %}) entity. *Figure References* shows the [`Reference`]({% link model/DeviceInformationModel/References/Reference.md %}) model. 

[`Reference`]({% link model/DeviceInformationModel/References/Reference.md %}) may be modeled as part of a [`Device`]({% link model/DeviceInformationModel/Device.md %}), [`Component`]({% link model/DeviceInformationModel/Components/Component.md %}) or [`Interface`]({% link model/InterfaceInteractionModel/Interface.md %}) type.

![References]({% link figures/mtconnect.png %} "References"){: width="80.0%"}

> Note: See *Section References Schema Diagrams* for XML schema of [`Reference`]({% link model/DeviceInformationModel/References/Reference.md %}) and its types.

**References Model**

`References` <span class="hoverterm">organizes<span class="definition" data-term="organize">act of containing and owning one or more elements.</span></span> pointers to information defined elsewhere within the [`MTConnectDevices`]({% link model/Fundamentals/MTConnectProtocol/MTConnectDevicesResponseDocument/MTConnectDevices.md %}) entity for a piece of equipment. It is an efficient method to associate information with an element without duplicating any of the data or structure.
