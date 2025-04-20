import 'package:flutter/material.dart';
import 'dart:async';

class StopwatchScreen extends StatefulWidget {
  @override
  _StopwatchScreenState createState() => _StopwatchScreenState();
}

class _StopwatchScreenState extends State<StopwatchScreen> {
  Stopwatch _stopwatch = Stopwatch();
  Timer? _timer;

  String _formatTime(int milliseconds) {
    Duration duration = Duration(milliseconds: milliseconds);
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    String minutes = twoDigits(duration.inMinutes.remainder(60));
    String seconds = twoDigits(duration.inSeconds.remainder(60));
    String millis = (duration.inMilliseconds.remainder(1000) ~/ 10).toString().padLeft(2, '0');
    return "$minutes:$seconds:$millis";
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(milliseconds: 30), (timer) {
      setState(() {});
    });
    _stopwatch.start();
  }

  void _stopTimer() {
    _timer?.cancel();
    _stopwatch.stop();
  }

  void _resetTimer() {
    _timer?.cancel();
    _stopwatch.reset();
    setState(() {});
  }

  @override
  void dispose() {
    _timer?.cancel();
    _stopwatch.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String elapsedTime = _formatTime(_stopwatch.elapsedMilliseconds);

    return Scaffold(
      appBar: AppBar(title: Text("Stopwatch")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              elapsedTime,
              style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 30),
            Wrap(
              spacing: 20,
              children: [
                ElevatedButton(
                  onPressed: _stopwatch.isRunning ? null : _startTimer,
                  child: Text("Start"),
                ),
                ElevatedButton(
                  onPressed: _stopwatch.isRunning ? _stopTimer : null,
                  child: Text("Stop"),
                ),
                ElevatedButton(
                  onPressed: _resetTimer,
                  child: Text("Reset"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
