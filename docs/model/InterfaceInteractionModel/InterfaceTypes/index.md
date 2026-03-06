---
title: "Interface Types Package"
parent: "Interface Interaction Model Package"
nav_order: 3
has_children: true
layout: default
---

# Interface Types Package

The abstract [`Interface`]({% link model/InterfaceInteractionModel/Interface.md %}) is realized by the following types listed in this section. 

In order to implement the <span class="hoverterm">interaction model<span class="definition" data-term="interaction model">model that defines how information is exchanged across an *interface* to enable interactions between independent systems.</span></span> for <span class="hoverterm">interfaces<span class="definition" data-term="interface">means by which communication is achieved between independent systems.</span></span>, each piece of equipment associated with an <span class="hoverterm">interface<span class="definition" data-term="interface">means by which communication is achieved between independent systems.</span></span> **MUST** provide the corresponding [`Interface`]({% link model/InterfaceInteractionModel/Interface.md %}) type. A piece of equipment **MAY** support any number of unique <span class="hoverterm">interfaces<span class="definition" data-term="interface">means by which communication is achieved between independent systems.</span></span>.

**Interfaces for Device and Observation Information Models**

The <span class="hoverterm">interaction model<span class="definition" data-term="interaction model">model that defines how information is exchanged across an *interface* to enable interactions between independent systems.</span></span> for implementing <span class="hoverterm">interfaces<span class="definition" data-term="interface">means by which communication is achieved between independent systems.</span></span> is defined in the MTConnect Standard as an extension to the <span class="hoverterm">Device Information Model<span class="definition" data-term="Device Information Model">*information model* that describes the physical and logical configuration for a piece of equipment and the data that may be reported by that equipment. </span></span> and <span class="hoverterm">Observation Information Model<span class="definition" data-term="Observation Information Model">*information model* that describes the *streaming data* reported by a piece of equipment.</span></span>.

A piece of equipment **MAY** support multiple different <span class="hoverterm">interfaces<span class="definition" data-term="interface">means by which communication is achieved between independent systems.</span></span>. Each piece of equipment supporting <span class="hoverterm">interfaces<span class="definition" data-term="interface">means by which communication is achieved between independent systems.</span></span> **MUST** model the information associated with each <span class="hoverterm">interface<span class="definition" data-term="interface">means by which communication is achieved between independent systems.</span></span> as an [`Interface`]({% link model/InterfaceInteractionModel/Interface.md %}) component.  [`Interface`]({% link model/InterfaceInteractionModel/Interface.md %}) is an abstract [`Component`]({% link model/DeviceInformationModel/Components/Component.md %}) and is realized by [`Interface`]({% link model/InterfaceInteractionModel/Interface.md %}) component types. 

The *Figure Interfaces in Entity Hierarchy* illustrates where an [`Interface`]({% link model/InterfaceInteractionModel/Interface.md %}) is modeled in the <span class="hoverterm">Device Information Model<span class="definition" data-term="Device Information Model">*information model* that describes the physical and logical configuration for a piece of equipment and the data that may be reported by that equipment. </span></span> for a piece of equipment.

![Interfaces in Entity Hierarchy]({% link figures/mtconnect.png %} "Interfaces in Entity Hierarchy"){: width="80.0%"}
