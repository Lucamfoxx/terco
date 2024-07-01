import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class MeditationsScreen extends StatelessWidget {
  final List<Map<String, String>> meditations = [
    {
      'title': 'Meditação do Mistério Gozoso: A Anunciação',
      'description': 'Reflexão sobre a anunciação do anjo Gabriel a Maria.',
      'audioUrl': 'https://example.com/audio/anunciacao.mp3',
    },
    {
      'title': 'Meditação do Mistério Doloroso: A Agonia no Jardim',
      'description':
          'Reflexão sobre a agonia de Jesus no Jardim das Oliveiras.',
      'audioUrl': 'https://example.com/audio/agonia.mp3',
    },
    // Adicione mais meditações aqui
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meditações Guiadas por Voz'),
      ),
      body: ListView.builder(
        itemCount: meditations.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.all(8.0),
            child: ListTile(
              leading: Icon(Icons.play_circle_fill),
              title: Text(meditations[index]['title']!),
              subtitle: Text(meditations[index]['description']!),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        MeditationDetailScreen(meditation: meditations[index]),
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

class MeditationDetailScreen extends StatefulWidget {
  final Map<String, String> meditation;

  MeditationDetailScreen({required this.meditation});

  @override
  _MeditationDetailScreenState createState() => _MeditationDetailScreenState();
}

class _MeditationDetailScreenState extends State<MeditationDetailScreen> {
  late AudioPlayer _audioPlayer;
  bool isPlaying = false;

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  void _togglePlayPause() {
    if (isPlaying) {
      _audioPlayer.pause();
    } else {
      _audioPlayer.play(UrlSource(widget.meditation['audioUrl']!));
    }
    setState(() {
      isPlaying = !isPlaying;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.meditation['title']!),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.meditation['description']!,
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton.icon(
                onPressed: _togglePlayPause,
                icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow),
                label: Text(isPlaying ? 'Pausar' : 'Reproduzir'),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () {
                // Lógica para marcar como favorito
              },
              icon: Icon(Icons.favorite),
              label: Text('Favoritar'),
            ),
            SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () {
                // Lógica para baixar o áudio
              },
              icon: Icon(Icons.download),
              label: Text('Baixar para Offline'),
            ),
          ],
        ),
      ),
    );
  }
}
