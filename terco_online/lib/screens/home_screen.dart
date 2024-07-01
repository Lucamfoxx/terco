import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../widgets/bead.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isDarkMode = false;
  String _crossImage = 'assets/cruz_light.png';
  int _rosaryProgress = 0;

  @override
  void initState() {
    super.initState();
    _loadTheme();
    _loadProgress();
  }

  Future<void> _toggleTheme() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _isDarkMode = !_isDarkMode;
      _crossImage =
          _isDarkMode ? 'assets/cruz_dark.png' : 'assets/cruz_light.png';
      prefs.setBool('isDarkMode', _isDarkMode);
    });
  }

  void _resetPage() {
    Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
  }

  Future<void> _loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _isDarkMode = prefs.getBool('isDarkMode') ?? false;
      _crossImage =
          _isDarkMode ? 'assets/cruz_dark.png' : 'assets/cruz_light.png';
    });
  }

  Future<void> _loadProgress() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _rosaryProgress = prefs.getInt('rosaryProgress') ?? 0;
    });
  }

  void _incrementProgress() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _rosaryProgress++;
      prefs.setInt('rosaryProgress', _rosaryProgress);
    });
  }

  void _decrementProgress() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      if (_rosaryProgress > 0) {
        _rosaryProgress--;
        prefs.setInt('rosaryProgress', _rosaryProgress);
      }
    });
  }

  void _saveProgress() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('rosaryProgress', _rosaryProgress);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Progresso salvo com sucesso!')),
    );
    Navigator.pushNamed(context, '/progress');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Terço Online',
          style: TextStyle(color: _isDarkMode ? Colors.white : Colors.black),
        ),
        backgroundColor: _isDarkMode ? Colors.grey[900] : Colors.white,
        actions: [
          IconButton(
            icon: Icon(_isDarkMode ? Icons.wb_sunny : Icons.nightlight_round),
            onPressed: _toggleTheme,
          ),
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: _resetPage,
          ),
        ],
      ),
      body: HomeScreenBody(
        isDarkMode: _isDarkMode,
        crossImage: _crossImage,
        rosaryProgress: _rosaryProgress,
        incrementProgress: _incrementProgress,
        decrementProgress: _decrementProgress,
        saveProgress: _saveProgress,
      ),
      bottomNavigationBar: HomeScreenBottomNavigationBar(),
    );
  }
}

class HomeScreenBody extends StatelessWidget {
  final bool isDarkMode;
  final String crossImage;
  final int rosaryProgress;
  final VoidCallback incrementProgress;
  final VoidCallback decrementProgress;
  final VoidCallback saveProgress;

  HomeScreenBody({
    required this.isDarkMode,
    required this.crossImage,
    required this.rosaryProgress,
    required this.incrementProgress,
    required this.decrementProgress,
    required this.saveProgress,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: isDarkMode ? Colors.grey[900] : Colors.white,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 10),
            Text(
              'Terços rezados: $rosaryProgress',
              style: TextStyle(
                fontSize: 14,
                color: isDarkMode ? Colors.white : Colors.black,
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(Icons.remove),
                  onPressed: decrementProgress,
                ),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: incrementProgress,
                ),
                TextButton(
                  onPressed: saveProgress,
                  child: Text('Salvar', style: TextStyle(color: Colors.blue)),
                ),
              ],
            ),
            SizedBox(height: 20),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                reverse: true,
                child: Column(
                  children: [
                    ...buildRosary(),
                    SizedBox(height: 20),
                    Image.asset(crossImage, height: 100),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HomeScreenBottomNavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      onTap: (index) {
        switch (index) {
          case 0:
            Navigator.pushNamed(context, '/prayerGuide');
            break;
          case 1:
            Navigator.pushNamed(context, '/meditations');
            break;
          case 2:
            Navigator.pushNamed(context, '/mysteries');
            break;
          case 3:
            Navigator.pushNamed(context, '/progress');
            break;
        }
      },
      items: [
        BottomNavigationBarItem(
          label: 'Guia',
          icon: Icon(Icons.book),
        ),
        BottomNavigationBarItem(
          label: 'Meditações',
          icon: Icon(Icons.headset),
        ),
        BottomNavigationBarItem(
          label: 'Mistérios',
          icon: Icon(Icons.movie),
        ),
        BottomNavigationBarItem(
          label: 'Progresso',
          icon: Icon(Icons.bar_chart),
        ),
      ],
    );
  }
}
