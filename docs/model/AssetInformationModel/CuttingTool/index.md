---
title: "Cutting Tool Package"
parent: "Asset Information Model Package"
nav_order: 2
has_children: true
layout: default
---

# Cutting Tool Package

This section provides semantic information for the [`CuttingTool`]({% link model/AssetInformationModel/CuttingTool/CuttingTool.md %}) and [`CuttingToolArchetype`]({% link model/AssetInformationModel/CuttingTool/CuttingToolArchetype.md %}) models.

![CuttingTool]({% link figures/mtconnect.png %} "CuttingTool"){: width="80.0%"}

> Note: See *Section CuttingTool Schema Diagrams* for XML schema.


**Cutting Tool Asset Information Model**

There are two <span class="hoverterm">information models<span class="definition" data-term="information model">rules, relationships, and terminology that are used to define how information is structured.</span></span> used to represent a cutting tool, [`CuttingToolArchetype`]({% link model/AssetInformationModel/CuttingTool/CuttingToolArchetype.md %}) and [`CuttingTool`]({% link model/AssetInformationModel/CuttingTool/CuttingTool.md %}). The [`CuttingToolArchetype`]({% link model/AssetInformationModel/CuttingTool/CuttingToolArchetype.md %}) represents the static cutting tool geometries and nominal values as one would expect from a tool catalog and the [`CuttingTool`]({% link model/AssetInformationModel/CuttingTool/CuttingTool.md %}) represents the use or application of the tool on the shop floor with actual measured values and process data. In Version 1.3.0 of the MTConnect Standard it was decided to separate out these two concerns since not all pieces of equipment will have access to both sets of information. In this way, a generic definition of the cutting tool can coexist with a specific assembly <span class="hoverterm">information model<span class="definition" data-term="information model">rules, relationships, and terminology that are used to define how information is structured.</span></span> with minimal redundancy of data.

MTConnect Standard will adopt the ISO 13399 structure when formulating the vocabulary for Cutting Tool geometries and structure to be represented in the [`CuttingToolArchetype`]({% link model/AssetInformationModel/CuttingTool/CuttingToolArchetype.md %}). The nominal values provided in the [`CuttingToolLifeCycle`]({% link model/AssetInformationModel/CuttingTool/CuttingToolLifeCycle/CuttingToolLifeCycle.md %}) section are only concerned with two aspects of the Cutting Tool; the Cutting Tool and the cutting item. The tool item, Adaptive Item, and Assembly Item will only be covered in the [`CuttingToolDefinition`]({% link model/AssetInformationModel/CuttingTool/CuttingToolDefinition.md %}) section of this document since this section contains the full ISO 13399 information about a Cutting Tool.

![Cutting Tool Parts]({% link figures/mtconnect.png %} "Cutting Tool Parts"){: width="80.0%"}

The *Figure Cutting Tool Parts* illustrates the parts of a Cutting Tool. The Cutting Tool is the aggregate of all the components and the cutting item is the part of the tool that removes the material from the workpiece. These are the primary focus of the MTConnect Standard.

![Cutting Tool Composition]({% link figures/mtconnect.png %} "Cutting Tool Composition"){: width="80.0%"}

*Figure Cutting Tool Composition* provides another view of the composition of a Cutting Tool. The Adaptive Items and tool items will be used for measurements, but will not be modeled as separate entities. When we are referencing the Cutting Tool we are referring to the entirety of the assembly and when we provide data regarding the cutting item we are referencing each individual item as illustrated on the left of the previous diagram.

![Cutting Tool, Tool Item, and Cutting Item]({% link figures/mtconnect.png %} "Cutting Tool, Tool Item, and Cutting Item"){: width="80.0%"}

![Cutting Tool, Tool Item, and Cutting Item 2]({% link figures/mtconnect.png %} "Cutting Tool, Tool Item, and Cutting Item 2"){: width="80.0%"}


*Figure Cutting Tool, Tool Item, and Cutting Item* and *Figure Cutting Tool, Tool Item, and Cutting Item 2* further illustrates the components of the Cutting Tool. As we compose the tool item, cutting item, Adaptive Item, we get a Cutting Tool. The tool item, Adaptive Item, and Assembly Item will only be in the [`CuttingToolDefinition`]({% link model/AssetInformationModel/CuttingTool/CuttingToolDefinition.md %}) section that will contain the full ISO 13399 information. These figures also use the ISO 13399 codes for each of the measurements. These codes will be translated into the MTConnect Standard vocabulary as illustrated below. The measurements will have a maximum, minimum, and nominal value representing the tolerance of allowable values for this dimension.

The MTConnect Standard will not define the entire geometry of the Cutting Tool, but will provide the information necessary to use the tool in the manufacturing process. Additional information can be added to the definition of the Cutting Tool by means of schema extensions.

Additional diagrams will reference these dimensions by their codes that will be defined in the measurement tables. The codes are consistent with the codes used in ISO 13399 and have been standardized. MTConnect Standard will use the full text name for clarity in the <span class="hoverterm">response documents<span class="definition" data-term="response document">electronic *document* published by an *MTConnect Agent* in response to a *probe request*, *current request*, *sample request* or *asset request*.</span></span>.



