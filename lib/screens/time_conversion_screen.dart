import 'package:flutter/material.dart';

class TimeConversionScreen extends StatefulWidget {
  @override
  _TimeConversionScreenState createState() => _TimeConversionScreenState();
}

class _TimeConversionScreenState extends State<TimeConversionScreen> {
  final _formKey = GlobalKey<FormState>();

  final _tahun = TextEditingController();
  final _bulan = TextEditingController();
  final _hari = TextEditingController();
  final _jam = TextEditingController();
  final _menit = TextEditingController();
  final _detik = TextEditingController();

  String _hasil = "";

  void _konversi() {
    int tahun = int.tryParse(_tahun.text) ?? 0;
    int bulan = int.tryParse(_bulan.text) ?? 0;
    int hari = int.tryParse(_hari.text) ?? 0;
    int jam = int.tryParse(_jam.text) ?? 0;
    int menit = int.tryParse(_menit.text) ?? 0;
    int detik = int.tryParse(_detik.text) ?? 0;

    int totalDetik = 
        tahun * 365 * 24 * 3600 +
        bulan * 30 * 24 * 3600 +
        hari * 24 * 3600 +
        jam * 3600 +
        menit * 60 +
        detik;

    setState(() {
      _hasil = "Total Detik: $totalDetik\n"
               "Total Menit: ${totalDetik ~/ 60}\n"
               "Total Jam: ${totalDetik ~/ 3600}";
    });
  }

  Widget _buildInput(String label, TextEditingController controller) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(labelText: label),
      keyboardType: TextInputType.number,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Konversi Waktu")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              _buildInput("Tahun", _tahun),
              _buildInput("Bulan", _bulan),
              _buildInput("Hari", _hari),
              _buildInput("Jam", _jam),
              _buildInput("Menit", _menit),
              _buildInput("Detik", _detik),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _konversi,
                child: Text("Konversi ke Total Detik"),
              ),
              SizedBox(height: 20),
              Text(_hasil, style: TextStyle(fontSize: 16)),
            ],
          ),
        ),
      ),
    );
  }
}
