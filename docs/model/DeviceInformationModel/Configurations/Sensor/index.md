---
title: "Sensor Package"
parent: "Configurations Package"
grand_parent: "Device Information Model Package"
nav_order: 6
has_children: true
layout: default
---

# Sensor Package

This section provides semantic information for the [`SensorConfiguration`]({% link model/DeviceInformationModel/Configurations/Sensor/SensorConfiguration.md %}) entity.

<span class="hoverterm">sensor<span class="definition" data-term="sensor">*sensing element* that responds to a physical stimulus and transmits a resulting signal.</span></span> is a unique type of a piece of equipment.  A <span class="hoverterm">sensor<span class="definition" data-term="sensor">*sensing element* that responds to a physical stimulus and transmits a resulting signal.</span></span> is typically comprised of two major components: a <span class="hoverterm">sensor unit<span class="definition" data-term="sensor unit">intelligent piece of equipment that manages the signals of one or more *sensing elements* and provides the measured values.</span></span> that provides signal processing, conversion, and communications and the <span class="hoverterm">sensing elements<span class="definition" data-term="sensing element">mechanism that provides a signal or measured value.</span></span> that provides a signal or measured value.

The <span class="hoverterm">sensor unit<span class="definition" data-term="sensor unit">intelligent piece of equipment that manages the signals of one or more *sensing elements* and provides the measured values.</span></span> is modeled as a <span class="hoverterm">lower level<span class="definition" data-term="lower level">nested element that is below a higher level element.</span></span> [`Component`]({% link model/DeviceInformationModel/Components/Component.md %}) called [`Sensor`]({% link model/DeviceInformationModel/Components/ComponentTypes/Sensor.md %}).  The <span class="hoverterm">sensing element<span class="definition" data-term="sensing element">mechanism that provides a signal or measured value.</span></span> may be modeled as a [`Composition`]({% link model/DeviceInformationModel/Compositions/Composition.md %}) element of a [`Sensor`]({% link model/DeviceInformationModel/Components/ComponentTypes/Sensor.md %}) element and the measured value would be modeled as a [`DataItem`]({% link model/DeviceInformationModel/DataItems/DataItem.md %}) (See *Section DataItems* for more information on [`DataItem`]({% link model/DeviceInformationModel/DataItems/DataItem.md %}) elements).  Each <span class="hoverterm">sensor unit<span class="definition" data-term="sensor unit">intelligent piece of equipment that manages the signals of one or more *sensing elements* and provides the measured values.</span></span> may have multiple <span class="hoverterm">sensing elements<span class="definition" data-term="sensing element">mechanism that provides a signal or measured value.</span></span>; each representing the data for a variety of measured values.

![Sensing Element provided as a DataItem Example]({% link figures/mtconnect.png %} "Sensing Element provided as a DataItem Example"){: width="80.0%"}

> Note: See example-of-sensing-element-provided-as-data-item-associated-with-a-component for an *XML* example.

When a <span class="hoverterm">sensor unit<span class="definition" data-term="sensor unit">intelligent piece of equipment that manages the signals of one or more *sensing elements* and provides the measured values.</span></span> is modeled as a [`Component`]({% link model/DeviceInformationModel/Components/Component.md %}) or as a separate piece of equipment, it may provide additional configuration information for the <span class="hoverterm">sensor elements<span class="definition" data-term="sensor element">provides a signal or measured value.</span></span> and the <span class="hoverterm">sensor unit<span class="definition" data-term="sensor unit">intelligent piece of equipment that manages the signals of one or more *sensing elements* and provides the measured values.</span></span> itself.  

![Sensor for Rotary Axis Example]({% link figures/mtconnect.png %} "Sensor for Rotary Axis Example"){: width="80.0%"}

> Note: If a [`Sensor`]({% link model/DeviceInformationModel/Components/ComponentTypes/Sensor.md %}) provides vibration measurement data for the spindle on a piece of equipment, it could be modeled as a [`Sensor`]({% link model/DeviceInformationModel/Components/ComponentTypes/Sensor.md %}) for rotary axis named `C`. See example-of-sensor-for-rotary-axis for an *XML* example.

![Sensor unit with Sensing Elements Example]({% link figures/mtconnect.png %} "Sensor unit with Sensing Elements Example"){: width="80.0%"}

> Note: If a [`Sensor`]({% link model/DeviceInformationModel/Components/ComponentTypes/Sensor.md %}) provides measurement data for multiple [`Component`]({% link model/DeviceInformationModel/Components/Component.md %}) elements within a piece of equipment and is not associated with any particular [`Component`]({% link model/DeviceInformationModel/Components/Component.md %}), it **MAY** be modeled as an independent [`Component`]({% link model/DeviceInformationModel/Components/Component.md %}) and the data associated with measurements are associated with their associated [`Component`]({% link model/DeviceInformationModel/Components/Component.md %}) entities. See example-of-sensor-unit-with-sensing-element for an *XML* example.

[`Configuration`]({% link model/DeviceInformationModel/Configurations/Configuration.md %}) data provides information required for maintenance and support of the sensor.

When [`Sensor`]({% link model/DeviceInformationModel/Components/ComponentTypes/Sensor.md %}) represents the <span class="hoverterm">sensor unit<span class="definition" data-term="sensor unit">intelligent piece of equipment that manages the signals of one or more *sensing elements* and provides the measured values.</span></span> for multiple <span class="hoverterm">sensing element<span class="definition" data-term="sensing element">mechanism that provides a signal or measured value.</span></span>(s), each sensing element is represented by a [`Channel`]({% link model/DeviceInformationModel/Configurations/Sensor/Channel.md %}).   The <span class="hoverterm">sensor unit<span class="definition" data-term="sensor unit">intelligent piece of equipment that manages the signals of one or more *sensing elements* and provides the measured values.</span></span> itself and each [`Channel`]({% link model/DeviceInformationModel/Configurations/Sensor/Channel.md %}) representing one <span class="hoverterm">sensing element<span class="definition" data-term="sensing element">mechanism that provides a signal or measured value.</span></span> **MAY** have its own configuration data.

![Sensor Configuration Example]({% link figures/mtconnect.png %} "Sensor Configuration Example"){: width="80.0%"}

> Note: See example-of-configuration-data-for-sensor for an *XML* example.

