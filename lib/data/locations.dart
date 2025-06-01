import 'train_lines.dart';

// Generate a unique list of all train station names
final List<String> trainStations = trainLines
    .expand((final line) => line.stations)
    .map((final station) => station.name)
    .toSet()
    .toList()
  ..sort();

// Common bus stations and terminals
const List<String> busStations = [
  'Terminal Putra Heights',
  'Terminal Kelana Jaya',
  'Terminal Bukit Jalil',
  'KL Sentral Bus Terminal',
  'Titiwangsa Terminal',
  'Maluri Terminal',
  'Cheras Sentral',
  'Ampang Point',
  'Puchong Utama',
  'Shah Alam Bus Terminal',
  'Subang Parade',
  'USJ Summit',
  'Damansara Damai',
  'Sri Petaling',
  'Taman Bahagia',
];

// Combined list of all stations
final List<String> allStations = [...trainStations, ...busStations]..sort();