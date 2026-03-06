---
title: "Fundamentals Package"
nav_order: 2
has_children: true
layout: default
---

# Fundamentals Package

The MTConnect Standard defines the normative information model and protocol for retrieving information from manufacturing equipment. This document specifies the <span class="hoverterm">agent<span class="definition" data-term="agent">software that collects data published from one or more piece(s) of equipment, organizes that data in a structured manner, and responds to requests for data from client software systems by providing a structured response in the form of a *response document* that is constructed using the *semantic data model* of a Standard. 
</span></span> behavior and protocol.

## Agent

The MTConnect Standard specifies the minimum functionality of the <span class="hoverterm">agent<span class="definition" data-term="agent">software that collects data published from one or more piece(s) of equipment, organizes that data in a structured manner, and responds to requests for data from client software systems by providing a structured response in the form of a *response document* that is constructed using the *semantic data model* of a Standard. 
</span></span>. The functionality is as follows:

* Provides store and forward messaging middleware service.
* Provides key-value information storage and asset retrieval service.
* Implements the REST API for the MTConnect Standard (See `REST Protocol`).
  * <span class="hoverterm">Device<span class="definition" data-term="Device">*Component* not belonging to any *Component* that may have *assets*</span></span> metadata.
  * <span class="hoverterm">observations<span class="definition" data-term="observation">observed value of a property at a point in time.</span></span> collected by the agent.
  * <span class="hoverterm">assets<span class="definition" data-term="asset">item, thing or entity that has potential or actual value to an organization. <em>ISO 55000:2014</em>

> Note 1 to entry: Value can be tangible or intangible, financial or non-financial, and includes consideration of risks and liabilities. It can be positive or negative at different stages of the asset life.

> Note 2 to entry: Physical assets usually refer to equipment, inventory and properties owned by the organization. Physical assets are the opposite of intangible assets, which are non-physical assets such as leases, brands, digital assets, use rights, licences, intellectual property rights, reputation or agreements.

> Note 3 to entry: A grouping of assets referred to as an asset system could also be considered as an asset.

</span></span> collected by the agent.

There are three types of information stored by an <span class="hoverterm">agent<span class="definition" data-term="agent">software that collects data published from one or more piece(s) of equipment, organizes that data in a structured manner, and responds to requests for data from client software systems by providing a structured response in the form of a *response document* that is constructed using the *semantic data model* of a Standard. 
</span></span> that **MAY** be published in a <span class="hoverterm">response document<span class="definition" data-term="response document">electronic *document* published by an *MTConnect Agent* in response to a *probe request*, *current request*, *sample request* or *asset request*.</span></span>. These are as follows:

* <span class="hoverterm">equipment metadata<span class="definition" data-term="equipment metadata">*metadata* that defines both the entities that represent the physical and logical parts and sub-parts of each piece of equipment, the relationships between those parts and sub-parts, and the definitions of the *DataItems* associated with that piece of equipment.</span></span> specified in `Device Information Model`.
* <span class="hoverterm">streaming data<span class="definition" data-term="streaming data">*observations* published by a piece of equipment defined by the *equipment metadata*.</span></span> provides the <span class="hoverterm">observations<span class="definition" data-term="observation">observed value of a property at a point in time.</span></span> specified in `Observation Information Model`.
* <span class="hoverterm">Assets<span class="definition" data-term="Asset">*asset* that is used by the manufacturing process to perform tasks.

> Note 1 to entry: An *Asset* relies upon an *Device* to provide *observations* and information about itself and the *Device* revises the information to reflect changes to the *Asset* during their interaction. Examples of *Assets* are cutting tools, Part Information, Manufacturing Processes, Fixtures, and Files.

> Note 2 to entry: A singular [`Asset`]({% link model/AssetInformationModel/Asset.md %})::`assetId` uniquely identifies an *Asset* throughout its lifecycle and is used to track and relate the *Asset* to other *Devices* and entities.

> Note 3 to entry: *Assets* are temporally associated with a device and can be removed from the device without damage or alteration to its primary functions.

</span></span> specified in `Asset Information Model`.

### Agent Instance ID

The <span class="hoverterm">agent<span class="definition" data-term="agent">software that collects data published from one or more piece(s) of equipment, organizes that data in a structured manner, and responds to requests for data from client software systems by providing a structured response in the form of a *response document* that is constructed using the *semantic data model* of a Standard. 
</span></span> **MUST** set the `instanceId` to a unique value whenever the <span class="hoverterm">sequence number<span class="definition" data-term="sequence number">primary key identifier used to manage and locate a specific piece of *streaming data* in an *agent*.</span></span> in the agent is initialized to `1`.  (see *Section Sequence Numbers* and *Section Persistence and Recovery* below). 

### Storage of Equipment Metadata

An <span class="hoverterm">agent<span class="definition" data-term="agent">software that collects data published from one or more piece(s) of equipment, organizes that data in a structured manner, and responds to requests for data from client software systems by providing a structured response in the form of a *response document* that is constructed using the *semantic data model* of a Standard. 
</span></span> **MUST** be capable of publishing <span class="hoverterm">equipment metadata<span class="definition" data-term="equipment metadata">*metadata* that defines both the entities that represent the physical and logical parts and sub-parts of each piece of equipment, the relationships between those parts and sub-parts, and the definitions of the *DataItems* associated with that piece of equipment.</span></span> for the <span class="hoverterm">agent<span class="definition" data-term="agent">software that collects data published from one or more piece(s) of equipment, organizes that data in a structured manner, and responds to requests for data from client software systems by providing a structured response in the form of a *response document* that is constructed using the *semantic data model* of a Standard. 
</span></span> as specified in `Device Information Model`.

### Storage of Streaming Data

The <span class="hoverterm">agent<span class="definition" data-term="agent">software that collects data published from one or more piece(s) of equipment, organizes that data in a structured manner, and responds to requests for data from client software systems by providing a structured response in the form of a *response document* that is constructed using the *semantic data model* of a Standard. 
</span></span> **MAY** implement a <span class="hoverterm">buffer<span class="definition" data-term="buffer">section of an *agent* that provides storage for information published from pieces of equipment.</span></span> with a fixed number of <span class="hoverterm">observations<span class="definition" data-term="observation">observed value of a property at a point in time.</span></span>. If the `bufferSize` is fixed, the <span class="hoverterm">agent<span class="definition" data-term="agent">software that collects data published from one or more piece(s) of equipment, organizes that data in a structured manner, and responds to requests for data from client software systems by providing a structured response in the form of a *response document* that is constructed using the *semantic data model* of a Standard. 
</span></span> **MUST** store <span class="hoverterm">observations<span class="definition" data-term="observation">observed value of a property at a point in time.</span></span> using a first-in-first-out pattern. The <span class="hoverterm">agent<span class="definition" data-term="agent">software that collects data published from one or more piece(s) of equipment, organizes that data in a structured manner, and responds to requests for data from client software systems by providing a structured response in the form of a *response document* that is constructed using the *semantic data model* of a Standard. 
</span></span> will remove the oldest <span class="hoverterm">observation<span class="definition" data-term="observation">observed value of a property at a point in time.</span></span> when the <span class="hoverterm">buffer<span class="definition" data-term="buffer">section of an *agent* that provides storage for information published from pieces of equipment.</span></span> is full and a new <span class="hoverterm">observation<span class="definition" data-term="observation">observed value of a property at a point in time.</span></span> arrives.

![Data Storage in Buffer]({% link figures/mtconnect.png %} "data-storage-in-buffer"){: width="80.0%"}

In *Figure first-in-first-out-buffer-management*, the maximum number of <span class="hoverterm">observations<span class="definition" data-term="observation">observed value of a property at a point in time.</span></span> that can be stored in the <span class="hoverterm">buffer<span class="definition" data-term="buffer">section of an *agent* that provides storage for information published from pieces of equipment.</span></span> of the <span class="hoverterm">agent<span class="definition" data-term="agent">software that collects data published from one or more piece(s) of equipment, organizes that data in a structured manner, and responds to requests for data from client software systems by providing a structured response in the form of a *response document* that is constructed using the *semantic data model* of a Standard. 
</span></span> is 8. The `bufferSize` in the header reports the maximum number of <span class="hoverterm">observations<span class="definition" data-term="observation">observed value of a property at a point in time.</span></span>. This example illustrates that when the <span class="hoverterm">buffer<span class="definition" data-term="buffer">section of an *agent* that provides storage for information published from pieces of equipment.</span></span> fills up, the oldest piece of data falls out the other end.

![First In First Out Buffer Management]({% link figures/mtconnect.png %} "first-in-first-out-buffer-management"){: width="80.0%"}

> Note: As an implementation suggestion, the <span class="hoverterm">buffer<span class="definition" data-term="buffer">section of an *agent* that provides storage for information published from pieces of equipment.</span></span> should be sized large enough to provide a continuous stream of <span class="hoverterm">observations<span class="definition" data-term="observation">observed value of a property at a point in time.</span></span>. The implementer should also consider the impact of a temporary loss of communications when determining the size for the <span class="hoverterm">buffer<span class="definition" data-term="buffer">section of an *agent* that provides storage for information published from pieces of equipment.</span></span>. A larger <span class="hoverterm">buffer<span class="definition" data-term="buffer">section of an *agent* that provides storage for information published from pieces of equipment.</span></span> will allow more time to reconnect to an <span class="hoverterm">agent<span class="definition" data-term="agent">software that collects data published from one or more piece(s) of equipment, organizes that data in a structured manner, and responds to requests for data from client software systems by providing a structured response in the form of a *response document* that is constructed using the *semantic data model* of a Standard. 
</span></span> without losing data.

