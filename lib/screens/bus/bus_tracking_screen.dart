import 'package:flutter/material.dart';
import 'dart:async';

class BusTrackingScreen extends StatefulWidget {
  final String start;
  final String destination;

  const BusTrackingScreen({
    super.key, 
    required this.start, 
    required this.destination,
  });

  @override
  State<BusTrackingScreen> createState() => _BusTrackingScreenState();
}

class _BusTrackingScreenState extends State<BusTrackingScreen> {
  Timer? _timer;
  List<Map<String, dynamic>> busSchedules = [];

  @override
  void initState() {
    super.initState();
    _updateSchedules();
    // Update schedules every minute
    _timer = Timer.periodic(const Duration(minutes: 1), (_) => _updateSchedules());
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _updateSchedules() {
    setState(() {
      // Simulate real-time updates with random arrival times
      busSchedules = [
        {
          'route': 'RapidKL 780',
          'time': DateTime.now().add(Duration(minutes: 3 + DateTime.now().second % 8)),
          'color': Colors.green,
        },
        {
          'route': 'RapidKL 783',
          'time': DateTime.now().add(Duration(minutes: 5 + DateTime.now().second % 10)),
          'color': Colors.blue,
        },
        {
          'route': 'RapidKL 785',
          'time': DateTime.now().add(Duration(minutes: 8 + DateTime.now().second % 12)),
          'color': Colors.red,
        },
      ];
    });
  }

  String _getTimeString(final DateTime time) {
    final difference = time.difference(DateTime.now());
    final minutes = difference.inMinutes;
    return '$minutes min';
  }

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bus Schedule'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text(
            'Route: ${widget.start} → ${widget.destination}',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 16),
          ...busSchedules.map((final schedule) => Card(
            child: ListTile(
              leading: Icon(Icons.directions_bus, color: schedule['color'] as Color),
              title: Text(schedule['route'] as String),
              subtitle: Text('From ${widget.start} to ${widget.destination}'),
              trailing: Text(
                _getTimeString(schedule['time'] as DateTime),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: _getTimeString(schedule['time'] as DateTime) == '1 min' 
                      ? Colors.red 
                      : Colors.green,
                ),
              ),
            ),
          ),),
          const SizedBox(height: 16),
          const Text('Available Routes:', style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),),
          const SizedBox(height: 8),
          _buildRouteCards(),
        ],
      ),
    );
  }

  Widget _buildRouteCards() {
    final bool isDirectRoute = DateTime.now().second % 2 == 0; // Simulate route logic
    
    if (isDirectRoute) {
      return Card(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Direct Route:', style: TextStyle(fontWeight: FontWeight.bold)),
              const Text('• RapidKL 780'),
              const SizedBox(height: 8),
              Text('Estimated time: ${35 + DateTime.now().second % 20} minutes'),
              const Text('Total fare: RM${2.5}'),
            ],
          ),
        ),
      );
    }

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Transfer Route:', style: TextStyle(fontWeight: FontWeight.bold)),
            const Text('• RapidKL 783 → Hub Station'),
            const Text('• Transfer to RapidKL 785'),
            const SizedBox(height: 8),
            Text('Estimated time: ${45 + DateTime.now().second % 25} minutes'),
            const Text('Total fare: RM4.00'),
          ],
        ),
      ),
    );
  }
}