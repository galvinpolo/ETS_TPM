import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:geolocator/geolocator.dart';

class TrackingLBSScreen extends StatefulWidget {
  @override
  _TrackingLBSScreenState createState() => _TrackingLBSScreenState();
}

class _TrackingLBSScreenState extends State<TrackingLBSScreen> {
  LatLng? _currentPosition;
  final String _tomTomApiKey =
      'jfoA7KHeTH3IgtF1kU1NHAdGP2jKTrxn'; // Ganti dengan API key kamu

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  Future<void> _getCurrentLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) return;

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    if (permission == LocationPermission.whileInUse ||
        permission == LocationPermission.always) {
      final position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      setState(() {
        _currentPosition = LatLng(position.latitude, position.longitude);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Tracking LBS")),
      body: _currentPosition == null
          ? Center(child: CircularProgressIndicator())
          : FlutterMap(
              options: MapOptions(
                center: _currentPosition,
                zoom: 15,
              ),
              children: [
                TileLayer(
                  urlTemplate:
                      'https://api.tomtom.com/map/1/tile/basic/main/{z}/{x}/{y}.png?key=$_tomTomApiKey',
                  userAgentPackageName: 'com.example.app',
                ),
                MarkerLayer(
                  markers: [
                    Marker(
                      point: _currentPosition!,
                      width: 60,
                      height: 60,
                      child:
                          Icon(Icons.location_pin, color: Colors.red, size: 40),
                    ),
                  ],
                ),
              ],
            ),
    );
  }
}
