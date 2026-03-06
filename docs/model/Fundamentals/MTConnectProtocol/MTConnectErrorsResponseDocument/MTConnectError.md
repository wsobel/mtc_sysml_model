---
title: "MTConnectError"
parent: "MTConnectErrors Response Document Package"
grand_parent: "MTConnect Protocol Package"
nav_order: 7
layout: default
---

# MTConnectError
## Version Info

{: .auto-width }
| Introduced | Deprecated | Updated |"
|---|---|---|
| 1.0 |  |   |

root entity of an <span class="hoverterm">MTConnectErrors Response Document<span class="definition" data-term="MTConnectErrors Response Document">*response document* published by an *MTConnect Agent* whenever it encounters an error while interpreting an *MTConnect Request*.</span></span> that contains the <span class="hoverterm">Error Information Model<span class="definition" data-term="Error Information Model">*information model* that describes the *response document* returned by an *agent* when it encounters an error while interpreting a *request* for information from a *client* or when an *agent* experiences an error while publishing the *response* to a *request* for information.</span></span>.

![MTConnectError]({% link figures/mtconnect.png %} "MTConnectError"){: width="80.0%"}

> Note: Additional properties of [`MTConnectError`]({% link model/Fundamentals/MTConnectProtocol/MTConnectErrorsResponseDocument/MTConnectError.md %}) **MAY** be defined for schema and namespace declaration. See *Section Schema and Namespace Declaration Information* for an *XML* example.

## Relations

<table><thead><tr><th>Name</th><th>Type</th><th>Int</th><th>Dep</th><th>Multiplicty</th><th>Description</th></tr></thead><tbody>
<tr><td><code>hasHeader</code></td><td><a href="{% link model/Fundamentals/MTConnectProtocol/MTConnectErrorsResponseDocument/Header.md %}"><code>Header</code></a></td><td>1.0</td><td></td><td>1</td>
<td markdown="block">

 

</td>
</tr>
<tr><td><code>hasError</code></td><td><a href="{% link model/Fundamentals/MTConnectProtocol/MTConnectErrorsResponseDocument/Error.md %}"><code>Error</code></a></td><td>1.1</td><td></td><td>1..*</td>
<td markdown="block">

 

</td>
</tr>
<tr><td><s><code>error</code></s></td><td><a href="{% link model/Fundamentals/MTConnectProtocol/MTConnectErrorsResponseDocument/Error.md %}"><code>Error</code></a></td><td>1.0</td><td>1.1</td><td>1</td>
<td markdown="block">

 

</td>
</tr>

</tbody></table>
