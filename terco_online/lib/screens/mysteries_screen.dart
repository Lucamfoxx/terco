import 'package:flutter/material.dart';

class MysteriesScreen extends StatelessWidget {
  final List<Map<String, dynamic>> mysteries = [
    {
      'title': 'Mistérios Gozosos',
      'description':
          'Anunciação, Visitação, Nascimento de Jesus, Apresentação de Jesus no Templo, Perda e Encontro de Jesus no Templo',
      'prayers': [
        {
          'title': 'A Anunciação do Anjo a Nossa Senhora',
          'prayer':
              'O Anjo do Senhor anunciou a Maria. E Ela concebeu do Espírito Santo. Ave Maria...'
        },
        {
          'title': 'A Visitação de Nossa Senhora a Santa Isabel',
          'prayer':
              'Bendita és tu entre as mulheres e bendito é o fruto do teu ventre. Ave Maria...'
        },
        {
          'title': 'O Nascimento de Jesus em Belém',
          'prayer':
              'E deu à luz o seu filho primogênito, envolveu-o em faixas e reclinou-o numa manjedoura. Ave Maria...'
        },
        {
          'title': 'A Apresentação de Jesus no Templo',
          'prayer': 'Meus olhos viram a tua salvação. Ave Maria...'
        },
        {
          'title': 'O Encontro de Jesus no Templo',
          'prayer':
              'Não sabíeis que eu devo estar na casa de meu Pai? Ave Maria...'
        },
      ],
    },
    {
      'title': 'Mistérios Dolorosos',
      'description':
          'Agonia no Jardim, Flagelação, Coroação de Espinhos, Carregamento da Cruz, Crucificação e Morte',
      'prayers': [
        {
          'title': 'A Agonia de Jesus no Jardim das Oliveiras',
          'prayer':
              'Pai, se é do teu agrado, afasta de mim este cálice. Contudo, não se faça a minha vontade, mas a tua. Ave Maria...'
        },
        {
          'title': 'A Flagelação de Jesus',
          'prayer':
              'Então Pilatos tomou a Jesus e mandou açoitá-lo. Ave Maria...'
        },
        {
          'title': 'A Coroação de Espinhos',
          'prayer':
              'Tece uma coroa de espinhos, puseram-na em sua cabeça e vestiram-no com um manto de púrpura. Ave Maria...'
        },
        {
          'title': 'A Subida dolorosa de Jesus ao Calvário carregando a Cruz',
          'prayer':
              'E levando a sua cruz, saiu para o lugar chamado Calvário. Ave Maria...'
        },
        {
          'title': 'A Crucificação e Morte de Jesus',
          'prayer': 'Pai, nas tuas mãos entrego o meu espírito. Ave Maria...'
        },
      ],
    },
    {
      'title': 'Mistérios Gloriosos',
      'description':
          'Ressurreição, Ascensão, Descida do Espírito Santo, Assunção de Maria, Coroação de Maria',
      'prayers': [
        {
          'title': 'A Ressurreição de Jesus',
          'prayer': 'Não está aqui, mas ressuscitou. Ave Maria...'
        },
        {
          'title': 'A Ascensão de Jesus ao Céu',
          'prayer':
              'Enquanto os abençoava, afastou-se deles e foi levado ao céu. Ave Maria...'
        },
        {
          'title': 'A Descida do Espírito Santo sobre os Apóstolos',
          'prayer': 'E todos ficaram cheios do Espírito Santo. Ave Maria...'
        },
        {
          'title': 'A Assunção de Nossa Senhora ao Céu',
          'prayer':
              'O Poderoso fez por mim maravilhas. Santo é o seu nome. Ave Maria...'
        },
        {
          'title': 'A Coroação de Nossa Senhora como Rainha do Céu e da Terra',
          'prayer':
              'Apareceu no céu um grande sinal: uma mulher vestida de sol, tendo a lua debaixo dos seus pés e na cabeça uma coroa de doze estrelas. Ave Maria...'
        },
      ],
    },
    {
      'title': 'Mistérios Luminosos',
      'description':
          'Batismo de Jesus, Auto-revelação nas Bodas de Caná, Proclamação do Reino e o Chamado à Conversão, Transfiguração, Instituição da Eucaristia',
      'prayers': [
        {
          'title': 'O Batismo de Jesus no Rio Jordão',
          'prayer':
              'Este é o meu Filho amado, em quem me comprazo. Ave Maria...'
        },
        {
          'title': 'A Auto-revelação nas Bodas de Caná',
          'prayer': 'Fazei tudo o que Ele vos disser. Ave Maria...'
        },
        {
          'title': 'O Anúncio do Reino de Deus com o Convite à Conversão',
          'prayer': 'Convertei-vos e crede no Evangelho. Ave Maria...'
        },
        {
          'title': 'A Transfiguração de Jesus',
          'prayer': 'Este é o meu Filho amado, escutai-o. Ave Maria...'
        },
        {
          'title': 'A Instituição da Eucaristia',
          'prayer': 'Tomai e comei, isto é o meu corpo. Ave Maria...'
        },
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Visualizações dos Mistérios'),
      ),
      body: ListView.builder(
        itemCount: mysteries.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(mysteries[index]['title']!),
            subtitle: Text(mysteries[index]['description']!),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      MysteryDetailScreen(mystery: mysteries[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class MysteryDetailScreen extends StatelessWidget {
  final Map<String, dynamic> mystery;

  MysteryDetailScreen({required this.mystery});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(mystery['title']!),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: mystery['prayers'].length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.symmetric(vertical: 8.0),
            child: ListTile(
              title: Text(mystery['prayers'][index]['title']),
              subtitle: Text(mystery['prayers'][index]['prayer']),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text(mystery['prayers'][index]['title']),
                      content: SingleChildScrollView(
                        child: Text(mystery['prayers'][index]['prayer']),
                      ),
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
              },
            ),
          );
        },
      ),
    );
  }
}
