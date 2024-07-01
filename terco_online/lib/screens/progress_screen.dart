import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fl_chart/fl_chart.dart';

class ProgressScreen extends StatefulWidget {
  @override
  _ProgressScreenState createState() => _ProgressScreenState();
}

class _ProgressScreenState extends State<ProgressScreen> {
  int _rosaryCount = 0;
  int _rosaryGoal = 50; // Meta de rosários

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _loadProgress();
  }

  Future<void> _loadProgress() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _rosaryCount = prefs.getInt('rosaryProgress') ?? 0;
    });
  }

  Future<void> _incrementProgress() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _rosaryCount += 1;
      prefs.setInt('rosaryProgress', _rosaryCount);
    });
  }

  Widget _buildMotivationalMessage() {
    if (_rosaryCount == 0) {
      return Text('Comece hoje a rezar o seu terço!');
    } else if (_rosaryCount < _rosaryGoal / 2) {
      return Text('Continue! Você está indo muito bem!');
    } else if (_rosaryCount < _rosaryGoal) {
      return Text('Quase lá! Mantenha o ritmo!');
    } else {
      return Text('Parabéns! Você alcançou a meta!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Monitoramento de Progresso'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Rosários rezados:',
              style: TextStyle(fontSize: 24),
            ),
            Text(
              '$_rosaryCount',
              style: TextStyle(fontSize: 48),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _incrementProgress,
              child: Text('Adicionar Rosário Rezado'),
            ),
            SizedBox(height: 40),
            Text(
              'Progresso em relação à meta de $_rosaryGoal rosários:',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 10),
            LinearProgressIndicator(
              value: _rosaryCount / _rosaryGoal,
              minHeight: 20,
              backgroundColor: Colors.grey[300],
              valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
            ),
            SizedBox(height: 20),
            if (_rosaryCount >= _rosaryGoal)
              Text(
                'Parabéns! Você alcançou a meta!',
                style: TextStyle(fontSize: 24, color: Colors.green),
              ),
            SizedBox(height: 20),
            _buildMotivationalMessage(),
            SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () {
                // Lógica para compartilhar o progresso nas redes sociais
              },
              icon: Icon(Icons.share),
              label: Text('Compartilhar Progresso'),
            ),
          ],
        ),
      ),
    );
  }
}
