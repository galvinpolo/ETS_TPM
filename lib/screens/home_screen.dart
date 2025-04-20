import 'package:flutter/material.dart';
import '../widgets/bottom_nav_bar.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void _onBottomNavTap(int index) {
    setState(() {
      _selectedIndex = index;
    });

    // Navigasi sesuai tab
    if (index == 1) {
      Navigator.pushNamed(context, '/members');
    } else if (index == 2) {
      Navigator.pushNamed(context, '/help');
    }
  }

  Widget _buildMenuButton(String title, IconData icon, String route) {
    return Card(
      child: ListTile(
        leading: Icon(icon, color: Colors.blue),
        title: Text(title),
        trailing: Icon(Icons.arrow_forward_ios),
        onTap: () {
          Navigator.pushNamed(context, route);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Beranda")),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
            _buildMenuButton("Stopwatch", Icons.timer, '/stopwatch'),
            _buildMenuButton("Jenis Bilangan", Icons.format_list_numbered, '/number-types'),
            _buildMenuButton("Tracking LBS", Icons.location_on, '/tracking-lbs'),
            _buildMenuButton("Konversi Waktu", Icons.access_time, '/time-conversion'),
            _buildMenuButton("Rekomendasi Situs", Icons.link, '/recommendation'),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: _selectedIndex,
        onTap: _onBottomNavTap,
      ),
    );
  }
}
