import 'package:http/http.dart' as http;

class TrainRealtimeService {
  final String baseUrl = 'https://api.data.gov.my/gtfs-realtime/vehicle-position/ktmb';

  Future<List<Map<String, dynamic>>> fetchTrainPositions() async {
    try {
      final response = await http.get(Uri.parse(baseUrl));
      print('Response status: ${response.statusCode}');
      
      if (response.statusCode == 200) {
        // For now, return mock data until we properly implement the protobuf parsing
        return [
          {
            'id': 'Train001',
            'latitude': 3.1390,
            'longitude': 101.6869,
          },
          {
            'id': 'Train002',
            'latitude': 3.1500,
            'longitude': 101.7000,
          },
        ];
      } else {
        print('Failed to fetch train positions: ${response.statusCode}');
        throw Exception('Failed to load train positions');
      }
    } catch (e) {
      print('Error fetching train positions: $e');
      throw Exception('Error fetching train positions: $e');
    }
  }
}