import 'package:flutter/material.dart';

class HelpScreen extends StatelessWidget {
  void _logout(BuildContext context) {
    // Arahkan ke halaman login (ganti sesuai rute kamu)
    Navigator.of(context).pushNamedAndRemoveUntil('/login', (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Bantuan")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Text(
              "Jika Anda mengalami masalah, hubungi dosen atau asisten praktikum.",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 30),
            ElevatedButton.icon(
              onPressed: () => _logout(context),
              icon: Icon(Icons.logout),
              label: Text("Logout"),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            ),
          ],
        ),
      ),
    );
  }
}
