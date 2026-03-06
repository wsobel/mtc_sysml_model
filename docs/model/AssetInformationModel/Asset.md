---
title: "Asset"
parent: "Asset Information Model Package"
nav_order: 11
layout: default
---

# Asset

**Stereotypes:** `<<extensible>>`
## Version Info

{: .auto-width }
| Introduced | Deprecated | Updated |"
|---|---|---|
| 1.2 |  |  2.7 (Previous: [2.6](https://model.mtconnect.org/versions/2.6/asset)) |

abstract <span class="hoverterm">Asset<span class="definition" data-term="Asset">*asset* that is used by the manufacturing process to perform tasks.

> Note 1 to entry: An *Asset* relies upon an *Device* to provide *observations* and information about itself and the *Device* revises the information to reflect changes to the *Asset* during their interaction. Examples of *Assets* are cutting tools, Part Information, Manufacturing Processes, Fixtures, and Files.

> Note 2 to entry: A singular [`Asset`]({% link model/AssetInformationModel/Asset.md %})::`assetId` uniquely identifies an *Asset* throughout its lifecycle and is used to track and relate the *Asset* to other *Devices* and entities.

> Note 3 to entry: *Assets* are temporally associated with a device and can be removed from the device without damage or alteration to its primary functions.

</span></span>. 

### Description

It is used in the manufacturing process, but is not permanently associated with a single piece of equipment. It can be removed from the piece of equipment without compromising its function, and can be associated with other pieces of equipment during its lifecycle.


![Asset]({% link figures/mtconnect.png %} "Asset"){: width="80.0%"}

> Note: See *Section Assets Schema Diagrams* for XML schema.

## Properties

<table><thead><tr><th>Name</th><th>Type</th><th>Int</th><th>Dep</th><th>Multiplicty</th><th>Description</th></tr></thead><tbody>
<tr><td><code>assetId</code></td><td><code>ID</code></td><td>1.2</td><td></td><td>1</td>
<td markdown="block">

unique identifier for an [`Asset`]({% link model/AssetInformationModel/Asset.md %}). 

</td>
</tr>
<tr><td><code>deviceUuid</code></td><td><code>UUID</code></td><td>1.2</td><td></td><td>0..1</td>
<td markdown="block">

associated piece of equipment's *UUID* that supplied the [`Asset`]({% link model/AssetInformationModel/Asset.md %})'s data.

It references to [`Device`]({% link model/DeviceInformationModel/Device.md %})::`uuid` defined in `Device Information Model`. 

</td>
</tr>
<tr><td><code>removed</code></td><td><code>boolean</code></td><td>1.3</td><td></td><td>0..1</td>
<td markdown="block">

indicator that the [`Asset`]({% link model/AssetInformationModel/Asset.md %}) has been removed from the piece of equipment. 

</td>
</tr>
<tr><td><code>timestamp</code></td><td><code>datetime</code></td><td>1.2</td><td></td><td>1</td>
<td markdown="block">

time the [`Asset`]({% link model/AssetInformationModel/Asset.md %}) data was last modified. 

</td>
</tr>
<tr><td><code>hash</code></td><td><code>string</code></td><td>2.2</td><td></td><td>0..1</td>
<td markdown="block">

condensed message digest from a secure one-way hash function. <em>FIPS PUB 180-4</em> 

</td>
</tr>
</tbody></table>

## Relations

<table><thead><tr><th>Name</th><th>Type</th><th>Int</th><th>Dep</th><th>Multiplicty</th><th>Description</th></tr></thead><tbody>
<tr><td><code>hasConfiguration</code></td><td><a href="{% link model/DeviceInformationModel/Configurations/Configuration.md %}"><code>Configuration</code></a></td><td>1.2</td><td></td><td>0..1</td>
<td markdown="block">

 

</td>
</tr>
<tr><td><code>isAssetOf</code></td><td><a href="{% link model/Fundamentals/MTConnectProtocol/MTConnectAssetsResponseDocument/MTConnectAssets.md %}"><code>MTConnectAssets</code></a></td><td>1.2</td><td></td><td>0..*</td>
<td markdown="block">

 

</td>
</tr>
<tr><td><code>isAssetOf</code></td><td><a href="{% link model/Fundamentals/MTConnectProtocol/RESTProtocol/Agent.md %}"><code>Agent</code></a></td><td>1.2</td><td></td><td>0..*</td>
<td markdown="block">

 

</td>
</tr>

</tbody></table>

## Subclasses

{: .auto-width }
| Name | Int | Dep |
|---|---|---|
| [`AbstractFile`]({% link model/AssetInformationModel/Files/AbstractFile.md %}) | 1.7 |  |
| [`ComponentConfigurationParameters`]({% link model/AssetInformationModel/ComponentConfigurationParameters/ComponentConfigurationParameters.md %}) | 2.2 |  |
| [`CuttingTool`]({% link model/AssetInformationModel/CuttingTool/CuttingTool.md %}) | 1.2 |  |
| [`CuttingToolArchetype`]({% link model/AssetInformationModel/CuttingTool/CuttingToolArchetype.md %}) | 1.3 |  |
| [`Part`]({% link model/DeviceInformationModel/Components/ComponentTypes/Part.md %}) | 2.7 |  |
| [`PartArchetype`]({% link model/AssetInformationModel/Part/PartArchetype.md %}) | 2.7 |  |
| [`PhysicalAsset`]({% link model/AssetInformationModel/PhysicalAsset.md %}) | 2.5 |  |
| [`Process`]({% link model/DeviceInformationModel/Components/ComponentTypes/Process.md %}) | 2.7 |  |
| [`ProcessArchetype`]({% link model/AssetInformationModel/Process/ProcessArchetype.md %}) | 2.7 |  |
| [`QIFDocumentWrapper`]({% link model/AssetInformationModel/QIF/QIFDocumentWrapper.md %}) | 1.8 |  |
| [`RawMaterial`]({% link model/AssetInformationModel/RawMaterial/RawMaterial.md %}) | 1.8 |  |
| [`Task`]({% link model/AssetInformationModel/Task/Task.md %}) | 2.7 |  |
| [`TaskArchetype`]({% link model/AssetInformationModel/Task/TaskArchetype/TaskArchetype.md %}) | 2.7 |  |

