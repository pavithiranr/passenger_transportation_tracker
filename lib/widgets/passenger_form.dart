import 'package:flutter/material.dart';
import '../generated/passenger.pb.dart';
import '../services/passenger_service.dart';
import 'package:fixnum/fixnum.dart';

class PassengerForm extends StatefulWidget {
  final Function(Passenger) onPassengerTracked;

  const PassengerForm({super.key, required this.onPassengerTracked});

  @override
  _PassengerFormState createState() => _PassengerFormState();
}

class _PassengerFormState extends State<PassengerForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _locationController = TextEditingController();
  final _destinationController = TextEditingController();
  final _service = PassengerTrackingService();

  @override
  Widget build(final BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: _nameController,
            decoration: const InputDecoration(labelText: 'Name'),
            validator: (final value) => value?.isEmpty ?? true ? 'Required' : null,
          ),
          TextFormField(
            controller: _phoneController,
            decoration: const InputDecoration(labelText: 'Phone'),
            validator: (final value) => value?.isEmpty ?? true ? 'Required' : null,
          ),
          TextFormField(
            controller: _locationController,
            decoration: const InputDecoration(labelText: 'Current Location'),
            validator: (final value) => value?.isEmpty ?? true ? 'Required' : null,
          ),
          TextFormField(
            controller: _destinationController,
            decoration: const InputDecoration(labelText: 'Destination'),
            validator: (final value) => value?.isEmpty ?? true ? 'Required' : null,
          ),
          ElevatedButton(
            onPressed: _submitForm,
            child: const Text('Track Passenger'),
          ),
        ],
      ),
    );
  }

  void _submitForm() async {
    if (_formKey.currentState?.validate() ?? false) {
      final passenger = Passenger()
        ..id = DateTime.now().millisecondsSinceEpoch.toString()
        ..name = _nameController.text
        ..phoneNumber = _phoneController.text
        ..currentLocation = _locationController.text
        ..timestamp = Int64(DateTime.now().millisecondsSinceEpoch);

      try {
        final trackedPassenger = await _service.trackPassenger(passenger);
        widget.onPassengerTracked(trackedPassenger);
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: $e')),
        );
      }
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _locationController.dispose();
    _destinationController.dispose();
    _service.dispose();
    super.dispose();
  }
}