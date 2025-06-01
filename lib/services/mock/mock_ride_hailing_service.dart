import 'dart:async';

class MockRideHailingService {
  Future<List<Map<String, dynamic>>> fetchMockRideOptions() async {
    // Simulated delay to mimic network request
    await Future.delayed(const Duration(seconds: 1));

    // Mock data simulating ride-hailing options
    return [
      {
        'id': 'Ride001',
        'driver': 'John Doe',
        'car': 'Toyota Prius',
        'location': '3.1390, 101.6869',
      },
      {
        'id': 'Ride002',
        'driver': 'Jane Smith',
        'car': 'Honda Civic',
        'location': '3.1500, 101.7000',
      },
      {
        'id': 'Ride003',
        'driver': 'Ali Khan',
        'car': 'Proton Saga',
        'location': '3.1600, 101.7100',
      },
    ];
  }
}