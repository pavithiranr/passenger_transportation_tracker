import 'package:flutter/material.dart';
import 'bus/bus_schedule_screen.dart';
import 'train/train_schedule_screen.dart';
import 'train/train_realtime_screen.dart';
import 'ride_hailing/ride_hailing_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _startController = TextEditingController();
  final _destinationController = TextEditingController();

  @override
  void dispose() {
    _startController.dispose();
    _destinationController.dispose();
    super.dispose();
  }

  void _navigateToMode(String mode) {
    switch (mode) {
      case 'bus':
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => BusScheduleScreen(
              start: _startController.text,
              destination: _destinationController.text,
            ),
          ),
        );
        break;
      case 'train':
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => TrainScheduleScreen(
              start: _startController.text,
              destination: _destinationController.text,
            ),
          ),
        );
        break;
      case 'realtime':
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => const TrainRealtimeScreen(),
          ),
        );
        break;
      case 'ride':
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => RideHailingScreen(
              destination: _destinationController.text,
            ),
          ),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transportation Tracker'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _startController,
              decoration: const InputDecoration(
                labelText: 'Starting Point',
                hintText: 'Enter starting location',
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _destinationController,
              decoration: const InputDecoration(
                labelText: 'Destination',
                hintText: 'Enter destination',
              ),
            ),
            const SizedBox(height: 32),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                children: [
                  _TransportCard(
                    icon: Icons.directions_bus,
                    title: 'Bus Schedule',
                    color: Colors.green,
                    onTap: () => _navigateToMode('bus'),
                  ),
                  _TransportCard(
                    icon: Icons.train,
                    title: 'Train Schedule',
                    color: Colors.blue,
                    onTap: () => _navigateToMode('train'),
                  ),
                  _TransportCard(
                    icon: Icons.access_time,
                    title: 'Real-time Tracking',
                    color: Colors.orange,
                    onTap: () => _navigateToMode('realtime'),
                  ),
                  _TransportCard(
                    icon: Icons.local_taxi,
                    title: 'Book a Ride',
                    color: Colors.purple,
                    onTap: () => _navigateToMode('ride'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _TransportCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final Color color;
  final VoidCallback onTap;

  const _TransportCard({
    required this.icon,
    required this.title,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: InkWell(
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 48, color: color),
            const SizedBox(height: 8),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}