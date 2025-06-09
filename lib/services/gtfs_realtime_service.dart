import 'package:http/http.dart' as http;
import '../protos/gtfs-realtime.pb.dart';

class GtfsRealtimeService {
  final String apiUrl = 'https://api.data.gov.my/gtfs-realtime/vehicle-position/prasarana?category=rapid-rail-kl';

  Future<List<FeedEntity>> fetchVehiclePositions() async {
    try {
      print('Fetching vehicle positions from: $apiUrl');
      final response = await http.get(Uri.parse(apiUrl));
      print('Response status: ${response.statusCode}');
      print('Response size: ${response.bodyBytes.length} bytes');
      
      if (response.statusCode == 200) {
        try {
          final feed = FeedMessage.fromBuffer(response.bodyBytes);
          print('Successfully parsed feed with ${feed.entity.length} entities');
          if (feed.entity.isEmpty) {
            print('Warning: Feed contains no entities');
          }
          return feed.entity;
        } catch (e) {
          print('Error parsing protobuf data: $e');
          print('First 100 bytes of response: ${response.bodyBytes.take(100)}');
          throw Exception('Error parsing protobuf data: $e');
        }
      } else {
        print('Failed to fetch vehicle positions: ${response.statusCode}');
        print('Response body: ${response.body}');
        throw Exception('Failed to fetch vehicle positions: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching vehicle positions: $e');
      throw Exception('Error fetching vehicle positions: $e');
    }
  }
}