#### Sequence Numbers

In an <span class="hoverterm">agent<span class="definition" data-term="agent">software that collects data published from one or more piece(s) of equipment, organizes that data in a structured manner, and responds to requests for data from client software systems by providing a structured response in the form of a *response document* that is constructed using the *semantic data model* of a Standard. 
</span></span>, each occurrence of an <span class="hoverterm">observation<span class="definition" data-term="observation">observed value of a property at a point in time.</span></span> in the <span class="hoverterm">buffer<span class="definition" data-term="buffer">section of an *agent* that provides storage for information published from pieces of equipment.</span></span> will be assigned a monotonically increasing unsigned 64-bit integer (<span class="hoverterm">sequence number<span class="definition" data-term="sequence number">primary key identifier used to manage and locate a specific piece of *streaming data* in an *agent*.</span></span>) when it arrives. The first <span class="hoverterm">sequence number<span class="definition" data-term="sequence number">primary key identifier used to manage and locate a specific piece of *streaming data* in an *agent*.</span></span> **MUST** be `1`.

The <span class="hoverterm">sequence number<span class="definition" data-term="sequence number">primary key identifier used to manage and locate a specific piece of *streaming data* in an *agent*.</span></span> for each <span class="hoverterm">observation<span class="definition" data-term="observation">observed value of a property at a point in time.</span></span> **MUST** be unique for an instance of an <span class="hoverterm">agent<span class="definition" data-term="agent">software that collects data published from one or more piece(s) of equipment, organizes that data in a structured manner, and responds to requests for data from client software systems by providing a structured response in the form of a *response document* that is constructed using the *semantic data model* of a Standard. 
</span></span> identified by an `instanceId`.

*Table instanceid-and-sequence* illustrates the changing of the `instanceId` when an <span class="hoverterm">agent<span class="definition" data-term="agent">software that collects data published from one or more piece(s) of equipment, organizes that data in a structured manner, and responds to requests for data from client software systems by providing a structured response in the form of a *response document* that is constructed using the *semantic data model* of a Standard. 
</span></span> resets the <span class="hoverterm">sequence number<span class="definition" data-term="sequence number">primary key identifier used to manage and locate a specific piece of *streaming data* in an *agent*.</span></span> to `1`.

| `instanceId` | `sequence` | 
|-------------:|-----------:|
| 234556|234|
||235|
||236|
||237|
||238|
| Agent Stops and Restarts|
| 234557|1|
||2|
||3|
||4|
||5|
{: caption="instanceId and sequence" label="instanceid-and-sequence" }

*Figure identifying-the-range-of-data-with-firstsequence-and-lastsequence* shows two additional pieces of information defined for an <span class="hoverterm">agent<span class="definition" data-term="agent">software that collects data published from one or more piece(s) of equipment, organizes that data in a structured manner, and responds to requests for data from client software systems by providing a structured response in the form of a *response document* that is constructed using the *semantic data model* of a Standard. 
</span></span>:

* `firstSequence` -- the oldest <span class="hoverterm">observation<span class="definition" data-term="observation">observed value of a property at a point in time.</span></span> in the <span class="hoverterm">buffer<span class="definition" data-term="buffer">section of an *agent* that provides storage for information published from pieces of equipment.</span></span>. The <span class="hoverterm">agent<span class="definition" data-term="agent">software that collects data published from one or more piece(s) of equipment, organizes that data in a structured manner, and responds to requests for data from client software systems by providing a structured response in the form of a *response document* that is constructed using the *semantic data model* of a Standard. 
</span></span> removes this <span class="hoverterm">observation<span class="definition" data-term="observation">observed value of a property at a point in time.</span></span> when it receives the next <span class="hoverterm">observation<span class="definition" data-term="observation">observed value of a property at a point in time.</span></span>

* `lastSequence` -- the newest <span class="hoverterm">observation<span class="definition" data-term="observation">observed value of a property at a point in time.</span></span> in the <span class="hoverterm">buffer<span class="definition" data-term="buffer">section of an *agent* that provides storage for information published from pieces of equipment.</span></span>

`firstSequence` and `lastSequence` provide the range of values for the REST API requests.

![Indentifying the range of data with firstSequence and lastSequence]({% link figures/mtconnect.png %} "identifying-the-range-of-data-with-firstsequence-and-lastsequence"){: width="75.0%"}

The <span class="hoverterm">agent<span class="definition" data-term="agent">software that collects data published from one or more piece(s) of equipment, organizes that data in a structured manner, and responds to requests for data from client software systems by providing a structured response in the form of a *response document* that is constructed using the *semantic data model* of a Standard. 
</span></span> **MUST** begin evaluating <span class="hoverterm">observations<span class="definition" data-term="observation">observed value of a property at a point in time.</span></span> with <span class="hoverterm">sample request<span class="definition" data-term="sample request">*request* to an *agent* to produce an *MTConnectStreams Response Document* containing the *Observation Information Model* for a set of timestamped *observations* made by *Components*.</span></span>'s `from` parameter. Also, the <span class="hoverterm">agent<span class="definition" data-term="agent">software that collects data published from one or more piece(s) of equipment, organizes that data in a structured manner, and responds to requests for data from client software systems by providing a structured response in the form of a *response document* that is constructed using the *semantic data model* of a Standard. 
</span></span>  **MUST** include a maximum number of <span class="hoverterm">observations<span class="definition" data-term="observation">observed value of a property at a point in time.</span></span> given by the `count` parameter in the <span class="hoverterm">response document<span class="definition" data-term="response document">electronic *document* published by an *MTConnect Agent* in response to a *probe request*, *current request*, *sample request* or *asset request*.</span></span>.

In *Figure identifying-the-range-of-data-with-from-and-count*, the request specifies the <span class="hoverterm">observations<span class="definition" data-term="observation">observed value of a property at a point in time.</span></span> start at <span class="hoverterm">sequence number<span class="definition" data-term="sequence number">primary key identifier used to manage and locate a specific piece of *streaming data* in an *agent*.</span></span> `15` (`from`) and includes a total of three items (`count`).

![Identifying the range of data with from and count]({% link figures/mtconnect.png %} "identifying-the-range-of-data-with-from-and-count"){: width="75.0%"}

`nextSequence` header property has the <span class="hoverterm">sequence number<span class="definition" data-term="sequence number">primary key identifier used to manage and locate a specific piece of *streaming data* in an *agent*.</span></span> of the next <span class="hoverterm">observation<span class="definition" data-term="observation">observed value of a property at a point in time.</span></span> in the <span class="hoverterm">buffer<span class="definition" data-term="buffer">section of an *agent* that provides storage for information published from pieces of equipment.</span></span> for subsequent <span class="hoverterm">sample requests<span class="definition" data-term="sample request">*request* to an *agent* to produce an *MTConnectStreams Response Document* containing the *Observation Information Model* for a set of timestamped *observations* made by *Components*.</span></span> providing a contiguous set of <span class="hoverterm">observations<span class="definition" data-term="observation">observed value of a property at a point in time.</span></span>. In the example in *Figure identifying-the-range-of-data-with-from-and-count*, the next <span class="hoverterm">sequence number<span class="definition" data-term="sequence number">primary key identifier used to manage and locate a specific piece of *streaming data* in an *agent*.</span></span> (`nextSequence`) will be 18.

As shown in *Figure identifying-the-range-of-data-with-nextsequence-and-lastsequence*, the combination of `from` and `count` defined by the <span class="hoverterm">request<span class="definition" data-term="request">communications method where a *client* transmits a message to an *agent*.  That message instructs the *agent* to respond with specific information.</span></span> indicates a <span class="hoverterm">sequence number<span class="definition" data-term="sequence number">primary key identifier used to manage and locate a specific piece of *streaming data* in an *agent*.</span></span> for data that is beyond that which is currently in the <span class="hoverterm">buffer<span class="definition" data-term="buffer">section of an *agent* that provides storage for information published from pieces of equipment.</span></span>. In this case, `nextSequence` is set to a value of $$ lastSequence + 1 $$.

![Indentifying the range of data with nextSequence and lastSequence]({% link figures/mtconnect.png %} "identifying-the-range-of-data-with-nextsequence-and-lastsequence"){: width="75.0%"}

#### Observation Buffer

An <span class="hoverterm">observation<span class="definition" data-term="observation">observed value of a property at a point in time.</span></span> has four pieces of information as follows:

1. <span class="hoverterm">sequence number<span class="definition" data-term="sequence number">primary key identifier used to manage and locate a specific piece of *streaming data* in an *agent*.</span></span> associated with each <span class="hoverterm">observation<span class="definition" data-term="observation">observed value of a property at a point in time.</span></span> - `sequence`.
2. The `timestamp` the <span class="hoverterm">observation<span class="definition" data-term="observation">observed value of a property at a point in time.</span></span> was made. .
3. A reference to the `dataitemid` from the `Device Information Model`.
4. The value of the <span class="hoverterm">observation<span class="definition" data-term="observation">observed value of a property at a point in time.</span></span>.

*Table data-storage-concept* is an example demonstrating the concept of how data may be stored in an <span class="hoverterm">agent<span class="definition" data-term="agent">software that collects data published from one or more piece(s) of equipment, organizes that data in a structured manner, and responds to requests for data from client software systems by providing a structured response in the form of a *response document* that is constructed using the *semantic data model* of a Standard. 
</span></span>:

