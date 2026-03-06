---
title: "MTConnectDevices"
parent: "MTConnectDevices Response Document Package"
grand_parent: "MTConnect Protocol Package"
nav_order: 6
layout: default
---

# MTConnectDevices
## Version Info

{: .auto-width }
| Introduced | Deprecated | Updated |"
|---|---|---|
| 1.0 |  |   |

root entity of an <span class="hoverterm">MTConnectDevices Response Document<span class="definition" data-term="MTConnectDevices Response Document">*response document* published by an *MTConnect Agent* in response to a *probe request*.</span></span> that contains the <span class="hoverterm">Device Information Model<span class="definition" data-term="Device Information Model">*information model* that describes the physical and logical configuration for a piece of equipment and the data that may be reported by that equipment. </span></span> of one or more [`Device`]({% link model/DeviceInformationModel/Device.md %}) entities.

![MTConnectDevices]({% link figures/mtconnect.png %} "MTConnectDevices"){: width="80.0%"}

> Note: Additional properties of [`MTConnectDevices`]({% link model/Fundamentals/MTConnectProtocol/MTConnectDevicesResponseDocument/MTConnectDevices.md %}) **MAY** be defined for schema and namespace declaration. See *Section Schema and Namespace Declaration Information* for an *XML* example.

## Relations

<table><thead><tr><th>Name</th><th>Type</th><th>Int</th><th>Dep</th><th>Multiplicty</th><th>Description</th></tr></thead><tbody>
<tr><td><code>hasHeader</code></td><td><a href="{% link model/Fundamentals/MTConnectProtocol/MTConnectDevicesResponseDocument/Header.md %}"><code>Header</code></a></td><td>1.0</td><td></td><td>1</td>
<td markdown="block">

 

</td>
</tr>
<tr><td><code>hasDevice</code></td><td><a href="{% link model/DeviceInformationModel/Device.md %}"><code>Device</code></a></td><td>1.0</td><td></td><td>1..*</td>
<td markdown="block">

 

</td>
</tr>

</tbody></table>

## Constraints

<table><thead><tr><th>Error Message</th><th>OCL Expression</th></tr></thead><tbody>

<tr><td markdown="block">

All `id` properties **MUST** be unique.

</td><td markdown="block">

```
val:IdsMustBeUnique
    a sh:PredicateShape ;
    sh:targetSubjectsOf mt:hasId ;
    sh:sparql [
        sh:prefixes val:Prefix ;
        sh:message "All `id` properties **MUST** be unique." ;
        sh:select """
            SELECT $this ?id WHERE {
                $this mt:hasId ?id .
                ?other mt:hasId ?id .
                FILTER ($this != ?other)
            }
        """ ;
    ] .
```

</td></tr>

<tr><td markdown="block">

All `name` properties **MUST** be unique.

</td><td markdown="block">

```
val:NamesShouldBeUnique
    a sh:PredicateShape ;
    sh:targetSubjectsOf mt:hasName ;
    sh:sparql [
      a sh:SPARQLConstraint ;
        sh:prefixes val:Prefix ;
        sh:message "All `name` properties **SHOULD** be unique." ;
        sh:severity sh:Warning ;
        sh:select """
            SELECT $this ?name WHERE {
                $this mt:hasName ?name .
                ?other mt:hasName ?name .
                FILTER ($this != ?other)
            }
        """ ;
    ] .

val:NamesAtTheSameLevelMustBeUnique
    a sh:NodeShape ;
    sh:targetClass mt:Component ;
    sh:sparql [
        a sh:SPARQLConstraint ;
        sh:prefixes val:Prefix ;
        sh:message "All `name` properties at the same level **MUST** be unique." ;
        sh:select """
            SELECT $this ?name ?sub1 ?sub2 WHERE {
                $this mt:hasComponent ?sub1 .
                ?sub1 mt:hasName ?name .
                $this mt:hasComponent ?sub2 .
                ?sub2 mt:hasName ?name .
                FILTER (?sub1 != ?sub2)
            }
        """ ;
    ] .
```

</td></tr>

</tbody></table>
