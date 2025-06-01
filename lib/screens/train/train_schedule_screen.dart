import 'package:flutter/material.dart';

class TrainScheduleScreen extends StatefulWidget {
  final String start;
  final String destination;

  const TrainScheduleScreen({
    super.key,
    required this.start,
    required this.destination,
  });

  @override
  State<TrainScheduleScreen> createState() => _TrainScheduleScreenState();
}

class _TrainScheduleScreenState extends State<TrainScheduleScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Train Schedule'),
      ),
      body: const Center(
        child: Text('Train schedule implementation coming soon'),
      ),
    );
  }
}