| `sequence` | `timestamp` | `dataItemId` | `result` |
|-----------:|------------:|-------------:|---------:|
|`101`|`2016-12-13T09:44:00.2221Z`|`AVAIL-28277`|`UNAVAILABLE`|
|`102`|`2016-12-13T09:54:00.3839Z`|`AVAIL-28277`|`AVAILABLE`|
|`103`|`2016-12-13T10:00:00.0594Z`|`POS-Y-28277`|`25.348`|
|`104`|`2016-12-13T10:00:00.0594Z`|`POS-Z-28277`|`13.23`|
|`105`|`2016-12-13T10:00:03.2839Z`|`SS-28277`|`0`|
|`106`|`2016-12-13T10:00:03.2839Z`|`POS-X-28277`|`11.195`|
|`107`|`2016-12-13T10:00:03.2839Z`|`POS-Y-28277`|`24.938`|
|`108`|`2016-12-13T10:01:37.8594Z`|`POS-Z-28277`|`1.143`|
|`109`|`2016-12-13T10:02:03.2617Z`|`SS-28277`|`1002`|
{: caption="Data Storage Concept" label="data-storage-concept" }

#### Timestamp

<span class="hoverterm">observations<span class="definition" data-term="observation">observed value of a property at a point in time.</span></span> **MUST** have a `timestamp` giving the most accurate time that the <span class="hoverterm">observation<span class="definition" data-term="observation">observed value of a property at a point in time.</span></span> occurred.

The timezone of the `timestamp` **MUST** be UTC (Coordinated Universal Time)  and represented using ISO 8601 format: e.g., "2010-04-01T21:22:43Z".

Applications **SHOULD** use the <span class="hoverterm">observation<span class="definition" data-term="observation">observed value of a property at a point in time.</span></span>'s `timestamp` for ordering as opposed to <span class="hoverterm">sequence number<span class="definition" data-term="sequence number">primary key identifier used to manage and locate a specific piece of *streaming data* in an *agent*.</span></span>.

All <span class="hoverterm">observations<span class="definition" data-term="observation">observed value of a property at a point in time.</span></span> occurring at the same time **MUST** have the same `timestamp`. 

#### Recording Occurrences of Streaming Data

The <span class="hoverterm">agent<span class="definition" data-term="agent">software that collects data published from one or more piece(s) of equipment, organizes that data in a structured manner, and responds to requests for data from client software systems by providing a structured response in the form of a *response document* that is constructed using the *semantic data model* of a Standard. 
</span></span> **MUST** only place <span class="hoverterm">observations<span class="definition" data-term="observation">observed value of a property at a point in time.</span></span> in the <span class="hoverterm">buffer<span class="definition" data-term="buffer">section of an *agent* that provides storage for information published from pieces of equipment.</span></span> if the data has changed from the previous <span class="hoverterm">observation<span class="definition" data-term="observation">observed value of a property at a point in time.</span></span> for the same [`DataItem`]({% link model/DeviceInformationModel/DataItems/DataItem.md %}). 

The <span class="hoverterm">agent<span class="definition" data-term="agent">software that collects data published from one or more piece(s) of equipment, organizes that data in a structured manner, and responds to requests for data from client software systems by providing a structured response in the form of a *response document* that is constructed using the *semantic data model* of a Standard. 
</span></span> **MUST** place every <span class="hoverterm">observation<span class="definition" data-term="observation">observed value of a property at a point in time.</span></span> in the <span class="hoverterm">buffer<span class="definition" data-term="buffer">section of an *agent* that provides storage for information published from pieces of equipment.</span></span>, without checking for changes, in the following cases:

* The [`DataItem`]({% link model/DeviceInformationModel/DataItems/DataItem.md %})::`discrete` is `true`. 
* The [`DataItem`]({% link model/DeviceInformationModel/DataItems/DataItem.md %})::`representation` is `DISCRETE`.
* The [`DataItem`]({% link model/DeviceInformationModel/DataItems/DataItem.md %})::`representation` is `TIME_SERIES`.

#### Maintaining Last Value for Data Entities

An <span class="hoverterm">agent<span class="definition" data-term="agent">software that collects data published from one or more piece(s) of equipment, organizes that data in a structured manner, and responds to requests for data from client software systems by providing a structured response in the form of a *response document* that is constructed using the *semantic data model* of a Standard. 
</span></span> **MUST** retain the most recent <span class="hoverterm">observation<span class="definition" data-term="observation">observed value of a property at a point in time.</span></span> associated with each [`DataItem`]({% link model/DeviceInformationModel/DataItems/DataItem.md %}), even if the <span class="hoverterm">observation<span class="definition" data-term="observation">observed value of a property at a point in time.</span></span> is no longer in the <span class="hoverterm">buffer<span class="definition" data-term="buffer">section of an *agent* that provides storage for information published from pieces of equipment.</span></span>. This function supports the <span class="hoverterm">current request<span class="definition" data-term="current request">*request* to an *agent* to produce an *MTConnectStreams Response Document* containing the *Observation Information Model* for a snapshot of the latest *observations* at the moment of the *request* or at a given *sequence number*.</span></span> functionality.

#### Unavailability of Data

An <span class="hoverterm">observation<span class="definition" data-term="observation">observed value of a property at a point in time.</span></span> with the value of `UNAVAILABLE` indicates the value is indeterminate.

The <span class="hoverterm">agent<span class="definition" data-term="agent">software that collects data published from one or more piece(s) of equipment, organizes that data in a structured manner, and responds to requests for data from client software systems by providing a structured response in the form of a *response document* that is constructed using the *semantic data model* of a Standard. 
</span></span> **MUST** initialize every [`DataItem`]({% link model/DeviceInformationModel/DataItems/DataItem.md %}), unless it has a constant value (see below), with an <span class="hoverterm">observation<span class="definition" data-term="observation">observed value of a property at a point in time.</span></span> with the value of `UNAVAILABLE`. Aditionally, whenever the data source is unreachable, every [`DataItem`]({% link model/DeviceInformationModel/DataItems/DataItem.md %}) associated with the data source must have an <span class="hoverterm">observation<span class="definition" data-term="observation">observed value of a property at a point in time.</span></span> with the value of `UNAVAILABLE` and `timestamp` when the connection was lost. 

An [`DataItem`]({% link model/DeviceInformationModel/DataItems/DataItem.md %}) that is constrained to a constant value, as defined in `Device Information Model`, **MUST** only have an <span class="hoverterm">observation<span class="definition" data-term="observation">observed value of a property at a point in time.</span></span> with the constant value and **MUST NOT** be set to `UNAVAILABLE`.

#### Persistence and Recovery

The <span class="hoverterm">agent<span class="definition" data-term="agent">software that collects data published from one or more piece(s) of equipment, organizes that data in a structured manner, and responds to requests for data from client software systems by providing a structured response in the form of a *response document* that is constructed using the *semantic data model* of a Standard. 
</span></span> **MAY** have a fixed size <span class="hoverterm">buffer<span class="definition" data-term="buffer">section of an *agent* that provides storage for information published from pieces of equipment.</span></span> and the <span class="hoverterm">buffer<span class="definition" data-term="buffer">section of an *agent* that provides storage for information published from pieces of equipment.</span></span> **MAY** be ephemeral.

If the <span class="hoverterm">buffer<span class="definition" data-term="buffer">section of an *agent* that provides storage for information published from pieces of equipment.</span></span> is recoverable, the <span class="hoverterm">agent<span class="definition" data-term="agent">software that collects data published from one or more piece(s) of equipment, organizes that data in a structured manner, and responds to requests for data from client software systems by providing a structured response in the form of a *response document* that is constructed using the *semantic data model* of a Standard. 
</span></span> **MUST NOT** change the `instanceId` and **MUST NOT** set the <span class="hoverterm">sequence number<span class="definition" data-term="sequence number">primary key identifier used to manage and locate a specific piece of *streaming data* in an *agent*.</span></span> to `1`. The <span class="hoverterm">sequence number<span class="definition" data-term="sequence number">primary key identifier used to manage and locate a specific piece of *streaming data* in an *agent*.</span></span> **MUST** be one greater than the maximum value of the recovered <span class="hoverterm">observations<span class="definition" data-term="observation">observed value of a property at a point in time.</span></span>. $$ max(sequence) + 1 $$

### Storage of MTConnect Assets

An <span class="hoverterm">agent<span class="definition" data-term="agent">software that collects data published from one or more piece(s) of equipment, organizes that data in a structured manner, and responds to requests for data from client software systems by providing a structured response in the form of a *response document* that is constructed using the *semantic data model* of a Standard. 
</span></span> **MAY** only retain a limited number of [`Asset`]({% link model/AssetInformationModel/Asset.md %})s in the <span class="hoverterm">asset buffer<span class="definition" data-term="asset buffer">*buffer* for *Assets*.</span></span>. The [`Asset`]({% link model/AssetInformationModel/Asset.md %})s are stored in first-in-first-out method where the oldest [`Asset`]({% link model/AssetInformationModel/Asset.md %}) is removed when the <span class="hoverterm">asset buffer<span class="definition" data-term="asset buffer">*buffer* for *Assets*.</span></span> is full and a new [`Asset`]({% link model/AssetInformationModel/Asset.md %}) arrives.

*Figure first-in-first-out-asset-buffer-management* illustrates the oldest [`Asset`]({% link model/AssetInformationModel/Asset.md %}) being removed from the <span class="hoverterm">asset buffer<span class="definition" data-term="asset buffer">*buffer* for *Assets*.</span></span> when a new [`Asset`]({% link model/AssetInformationModel/Asset.md %}) is added and the <span class="hoverterm">asset buffer<span class="definition" data-term="asset buffer">*buffer* for *Assets*.</span></span> is full:

