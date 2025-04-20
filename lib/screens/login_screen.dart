import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  String? _error;

  void _login() {
    final username = _usernameController.text.trim();
    final password = _passwordController.text;

    if (username == "admin" && password == "1234") {
      Navigator.pushReplacementNamed(context, '/home');
    } else {
      setState(() {
        _error = "Username atau password salah!";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Icon(Icons.lock, size: 100, color: Colors.blue),
                SizedBox(height: 20),
                Text("Login", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                if (_error != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    child: Text(_error!, style: TextStyle(color: Colors.red)),
                  ),
                TextField(
                  controller: _usernameController,
                  decoration: InputDecoration(labelText: "Username"),
                ),
                TextField(
                  controller: _passwordController,
                  decoration: InputDecoration(labelText: "Password"),
                  obscureText: true,
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _login,
                  child: Text("Masuk"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
