import 'package:flutter/material.dart';

class PrayerGuideScreen extends StatelessWidget {
  final List<Map<String, String>> prayers = [
    {
      'title': 'Pai Nosso',
      'prayer': '''
Pai nosso que estais nos céus,
santificado seja o vosso nome;
venha a nós o vosso reino;
seja feita a vossa vontade
assim na terra como no céu;
o pão nosso de cada dia nos dai hoje;
perdoai-nos as nossas ofensas,
assim como nós perdoamos a quem nos tem ofendido;
e não nos deixeis cair em tentação,
mas livrai-nos do mal.
Amém.
''',
    },
    {
      'title': 'Ave Maria',
      'prayer': '''
Ave Maria, cheia de graça,
o Senhor é convosco;
bendita sois vós entre as mulheres,
e bendito é o fruto do vosso ventre, Jesus.
Santa Maria, Mãe de Deus,
rogai por nós pecadores,
agora e na hora da nossa morte.
Amém.
''',
    },
    {
      'title': 'Glória ao Pai',
      'prayer': '''
Glória ao Pai, ao Filho e ao Espírito Santo,
como era no princípio, agora e sempre.
Amém.
''',
    },
    {
      'title': 'Credo',
      'prayer': '''
Creio em Deus Pai todo-poderoso,
criador do céu e da terra;
e em Jesus Cristo, seu único Filho, nosso Senhor,
que foi concebido pelo poder do Espírito Santo;
nasceu da Virgem Maria;
padeceu sob Pôncio Pilatos;
foi crucificado, morto e sepultado;
desceu à mansão dos mortos;
ressuscitou ao terceiro dia;
subiu aos céus;
está sentado à direita de Deus Pai todo-poderoso,
de onde há de vir a julgar os vivos e os mortos.
Creio no Espírito Santo;
na santa Igreja Católica;
na comunhão dos santos;
na remissão dos pecados;
na ressurreição da carne;
na vida eterna.
Amém.
''',
    },
    // Adicione mais orações aqui
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Guia Interativo de Orações'),
        actions: [
          IconButton(
            icon: Icon(Icons.home),
            onPressed: () {
              Navigator.popUntil(context, ModalRoute.withName('/'));
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: prayers.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.all(8.0),
            child: ListTile(
              leading: Icon(Icons.bookmark),
              title: Text(prayers[index]['title']!),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        PrayerDetailScreen(prayer: prayers[index]),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class PrayerDetailScreen extends StatelessWidget {
  final Map<String, String> prayer;

  PrayerDetailScreen({required this.prayer});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(prayer['title']!),
        actions: [
          IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Text(
                  prayer['prayer']!,
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.popUntil(context, ModalRoute.withName('/'));
              },
              icon: Icon(Icons.home),
              label: Text('Voltar ao Terço'),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
