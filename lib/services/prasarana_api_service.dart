import 'package:http/http.dart' as http;
import '../protos/gtfs_realtime.pb.dart';

class PrasaranaApiService {
  static const String baseUrl = 'https://api.data.gov.my/gtfs-realtime/vehicle-position/prasarana';
  
  Future<List<Map<String, dynamic>>> fetchBusPositions() async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl?category=rapid-bus-kl'),
        headers: {
          'Accept': 'application/x-protobuf',
        },
      );

      print('API Response Status: ${response.statusCode}');
      print('API Response Body: ${response.bodyBytes}');

      if (response.statusCode == 200) {
        try {
          final feed = FeedMessage.fromBuffer(response.bodyBytes);
          return feed.entity.map((entity) {
            final vehicle = entity.vehicle;
            return {
              'id': vehicle.vehicle.id,
              'latitude': vehicle.position.latitude,
              'longitude': vehicle.position.longitude,
              'route': vehicle.trip.routeId,
              'timestamp': DateTime.fromMillisecondsSinceEpoch(
                vehicle.timestamp.toInt() * 1000
              ).toIso8601String(),
              'speed': vehicle.position.speed,
              'bearing': vehicle.position.bearing,
            };
          }).toList();
        } catch (e) {
          print('Error parsing protobuf: $e');
          throw Exception('Protobuf parsing failed');
        }
      } else {
        throw Exception('Failed to fetch bus positions: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching bus positions: $e');
      // Fallback to mock data if API fails
      return [
        {
          'id': 'RapidKL-001',
          'latitude': 3.1390,
          'longitude': 101.6869,
          'route': 'T461',
          'timestamp': DateTime.now().toIso8601String(),
          'speed': 0.0,
          'bearing': 0.0,
        },
        {
          'id': 'RapidKL-002',
          'latitude': 3.1516,
          'longitude': 101.7155,
          'route': 'T462',
          'timestamp': DateTime.now().toIso8601String(),
          'speed': 0.0,
          'bearing': 45.0,
        },
      ];
    }
  }
}