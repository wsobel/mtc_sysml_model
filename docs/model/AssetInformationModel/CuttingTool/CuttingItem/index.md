---
title: "Cutting Item Package"
parent: "Cutting Tool Package"
grand_parent: "Asset Information Model Package"
nav_order: 1
has_children: true
layout: default
---

# Cutting Item Package

A [`CuttingItem`]({% link model/AssetInformationModel/CuttingTool/CuttingItem/CuttingItem.md %}) is the portion of the tool that physically removes the material from the workpiece by shear deformation. The cutting item can be either a single piece of material attached to the [`CuttingTool`]({% link model/AssetInformationModel/CuttingTool/CuttingTool.md %}) or it can be one or more separate pieces of material attached to the [`CuttingTool`]({% link model/AssetInformationModel/CuttingTool/CuttingTool.md %}) using a permanent or removable attachment.  A [`CuttingItem`]({% link model/AssetInformationModel/CuttingTool/CuttingItem/CuttingItem.md %}) can be comprised of one or more cutting edges. Cutting items include: replaceable inserts, brazed tips and the cutting portions of solid `CuttingTools`.

MTConnect Standard considers [`CuttingItems`]({% link model/AssetInformationModel/CuttingTool/CuttingItem/CuttingItems.md %}) as part of the [`CuttingTool`]({% link model/AssetInformationModel/CuttingTool/CuttingTool.md %}).  A [`CuttingItems`]({% link model/AssetInformationModel/CuttingTool/CuttingItem/CuttingItems.md %}) **MUST NOT** exist in MTConnect unless it is attached to a [`CuttingTool`]({% link model/AssetInformationModel/CuttingTool/CuttingTool.md %}).  Some of the measurements, such as [`FunctionalLength`]({% link model/AssetInformationModel/CuttingTool/CuttingToolMeasurementSubtypes/FunctionalLength.md %}), **MUST** be made with reference to the entire [`CuttingTool`]({% link model/AssetInformationModel/CuttingTool/CuttingTool.md %}) to be meaningful.

![CuttingItem]({% link figures/mtconnect.png %} "CuttingItem"){: width="80.0%"}

> Note: See *Section CuttingItem Schema Diagrams* for XML schema.
