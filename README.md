
# 🚌 GTFS Realtime Public Transport Tracker (Malaysia)

A Flutter-based mobile application that displays live public bus locations using GTFS-Realtime feeds and OpenStreetMap. The app supports tracking for `rapid-bus-kl`, `rapid-bus-mrtfeeder`, and other Prasarana bus services in Malaysia.



## 🚀 Features

- 🔴 Live tracking of public buses in real time
- 🗺️ OpenStreetMap integration using `flutter_map`
- 📡 GTFS-Realtime data parsing via `.proto` file
- 🛣️ Bus markers with route and vehicle ID tooltips
- ⚙️ Extensible support for other GTFS feeds (Penang, Kuantan, MRT Feeder, etc.)



## 📦 Tech Stack

- **Flutter** – Cross-platform mobile framework  
- **OpenStreetMap** – Free map tiles via `flutter_map`  
- **GTFS-Realtime Bindings** – Parse `.proto` data feeds  
- **Dart HTTP** – Handle live API requests



## 🛠 Installation

1. **Clone the Repository**

```bash
git clone https://github.com/your-username/gtfs-realtime-tracker.git
cd gtfs-realtime-tracker
````

2. **Install Dependencies**

```bash
flutter pub get
```

3. **Run the App**

```bash
flutter run
```

---

## 📡 GTFS Realtime API (Data.gov.my)

### Endpoint Format

```bash
GET https://api.data.gov.my/gtfs-realtime/vehicle-position/prasarana?category=<category>
```

### Valid Categories

* `rapid-bus-kl`
* `rapid-bus-mrtfeeder`
* `rapid-bus-kuantan`
* `rapid-bus-penang`

> ⚠️ `rapid-rail-kl` does **not** have stable realtime feeds yet.

---

## 📍 How It Works

* Fetches `.proto` formatted GTFS-Realtime vehicle position feed from Malaysia’s Open Data platform.
* Parses vehicle latitude, longitude, and metadata using the `gtfs_realtime_bindings` Dart package.
* Renders the data on an interactive OpenStreetMap using `flutter_map`.

---




---

## 📄 License

This project is open-source and free to use under the MIT License.



## 🙌 Credits

* [Data.gov.my GTFS API](https://data.gov.my)
* [OpenStreetMap](https://www.openstreetmap.org/)
* [GTFS Realtime](https://developers.google.com/transit/gtfs-realtime)



