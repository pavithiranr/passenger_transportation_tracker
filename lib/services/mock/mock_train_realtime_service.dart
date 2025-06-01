//import 'dart:convert';

class MockTrainRealtimeService {
  Future<List<Map<String, dynamic>>> fetchMockTrainPositions() async {
    // Simulated delay to mimic network request
    await Future.delayed(const Duration(seconds: 1));

    // Mock data simulating train positions
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
      {
        'id': 'Train003',
        'latitude': 3.1600,
        'longitude': 101.7100,
      },
    ];
  }
}