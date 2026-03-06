---
title: "Compositions Package"
parent: "Device Information Model Package"
nav_order: 2
has_children: true
layout: default
---

# Compositions Package

This section provides semantic information for the [`Composition`]({% link model/DeviceInformationModel/Compositions/Composition.md %}) entity.

See *Figure Components* for the [`Composition`]({% link model/DeviceInformationModel/Compositions/Composition.md %}) model diagram.

![Component with Compositions Example]({% link figures/mtconnect.png %} "Component with Compositions Example"){: width="80.0%"}

> Note: See component-with-compositions-example for the *XML* representation of the same example.

**Compositions Model**

[`Composition`]({% link model/DeviceInformationModel/Compositions/Composition.md %}) entities are used to describe the lowest level physical building blocks of a piece of equipment contained within a [`Component`]({% link model/DeviceInformationModel/Components/Component.md %}). By referencing a specific [`Composition`]({% link model/DeviceInformationModel/Compositions/Composition.md %}) entity, further clarification and meaning to data associated with a specific [`Component`]({% link model/DeviceInformationModel/Components/Component.md %}) can be achieved.

Both [`Component`]({% link model/DeviceInformationModel/Components/Component.md %}) and [`Composition`]({% link model/DeviceInformationModel/Compositions/Composition.md %}) entities are <span class="hoverterm">lower level<span class="definition" data-term="lower level">nested element that is below a higher level element.</span></span> entities representing the sub-parts of the parent [`Component`]({% link model/DeviceInformationModel/Components/Component.md %}).  However, there are distinct differences between [`Component`]({% link model/DeviceInformationModel/Components/Component.md %}) and [`Composition`]({% link model/DeviceInformationModel/Compositions/Composition.md %}) type entities.

[`Component`]({% link model/DeviceInformationModel/Components/Component.md %}) entities may be further defined with <span class="hoverterm">lower level<span class="definition" data-term="lower level">nested element that is below a higher level element.</span></span> [`Component`]({% link model/DeviceInformationModel/Components/Component.md %}) entities and may have associated <span class="hoverterm">DataItems<span class="definition" data-term="DataItem">*observable* observed by a *Component* that may make *Observations*</span></span>.

[`Composition`]({% link model/DeviceInformationModel/Compositions/Composition.md %}) entities represent the lowest level physical part of a piece of equipment.  They **MUST NOT** be further defined with <span class="hoverterm">lower level<span class="definition" data-term="lower level">nested element that is below a higher level element.</span></span> [`Component`]({% link model/DeviceInformationModel/Components/Component.md %}) entities and they **MUST NOT** have <span class="hoverterm">DataItems<span class="definition" data-term="DataItem">*observable* observed by a *Component* that may make *Observations*</span></span> directly associated with them.   They do provide additional information that can be used to enhance the specificity of <span class="hoverterm">DataItems<span class="definition" data-term="DataItem">*observable* observed by a *Component* that may make *Observations*</span></span> associated with the parent [`Component`]({% link model/DeviceInformationModel/Components/Component.md %}).
