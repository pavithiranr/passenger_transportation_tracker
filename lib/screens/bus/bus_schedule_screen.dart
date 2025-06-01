import 'package:flutter/material.dart';

class BusScheduleScreen extends StatefulWidget {
  final String start;
  final String destination;

  const BusScheduleScreen({
    super.key,
    required this.start,
    required this.destination,
  });

  @override
  State<BusScheduleScreen> createState() => _BusScheduleScreenState();
}

class _BusScheduleScreenState extends State<BusScheduleScreen> {
  bool _isLoading = false;
  List<Map<String, dynamic>> _busSchedules = [];

  @override
  void initState() {
    super.initState();
    _loadBusSchedules();
  }

  Future<void> _loadBusSchedules() async {
    setState(() => _isLoading = true);
    try {
      // TODO: Implement actual bus schedule loading
      _busSchedules = [
        {
          'busNumber': 'B1',
          'route': 'Main Line',
          'departureTime': '10:00 AM',
          'arrivalTime': '10:45 AM',
          'fare': 'MYR 2.50',
        },
        {
          'busNumber': 'B2',
          'route': 'Express Line',
          'departureTime': '10:15 AM',
          'arrivalTime': '10:55 AM',
          'fare': 'MYR 3.50',
        },
      ];
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bus Schedule'),
      ),
      body: Column(
        children: [
          Card(
            margin: const EdgeInsets.all(16),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'From: ${widget.start}',
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'To: ${widget.destination}',
                    style: const TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          ),
          if (_isLoading)
            const Expanded(
              child: Center(child: CircularProgressIndicator()),
            )
          else
            Expanded(
              child: ListView.builder(
                itemCount: _busSchedules.length,
                itemBuilder: (context, index) {
                  final schedule = _busSchedules[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    child: ListTile(
                      leading: const Icon(
                        Icons.directions_bus,
                        color: Colors.blue,
                        size: 32,
                      ),
                      title: Text(
                        'Bus ${schedule['busNumber']} - ${schedule['route']}',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Departure: ${schedule['departureTime']}'),
                          Text('Arrival: ${schedule['arrivalTime']}'),
                          Text('Fare: ${schedule['fare']}'),
                        ],
                      ),
                      isThreeLine: true,
                      trailing: const Icon(Icons.arrow_forward_ios),
                      onTap: () {
                        // TODO: Implement bus schedule details
                      },
                    ),
                  );
                },
              ),
            ),
        ],
      ),
    );
  }
}