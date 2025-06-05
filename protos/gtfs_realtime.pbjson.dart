//
//  Generated code. Do not modify.
//  source: lib/protos/gtfs_realtime.proto
//
// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use feedMessageDescriptor instead')
const FeedMessage$json = {
  '1': 'FeedMessage',
  '2': [
    {'1': 'header', '3': 1, '4': 2, '5': 11, '6': '.transit_realtime.FeedHeader', '10': 'header'},
    {'1': 'entity', '3': 2, '4': 3, '5': 11, '6': '.transit_realtime.FeedEntity', '10': 'entity'},
  ],
};

/// Descriptor for `FeedMessage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List feedMessageDescriptor = $convert.base64Decode(
    'CgtGZWVkTWVzc2FnZRI0CgZoZWFkZXIYASACKAsyHC50cmFuc2l0X3JlYWx0aW1lLkZlZWRIZW'
    'FkZXJSBmhlYWRlchI0CgZlbnRpdHkYAiADKAsyHC50cmFuc2l0X3JlYWx0aW1lLkZlZWRFbnRp'
    'dHlSBmVudGl0eQ==');

@$core.Deprecated('Use feedHeaderDescriptor instead')
const FeedHeader$json = {
  '1': 'FeedHeader',
  '2': [
    {'1': 'gtfs_realtime_version', '3': 1, '4': 2, '5': 9, '10': 'gtfsRealtimeVersion'},
    {'1': 'timestamp', '3': 2, '4': 1, '5': 4, '10': 'timestamp'},
    {'1': 'incrementality', '3': 3, '4': 1, '5': 4, '10': 'incrementality'},
  ],
};

/// Descriptor for `FeedHeader`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List feedHeaderDescriptor = $convert.base64Decode(
    'CgpGZWVkSGVhZGVyEjIKFWd0ZnNfcmVhbHRpbWVfdmVyc2lvbhgBIAIoCVITZ3Rmc1JlYWx0aW'
    '1lVmVyc2lvbhIcCgl0aW1lc3RhbXAYAiABKARSCXRpbWVzdGFtcBImCg5pbmNyZW1lbnRhbGl0'
    'eRgDIAEoBFIOaW5jcmVtZW50YWxpdHk=');

@$core.Deprecated('Use feedEntityDescriptor instead')
const FeedEntity$json = {
  '1': 'FeedEntity',
  '2': [
    {'1': 'id', '3': 1, '4': 2, '5': 9, '10': 'id'},
    {'1': 'vehicle', '3': 3, '4': 1, '5': 11, '6': '.transit_realtime.VehiclePosition', '10': 'vehicle'},
  ],
};

/// Descriptor for `FeedEntity`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List feedEntityDescriptor = $convert.base64Decode(
    'CgpGZWVkRW50aXR5Eg4KAmlkGAEgAigJUgJpZBI7Cgd2ZWhpY2xlGAMgASgLMiEudHJhbnNpdF'
    '9yZWFsdGltZS5WZWhpY2xlUG9zaXRpb25SB3ZlaGljbGU=');

@$core.Deprecated('Use vehiclePositionDescriptor instead')
const VehiclePosition$json = {
  '1': 'VehiclePosition',
  '2': [
    {'1': 'trip', '3': 1, '4': 1, '5': 11, '6': '.transit_realtime.TripDescriptor', '10': 'trip'},
    {'1': 'vehicle', '3': 2, '4': 1, '5': 11, '6': '.transit_realtime.VehicleDescriptor', '10': 'vehicle'},
    {'1': 'position', '3': 3, '4': 2, '5': 11, '6': '.transit_realtime.Position', '10': 'position'},
    {'1': 'timestamp', '3': 4, '4': 1, '5': 4, '10': 'timestamp'},
  ],
};

