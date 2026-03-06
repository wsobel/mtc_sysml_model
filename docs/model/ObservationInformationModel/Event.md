---
title: "Event"
parent: "Observation Information Model Package"
nav_order: 9
layout: default
---

# Event

**Supertype:** `Observation`
## Version Info

{: .auto-width }
| Introduced | Deprecated | Updated |"
|---|---|---|
| 1.0 |  |   |

[`Observation`]({% link model/ReferenceAgentArchitecture/InformationModel/Observation.md %}) that is a discrete piece of information from a piece of equipment.

### Description


It provides the information and data reported from a piece of equipment for those [`DataItem`]({% link model/DeviceInformationModel/DataItems/DataItem.md %}) entities defined with [`DataItem`]({% link model/DeviceInformationModel/DataItems/DataItem.md %})::`category` as `EVENT` in the <span class="hoverterm">MTConnectDevices Response Document<span class="definition" data-term="MTConnectDevices Response Document">*response document* published by an *MTConnect Agent* in response to a *probe request*.</span></span>.

*Figure Event Example* shows [`Event`]({% link model/DeviceInformationModel/DataItems/DataItemTypes/Event.md %}) type examples. It also shows an example for when the [`Observation`]({% link model/ReferenceAgentArchitecture/InformationModel/Observation.md %})::`result` is not available (`dataItemId`=`d1_asset_rem`).

![Event Example]({% link figures/mtconnect.png %} "Event Example"){: width="80.0%"}

> Note: See event-example for the *XML* representation of the same example.

The following *Section Value Properties of Event* lists the additional and/or updated attributes for [`Event`]({% link model/DeviceInformationModel/DataItems/DataItemTypes/Event.md %}).

## Properties

<table><thead><tr><th>Name</th><th>Type</th><th>Int</th><th>Dep</th><th>Multiplicty</th><th>Description</th></tr></thead><tbody>
<tr><td><code>resetTriggered</code></td><td><a href="{% link model/Profile/DataTypes/ResetTriggeredEnum.md %}"><code>ResetTriggeredEnum</code></a></td><td>1.4</td><td></td><td>0..1</td>
<td markdown="block">

identifies when a reported value has been reset and what has caused that reset to occur for those [`DataItem`]({% link model/DeviceInformationModel/DataItems/DataItem.md %}) entities that may be periodically reset to an initial value.

`resetTriggered` **MUST** only be provided for the specific occurrence of a [`DataItem`]({% link model/DeviceInformationModel/DataItems/DataItem.md %}) reported in the <span class="hoverterm">MTConnectStreams Response Document<span class="definition" data-term="MTConnectStreams Response Document">*response document* published by an *MTConnect Agent* in response to a *current request* or a *sample request*.</span></span> when the reset occurred. 

</td>
</tr>
<tr><td><code>type</code></td><td><a href="{% link model/Profile/DataTypes/EventEnum.md %}"><code>EventEnum</code></a></td><td>1.0</td><td></td><td>1</td>
<td markdown="block">

 

</td>
</tr>
</tbody></table>

## Subclasses

