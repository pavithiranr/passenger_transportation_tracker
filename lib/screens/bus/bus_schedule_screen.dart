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
  bool _hasError = false;
  List<BusSchedule> _busSchedules = [];
  final DateTime _now = DateTime.now();

  @override
  void initState() {
    super.initState();
    _loadBusSchedules();
  }

  Future<void> _loadBusSchedules() async {
    if (!mounted) return;
    
    setState(() {
      _isLoading = true;
      _hasError = false;
    });

    try {
      // Simulate network delay
      await Future.delayed(const Duration(seconds: 1));
      
      // Replace with actual API call
      final mockData = [
        BusSchedule(
          busNumber: 'B1',
          route: 'Main Line',
          departureTime: DateTime(_now.year, _now.month, _now.day, 10, 0),
          arrivalTime: DateTime(_now.year, _now.month, _now.day, 10, 45),
          fare: 2.50,
          capacity: 0.7, // 70% full
          isExpress: false,
        ),
        BusSchedule(
          busNumber: 'B2',
          route: 'Express Line',
          departureTime: DateTime(_now.year, _now.month, _now.day, 10, 15),
          arrivalTime: DateTime(_now.year, _now.month, _now.day, 10, 55),
          fare: 3.50,
          capacity: 0.4, // 40% full
          isExpress: true,
        ),
      ];

      if (!mounted) return;
      setState(() => _busSchedules = mockData);
    } catch (e) {
      if (!mounted) return;
      setState(() => _hasError = true);
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  String _formatTime(DateTime time) {
    return '${time.hour}:${time.minute.toString().padLeft(2, '0')}';
  }

  String _formatDuration(DateTime departure, DateTime arrival) {
    final duration = arrival.difference(departure);
    return '${duration.inMinutes} min';
  }

  Color _getCapacityColor(double capacity) {
    if (capacity > 0.8) return Colors.red;
    if (capacity > 0.5) return Colors.orange;
    return Colors.green;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bus Schedule'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _loadBusSchedules,
            tooltip: 'Refresh',
          ),
        ],
      ),
      body: Column(
        children: [
          _buildRouteHeader(),
          if (_isLoading) _buildLoadingIndicator(),
          if (_hasError) _buildErrorWidget(),
          if (!_isLoading && !_hasError) _buildScheduleList(),
        ],
      ),
    );
  }

  Widget _buildRouteHeader() {
    return Card(
      margin: const EdgeInsets.all(16),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.location_on, color: Colors.blue, size: 20),
                const SizedBox(width: 8),
                Text(
                  'From: ${widget.start}',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                const Icon(Icons.flag, color: Colors.red, size: 20),
                const SizedBox(width: 8),
                Text(
                  'To: ${widget.destination}',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLoadingIndicator() {
    return const Expanded(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
            SizedBox(height: 16),
            Text('Loading schedules...'),
          ],
        ),
      ),
    );
  }

  Widget _buildErrorWidget() {
    return Expanded(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline, color: Colors.red, size: 48),
            const SizedBox(height: 16),
            const Text(
              'Failed to load schedules',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: _loadBusSchedules,
              child: const Text('Retry'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildScheduleList() {
    return Expanded(
      child: RefreshIndicator(
        onRefresh: _loadBusSchedules,
        child: ListView.builder(
          padding: const EdgeInsets.only(bottom: 16),
          itemCount: _busSchedules.length,
          itemBuilder: (context, index) {
            final schedule = _busSchedules[index];
            return _buildScheduleCard(schedule);
          },
        ),
      ),
    );
  }

  Widget _buildScheduleCard(BusSchedule schedule) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: () => _showScheduleDetails(schedule),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              _buildBusIcon(schedule),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildBusHeader(schedule),
                    const SizedBox(height: 8),
                    _buildScheduleDetails(schedule),
                  ],
                ),
              ),
              const Icon(Icons.chevron_right, color: Colors.grey),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBusIcon(BusSchedule schedule) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: schedule.isExpress ? Colors.amber[100] : Colors.blue[50],
        shape: BoxShape.circle,
      ),
      child: Icon(
        Icons.directions_bus,
        color: schedule.isExpress ? Colors.amber[800] : Colors.blue,
        size: 28,
      ),
    );
  }

  Widget _buildBusHeader(BusSchedule schedule) {
    return Row(
      children: [
        Text(
          'Bus ${schedule.busNumber}',
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        if (schedule.isExpress) ...[
          const SizedBox(width: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
            decoration: BoxDecoration(
              color: Colors.amber[50],
              borderRadius: BorderRadius.circular(4),
            ),
            child: const Text(
              'EXPRESS',
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.bold,
                color: Colors.amber,
              ),
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildScheduleDetails(BusSchedule schedule) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Icon(Icons.schedule, size: 16, color: Colors.grey),
            const SizedBox(width: 4),
            Text(
              '${_formatTime(schedule.departureTime)} - ${_formatTime(schedule.arrivalTime)}',
              style: const TextStyle(fontSize: 14),
            ),
            const SizedBox(width: 8),
            Text(
              '(${_formatDuration(schedule.departureTime, schedule.arrivalTime)})',
              style: const TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        Row(
          children: [
            const Icon(Icons.attach_money, size: 16, color: Colors.grey),
            const SizedBox(width: 4),
            Text(
              'MYR ${schedule.fare.toStringAsFixed(2)}',
              style: const TextStyle(fontSize: 14),
            ),
            const Spacer(),
            _buildCapacityIndicator(schedule.capacity),
          ],
        ),
      ],
    );
  }

  Widget _buildCapacityIndicator(double capacity) {
    return Row(
      children: [
        Icon(
          Icons.people,
          size: 16,
          color: _getCapacityColor(capacity),
        ),
        const SizedBox(width: 4),
        Text(
          '${(capacity * 100).toInt()}% full',
          style: TextStyle(
            fontSize: 12,
            color: _getCapacityColor(capacity),
          ),
        ),
      ],
    );
  }

  void _showScheduleDetails(BusSchedule schedule) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 40,
                  height: 4,
                  margin: const EdgeInsets.only(bottom: 16),
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
              Text(
                'Bus ${schedule.busNumber} Details',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              _buildDetailRow('Route:', schedule.route),
              _buildDetailRow(
                'Departure:',
                '${_formatTime(schedule.departureTime)} from ${widget.start}',
              ),
              _buildDetailRow(
                'Arrival:',
                '${_formatTime(schedule.arrivalTime)} at ${widget.destination}',
              ),
              _buildDetailRow('Duration:', _formatDuration(
                schedule.departureTime,
                schedule.arrivalTime,
              )),
              _buildDetailRow('Fare:', 'MYR ${schedule.fare.toStringAsFixed(2)}'),
              _buildDetailRow('Capacity:', '${(schedule.capacity * 100).toInt()}% full'),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Close'),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 100,
            child: Text(
              label,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
          ),
          Expanded(child: Text(value)),
        ],
      ),
    );
  }
}

class BusSchedule {
  final String busNumber;
  final String route;
  final DateTime departureTime;
  final DateTime arrivalTime;
  final double fare;
  final double capacity; // 0.0 to 1.0
  final bool isExpress;

  BusSchedule({
    required this.busNumber,
    required this.route,
    required this.departureTime,
    required this.arrivalTime,
    required this.fare,
    required this.capacity,
    required this.isExpress,
  });
}