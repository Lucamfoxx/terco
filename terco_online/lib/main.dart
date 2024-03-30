import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      // Adicionando a rota nomeada para a tela inicial
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
      },
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isDarkMode = false;
  String _crossImage = 'assets/cruz_light.png';

  void _toggleTheme() {
    setState(() {
      _isDarkMode = !_isDarkMode;
      _crossImage = _isDarkMode ? 'assets/cruz_dark.png' : 'assets/cruz_light.png';
    });
  }

  void _showPrayerDialog(String title, String prayerText) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(prayerText),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Fechar'),
            ),
          ],
        );
      },
    );
  }

  // Função para reiniciar a página
  void _resetPage() {
    // Navegar de volta para a tela inicial
    Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
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
      body: Container(
        color: _isDarkMode ? Colors.grey[900] : Colors.white,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  reverse: true,
                  child: Column(
                    children: [
Bead(size: 30, color: Colors.blue),
Bead(size: 30, color: Colors.blue),                    
Bead(size: 30, color: Colors.blue),
Bead(size: 30, color: Colors.blue),
Bead(size: 30, color: Colors.blue),
Bead(size: 30, color: Colors.blue),
Bead(size: 30, color: Colors.blue),
Bead(size: 30, color: Colors.blue),                    
Bead(size: 30, color: Colors.blue),
Bead(size: 30, color: Colors.blue),
Bead(size: 50, color: Colors.blue),
Bead(size: 30, color: Colors.blue),
Bead(size: 30, color: Colors.blue),                    
Bead(size: 30, color: Colors.blue),
Bead(size: 30, color: Colors.blue),
Bead(size: 30, color: Colors.blue),
Bead(size: 30, color: Colors.blue),
Bead(size: 30, color: Colors.blue),
Bead(size: 30, color: Colors.blue),                    
Bead(size: 30, color: Colors.blue),
Bead(size: 30, color: Colors.blue),
Bead(size: 50, color: Colors.blue),
Bead(size: 30, color: Colors.blue),
Bead(size: 30, color: Colors.blue),                    
Bead(size: 30, color: Colors.blue),
Bead(size: 30, color: Colors.blue),
Bead(size: 30, color: Colors.blue),
Bead(size: 30, color: Colors.blue),
Bead(size: 30, color: Colors.blue),
Bead(size: 30, color: Colors.blue),                    
Bead(size: 30, color: Colors.blue),
Bead(size: 30, color: Colors.blue),
Bead(size: 50, color: Colors.blue),
Bead(size: 30, color: Colors.blue),
Bead(size: 30, color: Colors.blue),                    
Bead(size: 30, color: Colors.blue),
Bead(size: 30, color: Colors.blue),
Bead(size: 30, color: Colors.blue),
Bead(size: 30, color: Colors.blue),
Bead(size: 30, color: Colors.blue),
Bead(size: 30, color: Colors.blue),                    
Bead(size: 30, color: Colors.blue),
Bead(size: 30, color: Colors.blue),
Bead(size: 50, color: Colors.blue),
Bead(size: 30, color: Colors.blue),
Bead(size: 30, color: Colors.blue),                    
Bead(size: 30, color: Colors.blue),
Bead(size: 30, color: Colors.blue),
Bead(size: 30, color: Colors.blue),
Bead(size: 30, color: Colors.blue),
Bead(size: 30, color: Colors.blue),
Bead(size: 30, color: Colors.blue),                    
Bead(size: 30, color: Colors.blue),
Bead(size: 30, color: Colors.blue),
SizedBox(height: 20),
Image.asset('assets/santinho.png', height: 100),
SizedBox(height: 20),
Bead(size: 50, color: Colors.blue),
Bead(size: 30, color: const Color.fromARGB(255, 33, 54, 243)), 
Bead(size: 30, color: Colors.blue),
Bead(size: 30, color: Colors.blue),
Bead(size: 50, color: Colors.blue),
                      // Adicione mais beads conforme necessário
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              Image.asset(_crossImage, height: 100),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          switch (index) {
            case 0:
              _showPrayerDialog('Pai Nosso', '''

Pai Nosso que estais nos Céus, 
santificado seja o vosso Nome, 
venha a nós o vosso Reino, 
seja feita a vossa vontade 
assim na terra como no Céu. 
O pão nosso de cada dia nos dai hoje, 
perdoai-nos as nossas ofensas 
assim como nós perdoamos 
a quem nos tem ofendido, 
e não nos deixeis cair em tentação, 
mas livrai-nos do Mal.
Amén.
''');
              break;
            case 1:
              _showPrayerDialog('Ave Maria', '''
Avé Maria, cheia de graça, 
o Senhor é convosco, 
bendita sois vós entre as mulheres 
e bendito é o fruto do vosso ventre, Jesus. 
Santa Maria, Mãe de Deus, 
rogai por nós pecadores, 
agora e na hora da nossa morte. 
Ámen
''');
              break;
            case 2:
              _showPrayerDialog('Glória ao Pai', '''
Glória ao Pai e ao Filho 
e ao Espírito Santo. 
Como era, no princípio, 
agora e sempre. 
Ámen.''');
              break;            
            case 3:
              _showPrayerDialog('Credo', '''
Creio em Deus, Pai todo-poderoso, Criador do Céu e da Terra

E em Jesus Cristo, seu único Filho, nosso Senhor
que foi concebido pelo poder do Espírito Santo;
nasceu da Virgem Maria; 
padeceu sob Pôncio Pilatos, 
foi crucificado, morto e sepultado; 
desceu à mansão dos mortos; 
ressuscitou ao terceiro dia; 
subiu aos Céus; 
está sentado à direita de Deus Pai todo-poderoso, 
de onde há-de vir a julgar os vivos e os mortos.

Creio no Espírito Santo; 
na santa Igreja Católica; 
na comunhão dos Santos; 
na remissão dos pecados; 
na ressurreição da carne; 
e na vida eterna. Amen
''');
              break;
          }
        },
        items: [
          BottomNavigationBarItem(
            label: 'Pai Nosso',
            icon: Icon(Icons.wb_sunny),
          ),
          BottomNavigationBarItem(
            label: 'Ave Maria',
            icon: Icon(Icons.wb_sunny),
          ),
          BottomNavigationBarItem(
            label: 'Glória ao Pai',
            icon: Icon(Icons.wb_sunny),
          ),          
          BottomNavigationBarItem(
            label: 'Credo',
            icon: Icon(Icons.wb_sunny),
          ),
        ],
      ),
    );
  }
}

class Bead extends StatefulWidget {
  final double size;
  final Color color;

  const Bead({Key? key, required this.size, required this.color}) : super(key: key);

  @override
  _BeadState createState() => _BeadState();
}

class _BeadState extends State<Bead> {
  Color _currentColor = Colors.blue; 

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _currentColor = _currentColor == Colors.blue ? Colors.green : Colors.blue;
        });
      },
      child: Container(
        width: widget.size,
        height: widget.size,
        margin: EdgeInsets.all(5),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: _currentColor,
        ),
      ),
    );
  }
}
