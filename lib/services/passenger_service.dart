import 'package:grpc/grpc.dart';
import '../generated/passenger.pbgrpc.dart';

class PassengerTrackingService {
  late final ClientChannel channel;
  late final PassengerServiceClient stub;

  PassengerTrackingService() {
    channel = ClientChannel(
      'localhost',
      port: 50051,
      options: const ChannelOptions(
        credentials: ChannelCredentials.insecure(),
      ),
    );
    stub = PassengerServiceClient(channel);
  }

  Future<Passenger> trackPassenger(final Passenger passenger) async {
    try {
      final response = await stub.trackPassenger(passenger);
      return response;
    } catch (e) {
      throw Exception('Failed to track passenger: $e');
    }
  }

  void dispose() {
    channel.shutdown();
  }
}