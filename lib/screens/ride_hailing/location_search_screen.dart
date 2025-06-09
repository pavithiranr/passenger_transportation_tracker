import 'package:flutter/material.dart';

class LocationSearchScreen extends StatefulWidget {
  const LocationSearchScreen({super.key});

  @override
  State<LocationSearchScreen> createState() => _LocationSearchScreenState();
}

class _LocationSearchScreenState extends State<LocationSearchScreen> {
  final _searchController = TextEditingController();
  final _locations = [
    'Cyberjaya City Centre',
    'Putrajaya Sentral',
    'KL Sentral',
    'KLCC',
    'Mid Valley',
    'Sunway Pyramid',
    'IOI City Mall',
    'Pavilion KL',
    'One Utama',
  ];
  List<String> _filteredLocations = [];

  @override
  void initState() {
    super.initState();
    _filteredLocations = _locations;
  }

  void _filterLocations(String query) {
    setState(() {
      _filteredLocations = _locations
          .where((location) => 
              location.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: _searchController,
          decoration: const InputDecoration(
            hintText: 'Search location',
            border: InputBorder.none,
            hintStyle: TextStyle(color: Colors.white70),
          ),
          style: const TextStyle(color: Colors.white),
          onChanged: _filterLocations,
          autofocus: true,
        ),
      ),
      body: ListView.builder(
        itemCount: _filteredLocations.length,
        itemBuilder: (context, index) {
          final location = _filteredLocations[index];
          return ListTile(
            leading: const Icon(Icons.location_on),
            title: Text(location),
            onTap: () => Navigator.pop(context, location),
          );
        },
      ),
    );
  }
}