![First In First Out Asset Buffer Management]({% link figures/mtconnect.png %} "first-in-first-out-asset-buffer-management"){: width="60.0%"}

[`Asset`]({% link model/AssetInformationModel/Asset.md %})s are indexed by [`Asset`]({% link model/AssetInformationModel/Asset.md %})::`assetId`. In the case of [`Asset`]({% link model/AssetInformationModel/Asset.md %})s, *Figure relationship-between-assetid-and-stored-asset-documents* demonstrates the relationship between the key ([`Asset`]({% link model/AssetInformationModel/Asset.md %})::`assetId`) and the stored [`Asset`]({% link model/AssetInformationModel/Asset.md %}):

![Relationship between assetId and stored Asset documents]({% link figures/mtconnect.png %} "relationship-between-assetid-and-stored-asset-documents"){: width="25.0%"}

> Note: The key ([`Asset`]({% link model/AssetInformationModel/Asset.md %})::`assetId`) is independent of the order of the [`Asset`]({% link model/AssetInformationModel/Asset.md %}) stored in the <span class="hoverterm">asset buffer<span class="definition" data-term="asset buffer">*buffer* for *Assets*.</span></span>.

When the <span class="hoverterm">agent<span class="definition" data-term="agent">software that collects data published from one or more piece(s) of equipment, organizes that data in a structured manner, and responds to requests for data from client software systems by providing a structured response in the form of a *response document* that is constructed using the *semantic data model* of a Standard. 
</span></span> receives a new [`Asset`]({% link model/AssetInformationModel/Asset.md %}), one of the following rules **MUST** apply:

* If the [`Asset`]({% link model/AssetInformationModel/Asset.md %}) is not in the <span class="hoverterm">asset buffer<span class="definition" data-term="asset buffer">*buffer* for *Assets*.</span></span>, the <span class="hoverterm">agent<span class="definition" data-term="agent">software that collects data published from one or more piece(s) of equipment, organizes that data in a structured manner, and responds to requests for data from client software systems by providing a structured response in the form of a *response document* that is constructed using the *semantic data model* of a Standard. 
</span></span> **MUST** add the new [`Asset`]({% link model/AssetInformationModel/Asset.md %}) to the front of the <span class="hoverterm">asset buffer<span class="definition" data-term="asset buffer">*buffer* for *Assets*.</span></span>. If the <span class="hoverterm">asset buffer<span class="definition" data-term="asset buffer">*buffer* for *Assets*.</span></span> is full, the oldest [`Asset`]({% link model/AssetInformationModel/Asset.md %}) will be removed from the <span class="hoverterm">asset buffer<span class="definition" data-term="asset buffer">*buffer* for *Assets*.</span></span>.

* If the [`Asset`]({% link model/AssetInformationModel/Asset.md %}) is already in the <span class="hoverterm">asset buffer<span class="definition" data-term="asset buffer">*buffer* for *Assets*.</span></span>, the <span class="hoverterm">agent<span class="definition" data-term="agent">software that collects data published from one or more piece(s) of equipment, organizes that data in a structured manner, and responds to requests for data from client software systems by providing a structured response in the form of a *response document* that is constructed using the *semantic data model* of a Standard. 
</span></span> **MUST** replace the existing [`Asset`]({% link model/AssetInformationModel/Asset.md %}) and move the [`Asset`]({% link model/AssetInformationModel/Asset.md %}) to the front of the <span class="hoverterm">asset buffer<span class="definition" data-term="asset buffer">*buffer* for *Assets*.</span></span>. 

The number of [`Asset`]({% link model/AssetInformationModel/Asset.md %}) that may be stored in an <span class="hoverterm">agent<span class="definition" data-term="agent">software that collects data published from one or more piece(s) of equipment, organizes that data in a structured manner, and responds to requests for data from client software systems by providing a structured response in the form of a *response document* that is constructed using the *semantic data model* of a Standard. 
</span></span> is defined by the value for [`Header`]({% link model/Fundamentals/MTConnectProtocol/MTConnectErrorsResponseDocument/Header.md %})::`assetBufferSize`. An [`Header`]({% link model/Fundamentals/MTConnectProtocol/MTConnectErrorsResponseDocument/Header.md %})::`assetBufferSize` of 4,294,967,296 or $$ 2^{32 } $$ **MUST** indicate unlimited storage.

The <span class="hoverterm">asset buffer<span class="definition" data-term="asset buffer">*buffer* for *Assets*.</span></span> **MAY** be ephemeral and the [`Asset`]({% link model/AssetInformationModel/Asset.md %}) entities will be lost if the <span class="hoverterm">agent<span class="definition" data-term="agent">software that collects data published from one or more piece(s) of equipment, organizes that data in a structured manner, and responds to requests for data from client software systems by providing a structured response in the form of a *response document* that is constructed using the *semantic data model* of a Standard. 
</span></span> clears the <span class="hoverterm">asset buffer<span class="definition" data-term="asset buffer">*buffer* for *Assets*.</span></span>. They must be recovered from the data source.

`Asset Information Model` provides additional information on <span class="hoverterm">asset<span class="definition" data-term="asset">item, thing or entity that has potential or actual value to an organization. <em>ISO 55000:2014</em>

> Note 1 to entry: Value can be tangible or intangible, financial or non-financial, and includes consideration of risks and liabilities. It can be positive or negative at different stages of the asset life.

> Note 2 to entry: Physical assets usually refer to equipment, inventory and properties owned by the organization. Physical assets are the opposite of intangible assets, which are non-physical assets such as leases, brands, digital assets, use rights, licences, intellectual property rights, reputation or agreements.

> Note 3 to entry: A grouping of assets referred to as an asset system could also be considered as an asset.

</span></span> management. 

## Response Documents

<span class="hoverterm">response documents<span class="definition" data-term="response document">electronic *document* published by an *MTConnect Agent* in response to a *probe request*, *current request*, *sample request* or *asset request*.</span></span> are electronic documents generated by an <span class="hoverterm">agent<span class="definition" data-term="agent">software that collects data published from one or more piece(s) of equipment, organizes that data in a structured manner, and responds to requests for data from client software systems by providing a structured response in the form of a *response document* that is constructed using the *semantic data model* of a Standard. 
</span></span> in response to a <span class="hoverterm">request<span class="definition" data-term="request">communications method where a *client* transmits a message to an *agent*.  That message instructs the *agent* to respond with specific information.</span></span> for data. 

The <span class="hoverterm">response documents<span class="definition" data-term="response document">electronic *document* published by an *MTConnect Agent* in response to a *probe request*, *current request*, *sample request* or *asset request*.</span></span> defined in the MTConnect Standard are:

* <span class="hoverterm">MTConnectDevices Response Document<span class="definition" data-term="MTConnectDevices Response Document">*response document* published by an *MTConnect Agent* in response to a *probe request*.</span></span>: Describes the composition and configuration of the <span class="hoverterm">Device<span class="definition" data-term="Device">*Component* not belonging to any *Component* that may have *assets*</span></span> and the data that can be observed. See `MTConnectDevices Response Document` and `Device Information Model` for details on this information model.

* <span class="hoverterm">MTConnectStreams Response Document<span class="definition" data-term="MTConnectStreams Response Document">*response document* published by an *MTConnect Agent* in response to a *current request* or a *sample request*.</span></span>: <span class="hoverterm">Observations<span class="definition" data-term="Observation">*observation* that provides telemetry data for a *DataItem*.</span></span> made at a point in time about related <span class="hoverterm">DataItems<span class="definition" data-term="DataItem">*observable* observed by a *Component* that may make *Observations*</span></span>. See `MTConnectStreams Response Document` and `Observation Information Model` for details on this information model.

* <span class="hoverterm">MTConnectAssets Response Document<span class="definition" data-term="MTConnectAssets Response Document">*response document* published by an *MTConnect Agent* in response to an *asset request*.</span></span>: <span class="hoverterm">Assets<span class="definition" data-term="Asset">*asset* that is used by the manufacturing process to perform tasks.

> Note 1 to entry: An *Asset* relies upon an *Device* to provide *observations* and information about itself and the *Device* revises the information to reflect changes to the *Asset* during their interaction. Examples of *Assets* are cutting tools, Part Information, Manufacturing Processes, Fixtures, and Files.

> Note 2 to entry: A singular [`Asset`]({% link model/AssetInformationModel/Asset.md %})::`assetId` uniquely identifies an *Asset* throughout its lifecycle and is used to track and relate the *Asset* to other *Devices* and entities.

> Note 3 to entry: *Assets* are temporally associated with a device and can be removed from the device without damage or alteration to its primary functions.

</span></span>  related to <span class="hoverterm">Devices<span class="definition" data-term="Device">*Component* not belonging to any *Component* that may have *assets*</span></span>. See `MTConnectAssets Response Document` and `Asset Information Model` for details on this information model.

* <span class="hoverterm">MTConnectErrors Response Document<span class="definition" data-term="MTConnectErrors Response Document">*response document* published by an *MTConnect Agent* whenever it encounters an error while interpreting an *MTConnect Request*.</span></span>: Information in response to a failed request. See `MTConnectErrors Response Document` for details on this information model.

## Request/Response Information Exchange

