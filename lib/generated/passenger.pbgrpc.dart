//
//  Generated code. Do not modify.
//  source: passenger.proto
//
// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'package:protobuf/protobuf.dart' as $pb;

import 'passenger.pb.dart' as $0;

export 'passenger.pb.dart';

@$pb.GrpcServiceName('passenger.PassengerService')
class PassengerServiceClient extends $grpc.Client {
  static final _$trackPassenger = $grpc.ClientMethod<$0.Passenger, $0.Passenger>(
      '/passenger.PassengerService/TrackPassenger',
      (final $0.Passenger value) => value.writeToBuffer(),
      (final $core.List<$core.int> value) => $0.Passenger.fromBuffer(value),);

  PassengerServiceClient(super.channel,
      {super.options,
      super.interceptors,});

  $grpc.ResponseFuture<$0.Passenger> trackPassenger(final $0.Passenger request, {final $grpc.CallOptions? options}) {
    return $createUnaryCall(_$trackPassenger, request, options: options);
  }
}

@$pb.GrpcServiceName('passenger.PassengerService')
abstract class PassengerServiceBase extends $grpc.Service {
  $core.String get $name => 'passenger.PassengerService';

  PassengerServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.Passenger, $0.Passenger>(
        'TrackPassenger',
        trackPassenger_Pre,
        false,
        false,
        (final $core.List<$core.int> value) => $0.Passenger.fromBuffer(value),
        (final $0.Passenger value) => value.writeToBuffer(),),);
  }

  $async.Future<$0.Passenger> trackPassenger_Pre(final $grpc.ServiceCall $call, final $async.Future<$0.Passenger> $request) async {
    return trackPassenger($call, await $request);
  }

  $async.Future<$0.Passenger> trackPassenger(final $grpc.ServiceCall call, final $0.Passenger request);
}
