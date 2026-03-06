---
title: "Files Package"
parent: "Asset Information Model Package"
nav_order: 3
has_children: true
layout: default
---

# Files Package

This section provides semantic information for the [`File`]({% link model/AssetInformationModel/Files/File.md %}) model.

![Files]({% link figures/mtconnect.png %} "Files"){: width="80.0%"}

> Note: See *Section File Schema Diagrams* for XML schema.


**Files Asset Information Model**

Manufacturing processes require various documents, programs, setup sheets, and digital media available at the device for a given process. The [`File`]({% link model/AssetInformationModel/Files/File.md %}) and [`FileArchetype`]({% link model/AssetInformationModel/Files/FileArchetype.md %}) [`Asset`]({% link model/AssetInformationModel/Asset.md %})s provide a mechanism to communicate specific "Files" that are relevant to a process where the media is located on a server and represented by a Universal Resource Locator (URL).

The [`FileArchetype`]({% link model/AssetInformationModel/Files/FileArchetype.md %}) contains metadata common to all [`File`]({% link model/AssetInformationModel/Files/File.md %}) [`Asset`]({% link model/AssetInformationModel/Asset.md %})s for a certain purpose. The [`File`]({% link model/AssetInformationModel/Files/File.md %}) [`Asset`]({% link model/AssetInformationModel/Asset.md %}) references the file specific to a given device or set of devices. The [`File`]({% link model/AssetInformationModel/Files/File.md %}) [`Asset`]({% link model/AssetInformationModel/Asset.md %}) does not hold the contents of the file, it contains a reference to the location (URL) used to access the information. The metadata associated with the [`File`]({% link model/AssetInformationModel/Files/File.md %}) provides semantic information about the representation (mime-type) and the application associated with the [`File`]({% link model/AssetInformationModel/Files/File.md %}). The application of the file is an extensible controlled vocabulary with common manufacturing uses provided.