The transfer of information between an <span class="hoverterm">agent<span class="definition" data-term="agent">software that collects data published from one or more piece(s) of equipment, organizes that data in a structured manner, and responds to requests for data from client software systems by providing a structured response in the form of a *response document* that is constructed using the *semantic data model* of a Standard. 
</span></span> and a client software application is based on a <span class="hoverterm">request and response<span class="definition" data-term="request and response">communications pattern that supports the transfer of information between an *agent* and a *client*. </span></span> REST protocol. A client application requests specific information from an <span class="hoverterm">agent<span class="definition" data-term="agent">software that collects data published from one or more piece(s) of equipment, organizes that data in a structured manner, and responds to requests for data from client software systems by providing a structured response in the form of a *response document* that is constructed using the *semantic data model* of a Standard. 
</span></span> and an <span class="hoverterm">agent<span class="definition" data-term="agent">software that collects data published from one or more piece(s) of equipment, organizes that data in a structured manner, and responds to requests for data from client software systems by providing a structured response in the form of a *response document* that is constructed using the *semantic data model* of a Standard. 
</span></span> responds with a <span class="hoverterm">response document<span class="definition" data-term="response document">electronic *document* published by an *MTConnect Agent* in response to a *probe request*, *current request*, *sample request* or *asset request*.</span></span>.

There are four types of <span class="hoverterm">MTConnect Requests<span class="definition" data-term="MTConnect Request">*request* for information issued from a *client* to an *MTConnect Agent*.</span></span>. These <span class="hoverterm">requests<span class="definition" data-term="request">communications method where a *client* transmits a message to an *agent*.  That message instructs the *agent* to respond with specific information.</span></span> are as follows:

* <span class="hoverterm">probe request<span class="definition" data-term="probe request">*request* to an *agent* to produce an *MTConnectDevices Response Document* containing the *Device Information Model*.</span></span>: Requests information about one more more <span class="hoverterm">Devices<span class="definition" data-term="Device">*Component* not belonging to any *Component* that may have *assets*</span></span> as an [`MTConnectDevices`]({% link model/Fundamentals/MTConnectProtocol/MTConnectDevicesResponseDocument/MTConnectDevices.md %}) block.

* <span class="hoverterm">current request<span class="definition" data-term="current request">*request* to an *agent* to produce an *MTConnectStreams Response Document* containing the *Observation Information Model* for a snapshot of the latest *observations* at the moment of the *request* or at a given *sequence number*.</span></span>: Requests the most recent, or snapshot at a <span class="hoverterm">sequence number<span class="definition" data-term="sequence number">primary key identifier used to manage and locate a specific piece of *streaming data* in an *agent*.</span></span>, <span class="hoverterm">observations<span class="definition" data-term="observation">observed value of a property at a point in time.</span></span> as an [`MTConnectStreams`]({% link model/Fundamentals/MTConnectProtocol/MTConnectStreamsResponseDocument/MTConnectStreams.md %}) block.

* <span class="hoverterm">sample request<span class="definition" data-term="sample request">*request* to an *agent* to produce an *MTConnectStreams Response Document* containing the *Observation Information Model* for a set of timestamped *observations* made by *Components*.</span></span>: Requests a series of <span class="hoverterm">observations<span class="definition" data-term="observation">observed value of a property at a point in time.</span></span> as an [`MTConnectStreams`]({% link model/Fundamentals/MTConnectProtocol/MTConnectStreamsResponseDocument/MTConnectStreams.md %}) block.

* <span class="hoverterm">asset request<span class="definition" data-term="asset request">*HTTP Request* to the *agent* regarding *Assets*.</span></span>: Requests a set of <span class="hoverterm">assets<span class="definition" data-term="asset">item, thing or entity that has potential or actual value to an organization. <em>ISO 55000:2014</em>

> Note 1 to entry: Value can be tangible or intangible, financial or non-financial, and includes consideration of risks and liabilities. It can be positive or negative at different stages of the asset life.

> Note 2 to entry: Physical assets usually refer to equipment, inventory and properties owned by the organization. Physical assets are the opposite of intangible assets, which are non-physical assets such as leases, brands, digital assets, use rights, licences, intellectual property rights, reputation or agreements.

> Note 3 to entry: A grouping of assets referred to as an asset system could also be considered as an asset.

</span></span> as an [`MTConnectAssets`]({% link model/Fundamentals/MTConnectProtocol/MTConnectAssetsResponseDocument/MTConnectAssets.md %}) block.

If an <span class="hoverterm">agent<span class="definition" data-term="agent">software that collects data published from one or more piece(s) of equipment, organizes that data in a structured manner, and responds to requests for data from client software systems by providing a structured response in the form of a *response document* that is constructed using the *semantic data model* of a Standard. 
</span></span> is unable to respond to the request for information or the request includes invalid information, the <span class="hoverterm">agent<span class="definition" data-term="agent">software that collects data published from one or more piece(s) of equipment, organizes that data in a structured manner, and responds to requests for data from client software systems by providing a structured response in the form of a *response document* that is constructed using the *semantic data model* of a Standard. 
</span></span> will publish an <span class="hoverterm">MTConnectErrors Response Document<span class="definition" data-term="MTConnectErrors Response Document">*response document* published by an *MTConnect Agent* whenever it encounters an error while interpreting an *MTConnect Request*.</span></span>. See `MTConnectErrors`.

See `REST Protocol` for the details on the normative requirements of the agent.

**Fundamentals Appendix**

 

## Fundamentals of Using XML to Encode Response Documents

The MTConnect Standard specifies the structures and constructs that are used to encode <span class="hoverterm">response documents<span class="definition" data-term="response document">electronic *document* published by an *MTConnect Agent* in response to a *probe request*, *current request*, *sample request* or *asset request*.</span></span>.  When these <span class="hoverterm">response documents<span class="definition" data-term="response document">electronic *document* published by an *MTConnect Agent* in response to a *probe request*, *current request*, *sample request* or *asset request*.</span></span> are encoded using XML, there are additional rules defined by the XML standard that apply for creating an XML compliant document.  An implementer should refer to the W3C website for additional information on XML documentation and implementation details - http://www.w3.org/XML.

The following provides specific terms and guidelines referenced in the MTConnect Standard for forming <span class="hoverterm">response documents<span class="definition" data-term="response document">electronic *document* published by an *MTConnect Agent* in response to a *probe request*, *current request*, *sample request* or *asset request*.</span></span> with XML:  


* `tag`:  A `tag` is an XML construct that forms the foundation for an XML expression.  It defines the scope (beginning and end) of an XML expression.  The main types of tags are: 

* `start-tag`:  Designates the beginning on an XML element; e.g., <<span class="hoverterm">element name<span class="definition" data-term="element name">descriptive identifier contained in both the `start-tag` and `end-tag` of an XML element that provides the name of the element.</span></span>> 

* `end-tag`:  Designates the end on an XML element; e.g., </<span class="hoverterm">element name<span class="definition" data-term="element name">descriptive identifier contained in both the `start-tag` and `end-tag` of an XML element that provides the name of the element.</span></span>>. 


> Note: If an element has no <span class="hoverterm">child elements<span class="definition" data-term="child element">*element* of a data modeling structure that illustrates the relationship between itself and the higher-level *parent element* within which it is contained.</span></span> or *CDATA*, the `end-tag` may be shortened to />.


* `Element`:  An element is an XML statement that is the primary building block for a document encoded using XML.  An element begins with a `start-tag` and ends with a matching `end-tag`.  The characters between the `start-tag` and the `end-tag` are the element's content.  The content may contain attributes, *CDATA*, and/or other elements.  If the content contains additional elements, these elements are called <span class="hoverterm">child elements<span class="definition" data-term="child element">*element* of a data modeling structure that illustrates the relationship between itself and the higher-level *parent element* within which it is contained.</span></span>.

An example would be:  <<span class="hoverterm">element name<span class="definition" data-term="element name">descriptive identifier contained in both the `start-tag` and `end-tag` of an XML element that provides the name of the element.</span></span>>Content of the Element</<span class="hoverterm">element name<span class="definition" data-term="element name">descriptive identifier contained in both the `start-tag` and `end-tag` of an XML element that provides the name of the element.</span></span>>.

* <span class="hoverterm">child element<span class="definition" data-term="child element">*element* of a data modeling structure that illustrates the relationship between itself and the higher-level *parent element* within which it is contained.</span></span>:  An XML element that is contained within a higher-level <span class="hoverterm">parent element<span class="definition" data-term="parent element">*element* of a data modeling structure that illustrates the relationship between itself and the lower-level *child element*.</span></span>.  A <span class="hoverterm">child element<span class="definition" data-term="child element">*element* of a data modeling structure that illustrates the relationship between itself and the higher-level *parent element* within which it is contained.</span></span> is also known as a sub-element.  XML allows an unlimited hierarchy of <span class="hoverterm">parent element<span class="definition" data-term="parent element">*element* of a data modeling structure that illustrates the relationship between itself and the lower-level *child element*.</span></span>-<span class="hoverterm">child element<span class="definition" data-term="child element">*element* of a data modeling structure that illustrates the relationship between itself and the higher-level *parent element* within which it is contained.</span></span> relationships that establishes the structure that defines how the various pieces of information in the document relate to each other.  A <span class="hoverterm">parent element<span class="definition" data-term="parent element">*element* of a data modeling structure that illustrates the relationship between itself and the lower-level *child element*.</span></span> may have multiple associated <span class="hoverterm">child elements<span class="definition" data-term="child element">*element* of a data modeling structure that illustrates the relationship between itself and the higher-level *parent element* within which it is contained.</span></span>.

* <span class="hoverterm">element name<span class="definition" data-term="element name">descriptive identifier contained in both the `start-tag` and `end-tag` of an XML element that provides the name of the element.</span></span>:  A descriptive identifier contained in both the `start-tag` and `end-tag` that provides the name of an XML element.

