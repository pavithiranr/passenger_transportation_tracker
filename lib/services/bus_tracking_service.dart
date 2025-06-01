import 'package:http/http.dart' as http;

class BusTrackingService {
  final String baseUrl = 'https://api.data.gov.my/gtfs-realtime/vehicle-position/prasarana?category=rapid-bus-kl';

  Future<List<Map<String, dynamic>>> fetchBusPositions() async {
    try {
      final response = await http.get(Uri.parse(baseUrl));
      print('Response status: ${response.statusCode}');
      
      if (response.statusCode == 200) {
        // For now, return mock data until we properly implement the protobuf parsing
        return [
          {
            'id': 'Bus001',
            'latitude': 3.1390,
            'longitude': 101.6869,
          },
          {
            'id': 'Bus002',
            'latitude': 3.1500,
            'longitude': 101.7000,
          },
        ];
      } else {
        print('Failed to fetch bus positions: ${response.statusCode}');
        throw Exception('Failed to load bus positions');
      }
    } catch (e) {
      print('Error fetching bus positions: $e');
      throw Exception('Error fetching bus positions: $e');
    }
  }
}