{: .auto-width }
| Name | Int | Dep |
|---|---|---|
| [`ActivationCount`]({% link model/ObservationInformationModel/ObservationTypes/EventTypes/ActivationCount.md %}) | 1.8 |  |
| [`ActiveAxes`]({% link model/ObservationInformationModel/ObservationTypes/EventTypes/ActiveAxes.md %}) | 1.1 |  |
| [`ActivePowerSource`]({% link model/ObservationInformationModel/ObservationTypes/EventTypes/ActivePowerSource.md %}) | 2.3 |  |
| [`ActuatorState`]({% link model/ObservationInformationModel/ObservationTypes/EventTypes/ActuatorState.md %}) | 1.2 |  |
| [`AdapterSoftwareVersion`]({% link model/ObservationInformationModel/ObservationTypes/EventTypes/AdapterSoftwareVersion.md %}) | 1.7 |  |
| [`AdapterURI`]({% link model/ObservationInformationModel/ObservationTypes/EventTypes/AdapterURI.md %}) | 1.7 |  |
| [`Alarm`]({% link model/ObservationInformationModel/ObservationTypes/EventTypes/Alarm.md %}) | 1.0 | 1.1 |
| [`AlarmLimit`]({% link model/ObservationInformationModel/ObservationTypes/EventTypes/AlarmLimit.md %}) | 1.7 | 2.5 |
| [`AlarmLimits`]({% link model/DeviceInformationModel/Configurations/Specifications/AlarmLimits.md %}) | 2.3 |  |
| [`Application`]({% link model/ObservationInformationModel/ObservationTypes/EventTypes/Application.md %}) | 1.6 |  |
| [`AssetAdded`]({% link model/ObservationInformationModel/ObservationTypes/EventTypes/AssetAdded.md %}) | 2.6 |  |
| [`AssetChanged`]({% link model/ObservationInformationModel/ObservationTypes/EventTypes/AssetChanged.md %}) | 1.2 |  |
| [`AssetCount`]({% link model/ObservationInformationModel/ObservationTypes/EventTypes/AssetCount.md %}) | 2.0 |  |
| [`AssetRemoved`]({% link model/ObservationInformationModel/ObservationTypes/EventTypes/AssetRemoved.md %}) | 1.3 |  |
| [`AssociatedAssetId`]({% link model/ObservationInformationModel/ObservationTypes/EventTypes/AssociatedAssetId.md %}) | 2.6 |  |
| [`Availability`]({% link model/ObservationInformationModel/ObservationTypes/EventTypes/Availability.md %}) | 1.1 |  |
| [`AxisCoupling`]({% link model/ObservationInformationModel/ObservationTypes/EventTypes/AxisCoupling.md %}) | 1.1 |  |
| [`AxisFeedrateOverride`]({% link model/ObservationInformationModel/ObservationTypes/EventTypes/AxisFeedrateOverride.md %}) | 1.3 |  |
| [`AxisInterlock`]({% link model/ObservationInformationModel/ObservationTypes/EventTypes/AxisInterlock.md %}) | 1.3 |  |
| [`AxisState`]({% link model/ObservationInformationModel/ObservationTypes/EventTypes/AxisState.md %}) | 1.3 |  |
| [`BatteryState`]({% link model/ObservationInformationModel/ObservationTypes/EventTypes/BatteryState.md %}) | 2.1 |  |
| [`BindingState`]({% link model/ObservationInformationModel/ObservationTypes/EventTypes/BindingState.md %}) | 2.7 |  |
| [`Block`]({% link model/ObservationInformationModel/ObservationTypes/EventTypes/Block.md %}) | 1.0 |  |
| [`BlockCount`]({% link model/ObservationInformationModel/ObservationTypes/EventTypes/BlockCount.md %}) | 1.4 |  |
| [`CharacteristicPersistentId`]({% link model/ObservationInformationModel/ObservationTypes/EventTypes/CharacteristicPersistentId.md %}) | 2.2 |  |
| [`CharacteristicStatus`]({% link model/ObservationInformationModel/ObservationTypes/EventTypes/CharacteristicStatus.md %}) | 2.2 |  |
| [`ChuckInterlock`]({% link model/ObservationInformationModel/ObservationTypes/EventTypes/ChuckInterlock.md %}) | 1.3 |  |
| [`ChuckState`]({% link model/ObservationInformationModel/ObservationTypes/EventTypes/ChuckState.md %}) | 1.3 |  |
| [`ClockTime`]({% link model/ObservationInformationModel/ObservationTypes/EventTypes/ClockTime.md %}) | 1.2 |  |
| [`CloseChuck`]({% link model/InterfaceInteractionModel/DataItemTypesforInterface/CloseChuck.md %}) | 1.3 |  |
| [`CloseDoor`]({% link model/InterfaceInteractionModel/DataItemTypesforInterface/CloseDoor.md %}) | 1.3 |  |
| [`Code`]({% link model/ObservationInformationModel/ObservationTypes/EventTypes/Code.md %}) | 1.0 | 1.1 |
| [`ComponentData`]({% link model/ObservationInformationModel/ObservationTypes/EventTypes/ComponentData.md %}) | 2.2 |  |
| [`CompositionState`]({% link model/ObservationInformationModel/ObservationTypes/EventTypes/CompositionState.md %}) | 1.4 |  |
| [`ConnectionStatus`]({% link model/ObservationInformationModel/ObservationTypes/EventTypes/ConnectionStatus.md %}) | 1.7 |  |
| [`ControlLimit`]({% link model/ObservationInformationModel/ObservationTypes/EventTypes/ControlLimit.md %}) | 1.7 | 2.5 |
| [`ControlLimits`]({% link model/DeviceInformationModel/Configurations/Specifications/ControlLimits.md %}) | 2.3 |  |
| [`ControllerMode`]({% link model/ObservationInformationModel/ObservationTypes/EventTypes/ControllerMode.md %}) | 1.0 |  |
| [`ControllerModeOverride`]({% link model/ObservationInformationModel/ObservationTypes/EventTypes/ControllerModeOverride.md %}) | 1.4 |  |
| [`CoupledAxes`]({% link model/ObservationInformationModel/ObservationTypes/EventTypes/CoupledAxes.md %}) | 1.2 |  |
| [`CycleCount`]({% link model/ObservationInformationModel/ObservationTypes/EventTypes/CycleCount.md %}) | 1.8 |  |
| [`DateCode`]({% link model/ObservationInformationModel/ObservationTypes/EventTypes/DateCode.md %}) | 1.5 |  |
| [`DeactivationCount`]({% link model/ObservationInformationModel/ObservationTypes/EventTypes/DeactivationCount.md %}) | 1.8 |  |
| [`Depth`]({% link model/ObservationInformationModel/ObservationTypes/EventTypes/Depth.md %}) | 2.7 |  |
| [`DeviceAdded`]({% link model/ObservationInformationModel/ObservationTypes/EventTypes/DeviceAdded.md %}) | 1.7 |  |
| [`DeviceChanged`]({% link model/ObservationInformationModel/ObservationTypes/EventTypes/DeviceChanged.md %}) | 1.7 |  |
| [`DeviceRemoved`]({% link model/ObservationInformationModel/ObservationTypes/EventTypes/DeviceRemoved.md %}) | 1.7 |  |
| [`DeviceUuid`]({% link model/ObservationInformationModel/ObservationTypes/EventTypes/DeviceUuid.md %}) | 1.5 |  |
| [`Direction`]({% link model/ObservationInformationModel/ObservationTypes/EventTypes/Direction.md %}) | 1.0 |  |
| [`DoorState`]({% link model/ObservationInformationModel/ObservationTypes/EventTypes/DoorState.md %}) | 1.1 |  |
| [`EmergencyStop`]({% link model/ObservationInformationModel/ObservationTypes/EventTypes/EmergencyStop.md %}) | 1.1 |  |
| [`EndOfBar`]({% link model/ObservationInformationModel/ObservationTypes/EventTypes/EndOfBar.md %}) | 1.3 |  |
| [`EquipmentMode`]({% link model/ObservationInformationModel/ObservationTypes/EventTypes/EquipmentMode.md %}) | 1.4 |  |
| [`Execution`]({% link model/ObservationInformationModel/ObservationTypes/EventTypes/Execution.md %}) | 1.0 |  |
| [`FeatureMeasurement`]({% link model/ObservationInformationModel/ObservationTypes/EventTypes/FeatureMeasurement.md %}) | 2.2 |  |
| [`FeaturePersisitentId`]({% link model/ObservationInformationModel/ObservationTypes/EventTypes/FeaturePersisitentId.md %}) | 2.2 |  |
| [`Firmware`]({% link model/ObservationInformationModel/ObservationTypes/EventTypes/Firmware.md %}) | 1.6 |  |
| [`FixtureAssetId`]({% link model/ObservationInformationModel/ObservationTypes/EventTypes/FixtureAssetId.md %}) | 2.7 |  |
| [`FixtureId`]({% link model/ObservationInformationModel/ObservationTypes/EventTypes/FixtureId.md %}) | 2.0 |  |
| [`FunctionalMode`]({% link model/ObservationInformationModel/ObservationTypes/EventTypes/FunctionalMode.md %}) | 1.3 |  |
| [`Hardness`]({% link model/ObservationInformationModel/ObservationTypes/EventTypes/Hardness.md %}) | 1.4 |  |
| [`Hardware`]({% link model/ObservationInformationModel/ObservationTypes/EventTypes/Hardware.md %}) | 1.6 |  |
| [`HostName`]({% link model/ObservationInformationModel/ObservationTypes/EventTypes/HostName.md %}) | 2.1 |  |
| [`InterfaceState`]({% link model/InterfaceInteractionModel/DataItemTypesforInterface/InterfaceState.md %}) | 1.3 |  |
| [`LeakDetect`]({% link model/ObservationInformationModel/ObservationTypes/EventTypes/LeakDetect.md %}) | 2.1 |  |
| [`Library`]({% link model/ObservationInformationModel/ObservationTypes/EventTypes/Library.md %}) | 1.6 |  |
| [`Line`]({% link model/ObservationInformationModel/ObservationTypes/EventTypes/Line.md %}) | 1.0 | 1.4 |
| [`LineLabel`]({% link model/ObservationInformationModel/ObservationTypes/EventTypes/LineLabel.md %}) | 1.4 |  |
| [`LineNumber`]({% link model/ObservationInformationModel/ObservationTypes/EventTypes/LineNumber.md %}) | 1.4 |  |
| [`LoadCount`]({% link model/ObservationInformationModel/ObservationTypes/EventTypes/LoadCount.md %}) | 1.8 |  |
| [`LocationAddress`]({% link model/ObservationInformationModel/ObservationTypes/EventTypes/LocationAddress.md %}) | 2.3 |  |
| [`LocationNarrative`]({% link model/ObservationInformationModel/ObservationTypes/EventTypes/LocationNarrative.md %}) | 2.4 |  |
| [`LocationSpatialGeographic`]({% link model/ObservationInformationModel/ObservationTypes/EventTypes/LocationSpatialGeographic.md %}) | 2.3 |  |
| [`LockState`]({% link model/ObservationInformationModel/ObservationTypes/EventTypes/LockState.md %}) | 1.8 |  |
| [`MTConnectVersion`]({% link model/ObservationInformationModel/ObservationTypes/EventTypes/MTConnectVersion.md %}) | 1.7 |  |
| [`MaintenanceList`]({% link model/ObservationInformationModel/ObservationTypes/EventTypes/MaintenanceList.md %}) | 2.0 |  |
| [`Material`]({% link model/DeviceInformationModel/Components/ComponentTypes/Material.md %}) | 1.4 |  |
| [`MaterialChange`]({% link model/InterfaceInteractionModel/DataItemTypesforInterface/MaterialChange.md %}) | 1.3 |  |
| [`MaterialFeed`]({% link model/InterfaceInteractionModel/DataItemTypesforInterface/MaterialFeed.md %}) | 1.3 |  |
| [`MaterialLayer`]({% link model/ObservationInformationModel/ObservationTypes/EventTypes/MaterialLayer.md %}) | 1.5 |  |
| [`MaterialLoad`]({% link model/InterfaceInteractionModel/DataItemTypesforInterface/MaterialLoad.md %}) | 1.3 |  |
| [`MaterialRetract`]({% link model/InterfaceInteractionModel/DataItemTypesforInterface/MaterialRetract.md %}) | 1.3 |  |
| [`MaterialUnload`]({% link model/InterfaceInteractionModel/DataItemTypesforInterface/MaterialUnload.md %}) | 1.3 |  |
| [`MeasurementType`]({% link model/ObservationInformationModel/ObservationTypes/EventTypes/MeasurementType.md %}) | 2.2 |  |
| [`MeasurementUnits`]({% link model/ObservationInformationModel/ObservationTypes/EventTypes/MeasurementUnits.md %}) | 2.2 |  |
| [`MeasurementValue`]({% link model/ObservationInformationModel/ObservationTypes/EventTypes/MeasurementValue.md %}) | 2.2 |  |
| [`Message`]({% link model/ObservationInformationModel/ObservationTypes/EventTypes/Message.md %}) | 1.1 |  |
| [`Network`]({% link model/ObservationInformationModel/ObservationTypes/EventTypes/Network.md %}) | 1.6 |  |
| [`NetworkPort`]({% link model/ObservationInformationModel/ObservationTypes/EventTypes/NetworkPort.md %}) | 2.1 |  |
| [`OpenChuck`]({% link model/InterfaceInteractionModel/DataItemTypesforInterface/OpenChuck.md %}) | 1.3 |  |
| [`OpenDoor`]({% link model/InterfaceInteractionModel/DataItemTypesforInterface/OpenDoor.md %}) | 1.3 |  |
| [`OperatingMode`]({% link model/ObservationInformationModel/ObservationTypes/EventTypes/OperatingMode.md %}) | 2.0 |  |
| [`OperatingSystem`]({% link model/ObservationInformationModel/ObservationTypes/EventTypes/OperatingSystem.md %}) | 1.6 |  |
| [`OperatorId`]({% link model/ObservationInformationModel/ObservationTypes/EventTypes/OperatorId.md %}) | 1.3 |  |
| [`PalletId`]({% link model/ObservationInformationModel/ObservationTypes/EventTypes/PalletId.md %}) | 1.2 |  |
| [`PartChange`]({% link model/InterfaceInteractionModel/DataItemTypesforInterface/PartChange.md %}) | 1.3 |  |
| [`PartCount`]({% link model/ObservationInformationModel/ObservationTypes/EventTypes/PartCount.md %}) | 1.0 |  |
| [`PartCountType`]({% link model/ObservationInformationModel/ObservationTypes/EventTypes/PartCountType.md %}) | 2.0 |  |
| [`PartDetect`]({% link model/ObservationInformationModel/ObservationTypes/EventTypes/PartDetect.md %}) | 1.5 |  |
| [`PartGroupId`]({% link model/ObservationInformationModel/ObservationTypes/EventTypes/PartGroupId.md %}) | 1.7 |  |
| [`PartId`]({% link model/ObservationInformationModel/ObservationTypes/EventTypes/PartId.md %}) | 1.1 |  |
| [`PartIndex`]({% link model/ObservationInformationModel/ObservationTypes/EventTypes/PartIndex.md %}) | 2.5 |  |
| [`PartKindId`]({% link model/ObservationInformationModel/ObservationTypes/EventTypes/PartKindId.md %}) | 1.7 |  |
| [`PartNumber`]({% link model/ObservationInformationModel/ObservationTypes/EventTypes/PartNumber.md %}) | 1.4 | 1.7 |
| [`PartProcessingState`]({% link model/ObservationInformationModel/ObservationTypes/EventTypes/PartProcessingState.md %}) | 1.8 |  |
| [`PartStatus`]({% link model/ObservationInformationModel/ObservationTypes/EventTypes/PartStatus.md %}) | 1.7 |  |
| [`PartUniqueId`]({% link model/ObservationInformationModel/ObservationTypes/EventTypes/PartUniqueId.md %}) | 1.7 |  |
| [`PathFeedrateOverride`]({% link model/ObservationInformationModel/ObservationTypes/EventTypes/PathFeedrateOverride.md %}) | 1.3 |  |
| [`PathMode`]({% link model/ObservationInformationModel/ObservationTypes/EventTypes/PathMode.md %}) | 1.1 |  |
| [`PowerState`]({% link model/ObservationInformationModel/ObservationTypes/EventTypes/PowerState.md %}) | 1.1 |  |
| [`PowerStatus`]({% link model/ObservationInformationModel/ObservationTypes/EventTypes/PowerStatus.md %}) | 1.0 | 1.1 |
| [`ProcessAggregateId`]({% link model/ObservationInformationModel/ObservationTypes/EventTypes/ProcessAggregateId.md %}) | 1.7 |  |
| [`ProcessKindId`]({% link model/ObservationInformationModel/ObservationTypes/EventTypes/ProcessKindId.md %}) | 1.7 |  |
| [`ProcessOccurrenceId`]({% link model/ObservationInformationModel/ObservationTypes/EventTypes/ProcessOccurrenceId.md %}) | 1.7 |  |
| [`ProcessState`]({% link model/ObservationInformationModel/ObservationTypes/EventTypes/ProcessState.md %}) | 1.8 |  |
| [`ProcessTime`]({% link model/ObservationInformationModel/ObservationTypes/EventTypes/ProcessTime.md %}) | 1.5 |  |
| [`Program`]({% link model/ObservationInformationModel/ObservationTypes/EventTypes/Program.md %}) | 1.0 |  |
| [`ProgramComment`]({% link model/ObservationInformationModel/ObservationTypes/EventTypes/ProgramComment.md %}) | 1.3 |  |
| [`ProgramEdit`]({% link model/ObservationInformationModel/ObservationTypes/EventTypes/ProgramEdit.md %}) | 1.3 |  |
| [`ProgramEditName`]({% link model/ObservationInformationModel/ObservationTypes/EventTypes/ProgramEditName.md %}) | 1.3 |  |
| [`ProgramHeader`]({% link model/ObservationInformationModel/ObservationTypes/EventTypes/ProgramHeader.md %}) | 1.3 |  |
| [`ProgramLocation`]({% link model/ObservationInformationModel/ObservationTypes/EventTypes/ProgramLocation.md %}) | 1.5 |  |
| [`ProgramLocationType`]({% link model/ObservationInformationModel/ObservationTypes/EventTypes/ProgramLocationType.md %}) | 1.5 |  |
| [`ProgramNestLevel`]({% link model/ObservationInformationModel/ObservationTypes/EventTypes/ProgramNestLevel.md %}) | 1.5 |  |
| [`RotaryMode`]({% link model/ObservationInformationModel/ObservationTypes/EventTypes/RotaryMode.md %}) | 1.1 |  |
| [`RotaryVelocityOverride`]({% link model/ObservationInformationModel/ObservationTypes/EventTypes/RotaryVelocityOverride.md %}) | 1.3 |  |
| [`Rotation`]({% link model/DeviceInformationModel/Configurations/CoordinateSystems/Rotation.md %}) | 1.6 |  |
| [`SensorAttachment`]({% link model/ObservationInformationModel/ObservationTypes/EventTypes/SensorAttachment.md %}) | 1.7 |  |
| [`SensorState`]({% link model/ObservationInformationModel/ObservationTypes/EventTypes/SensorState.md %}) | 2.2 |  |
| [`SerialNumber`]({% link model/ObservationInformationModel/ObservationTypes/EventTypes/SerialNumber.md %}) | 1.4 |  |
| [`SpecificationLimit`]({% link model/ObservationInformationModel/ObservationTypes/EventTypes/SpecificationLimit.md %}) | 1.7 | 2.5 |
| [`SpecificationLimits`]({% link model/DeviceInformationModel/Configurations/Specifications/SpecificationLimits.md %}) | 2.3 |  |
| [`SpindleInterlock`]({% link model/ObservationInformationModel/ObservationTypes/EventTypes/SpindleInterlock.md %}) | 1.3 |  |
| [`SwingAngle`]({% link model/ObservationInformationModel/ObservationTypes/EventTypes/SwingAngle.md %}) | 2.7 |  |
| [`SwingDiameter`]({% link model/ObservationInformationModel/ObservationTypes/EventTypes/SwingDiameter.md %}) | 2.7 |  |
| [`SwingRadius`]({% link model/ObservationInformationModel/ObservationTypes/EventTypes/SwingRadius.md %}) | 2.7 |  |
| [`TaskAssetId`]({% link model/ObservationInformationModel/ObservationTypes/EventTypes/TaskAssetId.md %}) | 2.7 |  |
| [`Thickness`]({% link model/ObservationInformationModel/ObservationTypes/EventTypes/Thickness.md %}) | 2.4 |  |
| [`ToolAssetId`]({% link model/ObservationInformationModel/ObservationTypes/EventTypes/ToolAssetId.md %}) | 1.2 |  |
| [`ToolCuttingItem`]({% link model/ObservationInformationModel/ObservationTypes/EventTypes/ToolCuttingItem.md %}) | 2.3 |  |
| [`ToolGroup`]({% link model/ObservationInformationModel/ObservationTypes/EventTypes/ToolGroup.md %}) | 1.5 |  |
| [`ToolId`]({% link model/ObservationInformationModel/ObservationTypes/EventTypes/ToolId.md %}) | 1.1 | 1.2 |
| [`ToolNumber`]({% link model/ObservationInformationModel/ObservationTypes/EventTypes/ToolNumber.md %}) | 1.2 |  |
| [`ToolOffset`]({% link model/ObservationInformationModel/ObservationTypes/EventTypes/ToolOffset.md %}) | 1.4 |  |
| [`ToolOffsets`]({% link model/ObservationInformationModel/ObservationTypes/EventTypes/ToolOffsets.md %}) | 2.2 |  |
| [`TransferCount`]({% link model/ObservationInformationModel/ObservationTypes/EventTypes/TransferCount.md %}) | 1.8 |  |
| [`Translation`]({% link model/DeviceInformationModel/Configurations/CoordinateSystems/Translation.md %}) | 1.6 |  |
| [`Uncertainty`]({% link model/ObservationInformationModel/ObservationTypes/EventTypes/Uncertainty.md %}) | 2.2 |  |
| [`UncertaintyType`]({% link model/ObservationInformationModel/ObservationTypes/EventTypes/UncertaintyType.md %}) | 2.2 |  |
| [`UnloadCount`]({% link model/ObservationInformationModel/ObservationTypes/EventTypes/UnloadCount.md %}) | 1.8 |  |
| [`User`]({% link model/ObservationInformationModel/ObservationTypes/EventTypes/User.md %}) | 1.4 |  |
| [`ValveState`]({% link model/ObservationInformationModel/ObservationTypes/EventTypes/ValveState.md %}) | 1.8 |  |
| [`Variable`]({% link model/WIPDeviceExamples/MillwSmoothG/Representation/Variable.md %}) | 1.5 |  |
| [`Variable`]({% link model/WIPDeviceExamples/MillwSmoothG/Representation/Variable.md %}) |  |  |
| [`WaitState`]({% link model/ObservationInformationModel/ObservationTypes/EventTypes/WaitState.md %}) | 1.5 |  |
| [`Wire`]({% link model/DeviceInformationModel/Components/ComponentTypes/Wire.md %}) | 1.4 |  |
| [`WorkOffset`]({% link model/ObservationInformationModel/ObservationTypes/EventTypes/WorkOffset.md %}) | 1.4 |  |
| [`WorkOffsets`]({% link model/WIPDeviceExamples/MillwSmoothG/Representation/WorkOffsets.md %}) |  |  |
| [`WorkOffsets`]({% link model/WIPDeviceExamples/MillwSmoothG/Representation/WorkOffsets.md %}) | 2.2 |  |
| [`WorkholdingId`]({% link model/ObservationInformationModel/ObservationTypes/EventTypes/WorkholdingId.md %}) | 1.1 |  |

