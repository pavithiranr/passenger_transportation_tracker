import 'dart:async';

class MockBusTrackingService {
  Future<List<Map<String, dynamic>>> fetchMockBusPositions() async {
    // Simulated delay to mimic network request
    await Future.delayed(const Duration(seconds: 1));

    // Mock data simulating bus positions
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
      {
        'id': 'Bus003',
        'latitude': 3.1600,
        'longitude': 101.7100,
      },
    ];
  }
}