---
title: "SensorConfiguration"
parent: "Sensor Package"
grand_parent: "Configurations Package"
nav_order: 3
layout: default
---

# SensorConfiguration
## Version Info

{: .auto-width }
| Introduced | Deprecated | Updated |"
|---|---|---|
| 1.2 |  |   |

configuration for a [`Sensor`]({% link model/DeviceInformationModel/Components/ComponentTypes/Sensor.md %}).

### Description

![SensorConfiguration]({% link figures/mtconnect.png %} "SensorConfiguration"){: width="80.0%"}

> Note: See *Section Configuration Schema Diagrams* for XML schema.

## Properties

<table><thead><tr><th>Name</th><th>Type</th><th>Int</th><th>Dep</th><th>Multiplicty</th><th>Description</th></tr></thead><tbody>
<tr><td><code>CalibrationDate</code></td><td><code>datetime</code></td><td>1.2</td><td></td><td>0..1</td>
<td markdown="block">

Date upon which the <span class="hoverterm">sensor unit<span class="definition" data-term="sensor unit">intelligent piece of equipment that manages the signals of one or more *sensing elements* and provides the measured values.</span></span> was last calibrated. 

</td>
</tr>
<tr><td><code>CalibrationInitials</code></td><td><code>string</code></td><td>1.2</td><td></td><td>0..1</td>
<td markdown="block">

The initials of the person verifying the validity of the calibration data. 

</td>
</tr>
<tr><td><code>FirmwareVersion</code></td><td><code>string</code></td><td>1.2</td><td></td><td>1</td>
<td markdown="block">

Version number for the sensor unit as specified by the manufacturer. 

</td>
</tr>
<tr><td><code>NextCalibrationDate</code></td><td><code>datetime</code></td><td>1.2</td><td></td><td>0..1</td>
<td markdown="block">

Date upon which the <span class="hoverterm">sensor unit<span class="definition" data-term="sensor unit">intelligent piece of equipment that manages the signals of one or more *sensing elements* and provides the measured values.</span></span> is next scheduled to be calibrated. 

</td>
</tr>
</tbody></table>

## Relations

<table><thead><tr><th>Name</th><th>Type</th><th>Int</th><th>Dep</th><th>Multiplicty</th><th>Description</th></tr></thead><tbody>
<tr><td><code>hasChannel</code></td><td><a href="{% link model/DeviceInformationModel/Configurations/Sensor/Channel.md %}"><code>Channel</code></a></td><td>1.2</td><td></td><td>0..*</td>
<td markdown="block">

 

</td>
</tr>
<tr><td><code>isSensorConfigurationOf</code></td><td><a href="{% link model/DeviceInformationModel/Configurations/Configuration.md %}"><code>Configuration</code></a></td><td>1.2</td><td></td><td>0..1</td>
<td markdown="block">

 

</td>
</tr>

</tbody></table>
