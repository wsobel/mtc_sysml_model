---
title: "MTConnectAssets"
parent: "MTConnectAssets Response Document Package"
grand_parent: "MTConnect Protocol Package"
nav_order: 3
layout: default
---

# MTConnectAssets
## Version Info

{: .auto-width }
| Introduced | Deprecated | Updated |"
|---|---|---|
| 1.2 |  |   |

root entity of an <span class="hoverterm">MTConnectAssets Response Document<span class="definition" data-term="MTConnectAssets Response Document">*response document* published by an *MTConnect Agent* in response to an *asset request*.</span></span> that contains the <span class="hoverterm">Asset Information Model<span class="definition" data-term="Asset Information Model">*information model* that provides semantic models for *Assets*.</span></span> of [`Asset`]({% link model/AssetInformationModel/Asset.md %}) types.

![MTConnectAssets]({% link figures/mtconnect.png %} "MTConnectAssets"){: width="80.0%"}

> Note: Additional properties of [`MTConnectAssets`]({% link model/Fundamentals/MTConnectProtocol/MTConnectAssetsResponseDocument/MTConnectAssets.md %}) **MAY** be defined for schema and namespace declaration. See *Section Schema and Namespace Declaration Information* for an *XML* example.

## Relations

<table><thead><tr><th>Name</th><th>Type</th><th>Int</th><th>Dep</th><th>Multiplicty</th><th>Description</th></tr></thead><tbody>
<tr><td><code>hasHeader</code></td><td><a href="{% link model/Fundamentals/MTConnectProtocol/MTConnectAssetsResponseDocument/Header.md %}"><code>Header</code></a></td><td>1.2</td><td></td><td>1</td>
<td markdown="block">

 

</td>
</tr>
<tr><td><code>hasAsset</code></td><td><a href="{% link model/AssetInformationModel/Asset.md %}"><code>Asset</code></a></td><td>1.2</td><td></td><td>0..*</td>
<td markdown="block">

 

</td>
</tr>

</tbody></table>