/// Descriptor for `VehiclePosition`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List vehiclePositionDescriptor = $convert.base64Decode(
    'Cg9WZWhpY2xlUG9zaXRpb24SNAoEdHJpcBgBIAEoCzIgLnRyYW5zaXRfcmVhbHRpbWUuVHJpcE'
    'Rlc2NyaXB0b3JSBHRyaXASPQoHdmVoaWNsZRgCIAEoCzIjLnRyYW5zaXRfcmVhbHRpbWUuVmVo'
    'aWNsZURlc2NyaXB0b3JSB3ZlaGljbGUSNgoIcG9zaXRpb24YAyACKAsyGi50cmFuc2l0X3JlYW'
    'x0aW1lLlBvc2l0aW9uUghwb3NpdGlvbhIcCgl0aW1lc3RhbXAYBCABKARSCXRpbWVzdGFtcA==');

@$core.Deprecated('Use tripDescriptorDescriptor instead')
const TripDescriptor$json = {
  '1': 'TripDescriptor',
  '2': [
    {'1': 'trip_id', '3': 1, '4': 1, '5': 9, '10': 'tripId'},
    {'1': 'route_id', '3': 2, '4': 1, '5': 9, '10': 'routeId'},
    {'1': 'start_time', '3': 3, '4': 1, '5': 9, '10': 'startTime'},
    {'1': 'start_date', '3': 4, '4': 1, '5': 9, '10': 'startDate'},
  ],
};

/// Descriptor for `TripDescriptor`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List tripDescriptorDescriptor = $convert.base64Decode(
    'Cg5UcmlwRGVzY3JpcHRvchIXCgd0cmlwX2lkGAEgASgJUgZ0cmlwSWQSGQoIcm91dGVfaWQYAi'
    'ABKAlSB3JvdXRlSWQSHQoKc3RhcnRfdGltZRgDIAEoCVIJc3RhcnRUaW1lEh0KCnN0YXJ0X2Rh'
    'dGUYBCABKAlSCXN0YXJ0RGF0ZQ==');

@$core.Deprecated('Use vehicleDescriptorDescriptor instead')
const VehicleDescriptor$json = {
  '1': 'VehicleDescriptor',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'label', '3': 2, '4': 1, '5': 9, '10': 'label'},
    {'1': 'license_plate', '3': 3, '4': 1, '5': 9, '10': 'licensePlate'},
  ],
};

/// Descriptor for `VehicleDescriptor`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List vehicleDescriptorDescriptor = $convert.base64Decode(
    'ChFWZWhpY2xlRGVzY3JpcHRvchIOCgJpZBgBIAEoCVICaWQSFAoFbGFiZWwYAiABKAlSBWxhYm'
    'VsEiMKDWxpY2Vuc2VfcGxhdGUYAyABKAlSDGxpY2Vuc2VQbGF0ZQ==');

@$core.Deprecated('Use positionDescriptor instead')
const Position$json = {
  '1': 'Position',
  '2': [
    {'1': 'latitude', '3': 1, '4': 2, '5': 2, '10': 'latitude'},
    {'1': 'longitude', '3': 2, '4': 2, '5': 2, '10': 'longitude'},
    {'1': 'bearing', '3': 3, '4': 1, '5': 2, '10': 'bearing'},
    {'1': 'odometer', '3': 4, '4': 1, '5': 2, '10': 'odometer'},
    {'1': 'speed', '3': 5, '4': 1, '5': 2, '10': 'speed'},
  ],
};

/// Descriptor for `Position`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List positionDescriptor = $convert.base64Decode(
    'CghQb3NpdGlvbhIaCghsYXRpdHVkZRgBIAIoAlIIbGF0aXR1ZGUSHAoJbG9uZ2l0dWRlGAIgAi'
    'gCUglsb25naXR1ZGUSGAoHYmVhcmluZxgDIAEoAlIHYmVhcmluZxIaCghvZG9tZXRlchgEIAEo'
    'AlIIb2RvbWV0ZXISFAoFc3BlZWQYBSABKAJSBXNwZWVk');

