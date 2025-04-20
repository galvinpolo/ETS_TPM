import 'package:flutter/material.dart';

class MembersScreen extends StatelessWidget {
  final List<Map<String, String>> members = [
    {"nama": "Amri Fikri Akbar", "nim": "123220172"},
    {"nama": "Galvin Suryo Asmoro", "nim": "123220125"},
    {"nama": "Aryadeva B.S", "nim": "123220186"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Daftar Anggota")),
      body: ListView.builder(
        itemCount: members.length,
        itemBuilder: (context, index) {
          final member = members[index];
          return ListTile(
            leading: CircleAvatar(child: Text(member['nama']![0])),
            title: Text(member['nama']!),
            subtitle: Text("NIM: ${member['nim']}"),
          );
        },
      ),
    );
  }
}
