import 'package:flutter/material.dart';
import '../data/train_lines.dart';

class StationInfo {
  final String name;
  final String code;
  final List<TrainLine> lines;

  StationInfo(this.name, this.code, this.lines);
}

class StationFormatter {
  static List<StationInfo> getStationWithLines(final String station) {
    final List<StationInfo> stations = [];
    
    for (var line in trainLines) {
      final stationMatch = line.stations.where(
        (final s) => s.name.toLowerCase().contains(station.toLowerCase()),
      );
      
      for (var match in stationMatch) {
        // Check if station already exists
        final existingStation = stations.firstWhere(
          (final s) => s.name == match.name,
          orElse: () => StationInfo(match.name, match.code, []),
        );
        
        if (!stations.contains(existingStation)) {
          stations.add(existingStation);
        }
        
        final index = stations.indexOf(existingStation);
        if (!stations[index].lines.contains(line)) {
          stations[index].lines.add(line);
        }
      }
    }
    
    return stations;
  }

  static Widget buildStationWithLines(final StationInfo info) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(info.name),
              Text(
                info.code,
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
        ...info.lines.map((final line) => Padding(
          padding: const EdgeInsets.only(left: 4),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
            decoration: BoxDecoration(
              color: line.color,
              borderRadius: BorderRadius.circular(4),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.train, color: Colors.black87, size: 16),
                const SizedBox(width: 4),
                Text(
                  line.code,
                  style: const TextStyle(
                    color: Colors.black87,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),),
      ],
    );
  }
}