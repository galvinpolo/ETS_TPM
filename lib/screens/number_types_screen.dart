import 'package:flutter/material.dart';
import 'dart:math';

class NumberTypesScreen extends StatefulWidget {
  @override
  _NumberTypesScreenState createState() => _NumberTypesScreenState();
}

class _NumberTypesScreenState extends State<NumberTypesScreen> {
  final TextEditingController _controller = TextEditingController();
  String _result = "";

  void _checkNumberType() {
    final input = _controller.text.trim();

    if (input.isEmpty) {
      setState(() {
        _result = "Silakan masukkan angka.";
      });
      return;
    }

    final number = num.tryParse(input);
    if (number == null) {
      setState(() {
        _result = "Input bukan angka yang valid.";
      });
      return;
    }

    List<String> types = [];

    if (number is int || number == number.roundToDouble()) {
      // Bilangan bulat
      if (number >= 0) {
        types.add("Bulat Positif");
        if (number != 0) types.add("Cacah");
      } else {
        types.add("Bulat Negatif");
      }

      // Bilangan prima
      if (number is int && number > 1) {
        if (_isPrime(number.toInt())) types.add("Prima");
      }
    } else {
      types.add("Desimal");
    }

    setState(() {
      _result = "Jenis Bilangan:\n- " + types.join("\n- ");
    });
  }

  bool _isPrime(int n) {
    if (n <= 1) return false;
    for (int i = 2; i <= sqrt(n).toInt(); i++) {
      if (n % i == 0) return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Jenis Bilangan")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(labelText: "Masukkan angka"),
              keyboardType: TextInputType.numberWithOptions(decimal: true),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _checkNumberType,
              child: Text("Cek Jenis Bilangan"),
            ),
            SizedBox(height: 30),
            Text(
              _result,
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