* `Attribute`:  A construct consisting of a name–value pair that provides additional information about that XML element.  The format for an attribute is `name="value"; where the value for the attribute is enclosed in a set of quotation (“) marks.  An XML attribute **MUST** only have a single value and each attribute can appear at most once in each element.  Also, each attribute **MUST** be defined in a <span class="hoverterm">schema<span class="definition" data-term="schema">definition of the structure, rules, and vocabularies used to define the information published in an electronic document.</span></span> to either be required or optional.   

* An example of attributes for an XML element is example-of-attributes-for-an-element:

~~~~xml
<DataItem category="SAMPLE" id="S1load"
  nativeUnits="PERCENT"  type="LOAD"
  units="PERCENT"/>
~~~~
{: caption="Example of attributes for an element"}

In this example, [`DataItem`]({% link model/DeviceInformationModel/DataItems/DataItem.md %}) is the <span class="hoverterm">element name<span class="definition" data-term="element name">descriptive identifier contained in both the `start-tag` and `end-tag` of an XML element that provides the name of the element.</span></span>.  `category`, `id`, `nativeUnits`, `type`, and `units` are the names of the attributes.  “`SAMPLE`", “`S1load`", “`PERCENT`", “`LOAD`", and “`PERCENT`" are the values for each of the respective attributes.

* *CDATA*:  *CDATA* is an XML term representing *Character Data*. *Character Data* contains a value(s) or text that is associated with an XML element.  *CDATA* can be restricted to certain formats, patterns, or words.  

An example of *CDATA* associated with an XML element would be example-of-cdata-associated-with-element:

~~~~xml
<Message id="M1">This is some text</Message>
~~~~
{: caption="Example of cdata associated with element"}

In this example, `Message` is the <span class="hoverterm">element name<span class="definition" data-term="element name">descriptive identifier contained in both the `start-tag` and `end-tag` of an XML element that provides the name of the element.</span></span> and `This is some text` is the *CDATA*.

* <span class="hoverterm">namespace<span class="definition" data-term="namespace">organizes information into logical groups.</span></span>:  An XML <span class="hoverterm">namespace<span class="definition" data-term="namespace">organizes information into logical groups.</span></span> defines a unique vocabulary for named elements and attributes in an XML document.  An XML document may contain content that is associated with multiple <span class="hoverterm">namespaces<span class="definition" data-term="namespace">organizes information into logical groups.</span></span>.  Each <span class="hoverterm">namespace<span class="definition" data-term="namespace">organizes information into logical groups.</span></span> has its own unique identifier. 

Elements and attributes are associated with a specific <span class="hoverterm">namespace<span class="definition" data-term="namespace">organizes information into logical groups.</span></span> by placing a prefix on the name of the element or attribute that associates that name to a specific <span class="hoverterm">namespace<span class="definition" data-term="namespace">organizes information into logical groups.</span></span>; e.g., `x:MyTarget` associates the element name `MyTarget` with the <span class="hoverterm">namespace<span class="definition" data-term="namespace">organizes information into logical groups.</span></span> designated by `x:` (the prefix).

<span class="hoverterm">namespaces<span class="definition" data-term="namespace">organizes information into logical groups.</span></span> are used to avoid naming conflicts within an XML document.  The naming convention used for elements and attributes may be associated with either the default <span class="hoverterm">namespace<span class="definition" data-term="namespace">organizes information into logical groups.</span></span> specified in the header of an XML document or they may be associated with one or more alternate <span class="hoverterm">namespaces<span class="definition" data-term="namespace">organizes information into logical groups.</span></span>.  All elements or attributes associated with a <span class="hoverterm">namespace<span class="definition" data-term="namespace">organizes information into logical groups.</span></span> that is not the default <span class="hoverterm">namespace<span class="definition" data-term="namespace">organizes information into logical groups.</span></span>, must include a prefix (e.g., x:) as part of the name of the element or attribute to associate it with the proper <span class="hoverterm">namespace<span class="definition" data-term="namespace">organizes information into logical groups.</span></span>.  See *Section Schema and Namespace Declaration Information* for details on the structure for XML headers.

The names of the elements and attributes declared in a <span class="hoverterm">namespace<span class="definition" data-term="namespace">organizes information into logical groups.</span></span> may be identified with a different prefix than the prefix that signifies that specific <span class="hoverterm">namespace<span class="definition" data-term="namespace">organizes information into logical groups.</span></span>.  These prefixes are called <span class="hoverterm">namespace<span class="definition" data-term="namespace">organizes information into logical groups.</span></span> aliases.  As an example, MTConnect Standard specific <span class="hoverterm">namespaces<span class="definition" data-term="namespace">organizes information into logical groups.</span></span> are designated as `m:` and the names of the elements and attributes defined in that <span class="hoverterm">namespace<span class="definition" data-term="namespace">organizes information into logical groups.</span></span> have an alias prefix of `mt:` which designates these names as MTConnect Standard specific vocabulary; e.g., `mt:MTConnectDevices`. 


XML documents are encoded with a hierarchy of elements.  In general, XML elements may contain <span class="hoverterm">child elements<span class="definition" data-term="child element">*element* of a data modeling structure that illustrates the relationship between itself and the higher-level *parent element* within which it is contained.</span></span>, *CDATA*, or both.  However, in the MTConnect Standard, an element **MUST NOT** contain mixed content; meaning it cannot contain both <span class="hoverterm">child elements<span class="definition" data-term="child element">*element* of a data modeling structure that illustrates the relationship between itself and the higher-level *parent element* within which it is contained.</span></span> and *CDATA*. 

The <span class="hoverterm">semantic data model<span class="definition" data-term="semantic data model">methodology for defining the structure and meaning for data in a specific logical way that can be interpreted by a software system. </span></span> defined for each <span class="hoverterm">response document<span class="definition" data-term="response document">electronic *document* published by an *MTConnect Agent* in response to a *probe request*, *current request*, *sample request* or *asset request*.</span></span> specifies the elements and <span class="hoverterm">child elements<span class="definition" data-term="child element">*element* of a data modeling structure that illustrates the relationship between itself and the higher-level *parent element* within which it is contained.</span></span> that may appear in a document.  The <span class="hoverterm">semantic data model<span class="definition" data-term="semantic data model">methodology for defining the structure and meaning for data in a specific logical way that can be interpreted by a software system. </span></span> also defines the number of times each element and <span class="hoverterm">child element<span class="definition" data-term="child element">*element* of a data modeling structure that illustrates the relationship between itself and the higher-level *parent element* within which it is contained.</span></span> may appear in the document.

example-of-hierarchy-of-xml-elements demonstrates the hierarchy of XML elements and <span class="hoverterm">child elements<span class="definition" data-term="child element">*element* of a data modeling structure that illustrates the relationship between itself and the higher-level *parent element* within which it is contained.</span></span> used to form an XML document:

~~~~xml
<Root Level>    (Parent Element)
  <First Level>  (Child Element to Root Level and 
  Parent Element to Second Level)
    <Second Level>  (Child Element to First Level
    and Parent Element to Third Level)
      <Third Level name="N1"></Third Level>  
      (Child Element to Second Level)
      <Third Level name="N2"></Third Level>  
      (Child Element to Second Level)
      <Third Level name="N3"></Third Level>  
      (Child Element to Second Level)
    </Second Level>   (end-tag for Second Level)
  </First Level>   (end-tag for First Level)
</Root Level>   (end-tag for Root Level)
~~~~
{: caption="Example of hierarchy of XML elements"}


In the example-of-hierarchy-of-xml-elements, *Root Level* and *First Level* have one <span class="hoverterm">child element<span class="definition" data-term="child element">*element* of a data modeling structure that illustrates the relationship between itself and the higher-level *parent element* within which it is contained.</span></span> (sub-elements) each and Second Level has three <span class="hoverterm">child elements<span class="definition" data-term="child element">*element* of a data modeling structure that illustrates the relationship between itself and the higher-level *parent element* within which it is contained.</span></span>; each called *Third Level*.  Each *Third Level* element has a different name attribute.  Each level in the structure is an element and each lower level element is a <span class="hoverterm">child element<span class="definition" data-term="child element">*element* of a data modeling structure that illustrates the relationship between itself and the higher-level *parent element* within which it is contained.</span></span>.



## Schema and Namespace Declaration Information

There are four pseudo-attributes typically included in the header of a <span class="hoverterm">response document<span class="definition" data-term="response document">electronic *document* published by an *MTConnect Agent* in response to a *probe request*, *current request*, *sample request* or *asset request*.</span></span> that declare the <span class="hoverterm">schema<span class="definition" data-term="schema">definition of the structure, rules, and vocabularies used to define the information published in an electronic document.</span></span> and <span class="hoverterm">namespace<span class="definition" data-term="namespace">organizes information into logical groups.</span></span> for the document.  Each of these pseudo-attributes provides specific information for a client software application to properly interpret the content of the <span class="hoverterm">response document<span class="definition" data-term="response document">electronic *document* published by an *MTConnect Agent* in response to a *probe request*, *current request*, *sample request* or *asset request*.</span></span>.

The pseudo-attributes include:

* `xmlns:xsi` – The `xsi` portion of this attribute name stands for <span class="hoverterm">XML Schema<span class="definition" data-term="XML Schema">*schema* defining a specific document encoded in XML.
</span></span> instance.  An <span class="hoverterm">XML Schema<span class="definition" data-term="XML Schema">*schema* defining a specific document encoded in XML.
</span></span> instance provides information that may be used by a software application to interpret XML specific information within a document.  See the W3C website for more details on `xmlns:xsi`.

* `xmlns` – Declares the default <span class="hoverterm">namespace<span class="definition" data-term="namespace">organizes information into logical groups.</span></span> associated with the content of the <span class="hoverterm">response document<span class="definition" data-term="response document">electronic *document* published by an *MTConnect Agent* in response to a *probe request*, *current request*, *sample request* or *asset request*.</span></span>.  The default <span class="hoverterm">namespace<span class="definition" data-term="namespace">organizes information into logical groups.</span></span> is considered to apply to all elements and attributes whenever the name of the element or attribute does not contain a prefix identifying an alternate <span class="hoverterm">namespace<span class="definition" data-term="namespace">organizes information into logical groups.</span></span>.

The value of this attribute is an URN identifying the name of the file that defines the details of the <span class="hoverterm">namespace<span class="definition" data-term="namespace">organizes information into logical groups.</span></span> content.  This URN provides a unique identify for the <span class="hoverterm">namespace<span class="definition" data-term="namespace">organizes information into logical groups.</span></span>.

* `xmlns:m` – Declares the MTConnect specific <span class="hoverterm">namespace<span class="definition" data-term="namespace">organizes information into logical groups.</span></span> associated with the content of the <span class="hoverterm">response document<span class="definition" data-term="response document">electronic *document* published by an *MTConnect Agent* in response to a *probe request*, *current request*, *sample request* or *asset request*.</span></span>.  There may be multiple <span class="hoverterm">namespaces<span class="definition" data-term="namespace">organizes information into logical groups.</span></span> declared for an XML document.  Each may be associated to the default <span class="hoverterm">namespace<span class="definition" data-term="namespace">organizes information into logical groups.</span></span> or it may be totally independent.  The `:m` designates that this is a specific MTConnect <span class="hoverterm">namespace<span class="definition" data-term="namespace">organizes information into logical groups.</span></span> which is directly associated with the default <span class="hoverterm">namespace<span class="definition" data-term="namespace">organizes information into logical groups.</span></span>.

 
> Note:	See *Section Extensibility* for details regarding extended <span class="hoverterm">namespaces<span class="definition" data-term="namespace">organizes information into logical groups.</span></span>.


The value associated with this attribute is an URN identifying the name of the file that defines the details of the <span class="hoverterm">namespace<span class="definition" data-term="namespace">organizes information into logical groups.</span></span> content.

* `xsi:schemaLocation` -  Declares the name for the <span class="hoverterm">schema<span class="definition" data-term="schema">definition of the structure, rules, and vocabularies used to define the information published in an electronic document.</span></span> associated with the <span class="hoverterm">response document<span class="definition" data-term="response document">electronic *document* published by an *MTConnect Agent* in response to a *probe request*, *current request*, *sample request* or *asset request*.</span></span> and the location of the file that contains the details of the <span class="hoverterm">schema<span class="definition" data-term="schema">definition of the structure, rules, and vocabularies used to define the information published in an electronic document.</span></span> for that document.

The value associated with this attribute has two parts:

  * A URN identifying the name of the specific <span class="hoverterm">XML Schema<span class="definition" data-term="XML Schema">*schema* defining a specific document encoded in XML.
</span></span> instance associated with the <span class="hoverterm">response document<span class="definition" data-term="response document">electronic *document* published by an *MTConnect Agent* in response to a *probe request*, *current request*, *sample request* or *asset request*.</span></span>.

  * The path to the location where the file describing the specific <span class="hoverterm">XML Schema<span class="definition" data-term="XML Schema">*schema* defining a specific document encoded in XML.
</span></span> instance is located.  If the file is located in the same root directory where the <span class="hoverterm">agent<span class="definition" data-term="agent">software that collects data published from one or more piece(s) of equipment, organizes that data in a structured manner, and responds to requests for data from client software systems by providing a structured response in the form of a *response document* that is constructed using the *semantic data model* of a Standard. 
</span></span> is installed, then the local path MAY be declared.  Otherwise, a fully qualified URL must be declared to identify the location of the file.


> Note:	In the format of the value associated with `xsi:schemaLocation`, the URN and the path to the <span class="hoverterm">schema<span class="definition" data-term="schema">definition of the structure, rules, and vocabularies used to define the information published in an electronic document.</span></span> file **MUST** be separated by a “space”.


In example-of-schema-and-namespace-declaration, the first line is the XML declaration.  The second line is a <span class="hoverterm">root element<span class="definition" data-term="root element">first *structural element* provided in a *response document* encoded using XML. </span></span> called `MTConnectDevices`.  The remaining four lines are the pseudo-attributes of `MTCconnectDevices` that declare the XML <span class="hoverterm">schema<span class="definition" data-term="schema">definition of the structure, rules, and vocabularies used to define the information published in an electronic document.</span></span> and <span class="hoverterm">namespace<span class="definition" data-term="namespace">organizes information into logical groups.</span></span> associated with an <span class="hoverterm">MTConnectDevices Response Document<span class="definition" data-term="MTConnectDevices Response Document">*response document* published by an *MTConnect Agent* in response to a *probe request*.</span></span>.

~~~~xml
<?xml version="1.0" encoding="UTF-8"?>
  <MTConnectDevices
   xmlns:xsi=http://www.w3.org/2001/XMLSchema-instance
   xmlns="urn:mtconnect.org:MTConnectDevices:1.3"
   xmlns:m="urn:mtconnect.org:MTConnectDevices:1.3"
   xsi:schemaLocation="urn:mtconnect.org:
    MTConnectDevices:1.3 /schemas/MTConnectDevices\_1.3.xsd">
~~~~
{: caption="Example of schema and namespace declaration"}

The format for the values provided for each of the pseudo-attributes **MUST** reference the <span class="hoverterm">semantic data model<span class="definition" data-term="semantic data model">methodology for defining the structure and meaning for data in a specific logical way that can be interpreted by a software system. </span></span> (e.g., `MTConnectDevices`, `MTConnectStreams`, `MTConnectAssets`, or `MTConnectError`) and the version (i.e.; `1.1`, `1.2`, `1.3`, etc.) of the MTConnect Standard that depict the <span class="hoverterm">schema<span class="definition" data-term="schema">definition of the structure, rules, and vocabularies used to define the information published in an electronic document.</span></span> and <span class="hoverterm">namespace<span class="definition" data-term="namespace">organizes information into logical groups.</span></span>(s) associated with a specific <span class="hoverterm">response document<span class="definition" data-term="response document">electronic *document* published by an *MTConnect Agent* in response to a *probe request*, *current request*, *sample request* or *asset request*.</span></span>.

When an implementer chooses to extend an MTConnect <span class="hoverterm">data model<span class="definition" data-term="data model">organizes elements of data and standardizes how they relate to one another and to the properties of real-world entities.</span></span> by adding custom data types or additional <span class="hoverterm">structural elements<span class="definition" data-term="structural element">*element* that organizes information that represents the physical and logical parts and sub-parts of a piece of equipment.</span></span>, the <span class="hoverterm">schema<span class="definition" data-term="schema">definition of the structure, rules, and vocabularies used to define the information published in an electronic document.</span></span> and <span class="hoverterm">namespace<span class="definition" data-term="namespace">organizes information into logical groups.</span></span> for that <span class="hoverterm">data model<span class="definition" data-term="data model">organizes elements of data and standardizes how they relate to one another and to the properties of real-world entities.</span></span> should be updated to reflect the additional content.  When this is done, the <span class="hoverterm">namespace<span class="definition" data-term="namespace">organizes information into logical groups.</span></span> and <span class="hoverterm">schema<span class="definition" data-term="schema">definition of the structure, rules, and vocabularies used to define the information published in an electronic document.</span></span> information in the header should be updated to reflect the URI for the extended <span class="hoverterm">namespace<span class="definition" data-term="namespace">organizes information into logical groups.</span></span> and <span class="hoverterm">schema<span class="definition" data-term="schema">definition of the structure, rules, and vocabularies used to define the information published in an electronic document.</span></span>. 



## Extensibility

MTConnect is an extensible standard, which means that implementers **MAY** extend the <span class="hoverterm">data models<span class="definition" data-term="data model">organizes elements of data and standardizes how they relate to one another and to the properties of real-world entities.</span></span> defined in the various sections of the MTConnect Standard to include information required for a specific implementation.  When these <span class="hoverterm">data models<span class="definition" data-term="data model">organizes elements of data and standardizes how they relate to one another and to the properties of real-world entities.</span></span> are encoded using XML, the methods for extending these <span class="hoverterm">data models<span class="definition" data-term="data model">organizes elements of data and standardizes how they relate to one another and to the properties of real-world entities.</span></span> are defined by the rules established for extending any XML schema (see the W3C website for more details on extending XML data models).

The following are typical extensions that **MAY** be considered in the MTConnect <span class="hoverterm">data models<span class="definition" data-term="data model">organizes elements of data and standardizes how they relate to one another and to the properties of real-world entities.</span></span>:

* Additional `type` and `subtype` values for <span class="hoverterm">DataItems<span class="definition" data-term="DataItem">*observable* observed by a *Component* that may make *Observations*</span></span>.

* Additional <span class="hoverterm">structural elements<span class="definition" data-term="structural element">*element* that organizes information that represents the physical and logical parts and sub-parts of a piece of equipment.</span></span> as containers.

* Additional [`Composition`]({% link model/DeviceInformationModel/Compositions/Composition.md %}) elements.

* New [`Asset`]({% link model/AssetInformationModel/Asset.md %}) types that are sub-typed from the abstract [`Asset`]({% link model/AssetInformationModel/Asset.md %}) type.

* <span class="hoverterm">child elements<span class="definition" data-term="child element">*element* of a data modeling structure that illustrates the relationship between itself and the higher-level *parent element* within which it is contained.</span></span> that may be added to specific XML elements contained within the <span class="hoverterm">MTConnect Information Models<span class="definition" data-term="MTConnect Information Model">*information model* that defines the semantics of the MTConnect Standard.</span></span>.  These extended elements **MUST** be identified in a separate <span class="hoverterm">namespace<span class="definition" data-term="namespace">organizes information into logical groups.</span></span>.


When extending an MTConnect <span class="hoverterm">data model<span class="definition" data-term="data model">organizes elements of data and standardizes how they relate to one another and to the properties of real-world entities.</span></span>, there are some basic rules restricting changes to the MTConnect <span class="hoverterm">data models<span class="definition" data-term="data model">organizes elements of data and standardizes how they relate to one another and to the properties of real-world entities.</span></span>.

When extending an MTConnect <span class="hoverterm">data model<span class="definition" data-term="data model">organizes elements of data and standardizes how they relate to one another and to the properties of real-world entities.</span></span>, an implementer:

* **MUST NOT** add new value for category for <span class="hoverterm">DataItems<span class="definition" data-term="DataItem">*observable* observed by a *Component* that may make *Observations*</span></span>,

* **MUST NOT** add new <span class="hoverterm">root elements<span class="definition" data-term="root element">first *structural element* provided in a *response document* encoded using XML. </span></span>,

* **SHOULD NOT** add new <span class="hoverterm">top level<span class="definition" data-term="top level">element that represents the most significant physical or logical functions of a piece of equipment.</span></span> <span class="hoverterm">Components<span class="definition" data-term="Component">*engineered system*  part of a *Device* composed of zero or more *Components*</span></span>, and

* **MUST NOT** add any new attributes or include any sub-elements to [`Composition`]({% link model/DeviceInformationModel/Compositions/Composition.md %}).

> Note:  Throughout the documents additional information is provided where extensibility may be acceptable or unacceptable to maintain compliance with the MTConnect Standard.

When a <span class="hoverterm">schema<span class="definition" data-term="schema">definition of the structure, rules, and vocabularies used to define the information published in an electronic document.</span></span> representing a <span class="hoverterm">data model<span class="definition" data-term="data model">organizes elements of data and standardizes how they relate to one another and to the properties of real-world entities.</span></span> is extended, the <span class="hoverterm">schema<span class="definition" data-term="schema">definition of the structure, rules, and vocabularies used to define the information published in an electronic document.</span></span> and <span class="hoverterm">namespace<span class="definition" data-term="namespace">organizes information into logical groups.</span></span> declaration at the beginning of the corresponding <span class="hoverterm">response document<span class="definition" data-term="response document">electronic *document* published by an *MTConnect Agent* in response to a *probe request*, *current request*, *sample request* or *asset request*.</span></span> **MUST** be updated to reflect the new <span class="hoverterm">schema<span class="definition" data-term="schema">definition of the structure, rules, and vocabularies used to define the information published in an electronic document.</span></span> and <span class="hoverterm">namespace<span class="definition" data-term="namespace">organizes information into logical groups.</span></span> so that a client software application can properly validate the <span class="hoverterm">response document<span class="definition" data-term="response document">electronic *document* published by an *MTConnect Agent* in response to a *probe request*, *current request*, *sample request* or *asset request*.</span></span>.

An XML example of a <span class="hoverterm">schema<span class="definition" data-term="schema">definition of the structure, rules, and vocabularies used to define the information published in an electronic document.</span></span> and <span class="hoverterm">namespace<span class="definition" data-term="namespace">organizes information into logical groups.</span></span> declaration, including an extended <span class="hoverterm">schema<span class="definition" data-term="schema">definition of the structure, rules, and vocabularies used to define the information published in an electronic document.</span></span> and <span class="hoverterm">namespace<span class="definition" data-term="namespace">organizes information into logical groups.</span></span>, is shown in example-of-extended-schema-and-namespace-in-declaration:

~~~~xml
<?xml version="1.0" encoding="UTF-8"?>
  <MTConnectDevices
   xmlns:xsi=http://www.w3.org/2001/XMLSchema-instance
   xmlns="urn:mtconnect.org:MTConnectDevices:1.3"
   xmlns:m="urn:mtconnect.org:MTConnectDevices:1.3"
   xmlns:x="urn:MyLocation:MyFile:MyVersion"
   xsi:schemaLocation="urn:MyLocation:MyFile:MyVersion
     /schemas/MyFileName.xsd" />
~~~~
{: caption="Example of extended schema and namespace in declaration"}

In this example:

* `xmlns:x` is added in Line 6 to identify the <span class="hoverterm">XML Schema<span class="definition" data-term="XML Schema">*schema* defining a specific document encoded in XML.
</span></span> instance for the extended <span class="hoverterm">schema<span class="definition" data-term="schema">definition of the structure, rules, and vocabularies used to define the information published in an electronic document.</span></span>.   <span class="hoverterm">element names<span class="definition" data-term="element name">descriptive identifier contained in both the `start-tag` and `end-tag` of an XML element that provides the name of the element.</span></span> identified with an "`x`" prefix are associated with this specific <span class="hoverterm">XML Schema<span class="definition" data-term="XML Schema">*schema* defining a specific document encoded in XML.
</span></span> instance.

> Note: The "`x`" prefix **MAY** be replaced with any prefix that the implementer chooses for identifying the extended <span class="hoverterm">schema<span class="definition" data-term="schema">definition of the structure, rules, and vocabularies used to define the information published in an electronic document.</span></span> and <span class="hoverterm">namespace<span class="definition" data-term="namespace">organizes information into logical groups.</span></span>.

* `xsi:schemaLocation` is modified in Line 7 to associate the <span class="hoverterm">namespace<span class="definition" data-term="namespace">organizes information into logical groups.</span></span> URN with the URL specifying the location of <span class="hoverterm">schema<span class="definition" data-term="schema">definition of the structure, rules, and vocabularies used to define the information published in an electronic document.</span></span> file.

* `MyLocation`, `MyFile`, `MyVersion`, and `MyFileName` in Lines 6 and 7 **MUST** be replaced by the actual name, version, and location of the extended <span class="hoverterm">schema<span class="definition" data-term="schema">definition of the structure, rules, and vocabularies used to define the information published in an electronic document.</span></span>.

When an extended <span class="hoverterm">schema<span class="definition" data-term="schema">definition of the structure, rules, and vocabularies used to define the information published in an electronic document.</span></span> is implemented, each <span class="hoverterm">structural element<span class="definition" data-term="structural element">*element* that organizes information that represents the physical and logical parts and sub-parts of a piece of equipment.</span></span>, <span class="hoverterm">DataItem<span class="definition" data-term="DataItem">*observable* observed by a *Component* that may make *Observations*</span></span>, and <span class="hoverterm">asset<span class="definition" data-term="asset">item, thing or entity that has potential or actual value to an organization. <em>ISO 55000:2014</em>

> Note 1 to entry: Value can be tangible or intangible, financial or non-financial, and includes consideration of risks and liabilities. It can be positive or negative at different stages of the asset life.

> Note 2 to entry: Physical assets usually refer to equipment, inventory and properties owned by the organization. Physical assets are the opposite of intangible assets, which are non-physical assets such as leases, brands, digital assets, use rights, licences, intellectual property rights, reputation or agreements.

> Note 3 to entry: A grouping of assets referred to as an asset system could also be considered as an asset.

</span></span> defined in the extended <span class="hoverterm">schema<span class="definition" data-term="schema">definition of the structure, rules, and vocabularies used to define the information published in an electronic document.</span></span> **MUST** be identified in each respective <span class="hoverterm">response document<span class="definition" data-term="response document">electronic *document* published by an *MTConnect Agent* in response to a *probe request*, *current request*, *sample request* or *asset request*.</span></span> by adding a prefix to the XML <span class="hoverterm">element name<span class="definition" data-term="element name">descriptive identifier contained in both the `start-tag` and `end-tag` of an XML element that provides the name of the element.</span></span> associated with that <span class="hoverterm">structural element<span class="definition" data-term="structural element">*element* that organizes information that represents the physical and logical parts and sub-parts of a piece of equipment.</span></span>, <span class="hoverterm">DataItem<span class="definition" data-term="DataItem">*observable* observed by a *Component* that may make *Observations*</span></span>, or <span class="hoverterm">asset<span class="definition" data-term="asset">item, thing or entity that has potential or actual value to an organization. <em>ISO 55000:2014</em>

> Note 1 to entry: Value can be tangible or intangible, financial or non-financial, and includes consideration of risks and liabilities. It can be positive or negative at different stages of the asset life.

> Note 2 to entry: Physical assets usually refer to equipment, inventory and properties owned by the organization. Physical assets are the opposite of intangible assets, which are non-physical assets such as leases, brands, digital assets, use rights, licences, intellectual property rights, reputation or agreements.

> Note 3 to entry: A grouping of assets referred to as an asset system could also be considered as an asset.

</span></span>.  The prefix identifies the <span class="hoverterm">schema<span class="definition" data-term="schema">definition of the structure, rules, and vocabularies used to define the information published in an electronic document.</span></span> and <span class="hoverterm">namespace<span class="definition" data-term="namespace">organizes information into logical groups.</span></span> where that XML Element is defined. 

