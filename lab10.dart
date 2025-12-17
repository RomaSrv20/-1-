import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Світові вчені',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ScientistListScreen(),
    );
  }
}

class Scientist {
  final String name;
  final String description;
  final String imageUrl;

  const Scientist({
    required this.name,
    required this.description,
    required this.imageUrl,
  });
}

class ScientistListScreen extends StatelessWidget {
  const ScientistListScreen({super.key});

  final List<Scientist> scientists = const [
    Scientist(
      name: 'Альберт Ейнштейн',
      description: 'Теорія відносності, лауреат Нобелівської премії з фізики.',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/d/d3/Albert_Einstein_Head.jpg',
    ),
    Scientist(
      name: 'Ісаак Ньютон',
      description: 'Закони руху та всесвітнього тяжіння.',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/3/39/GodfreyKneller-IsaacNewton-1689.jpg',
    ),
    Scientist(
      name: 'Марія Кюрі',
      description: 'Радіоактивність, двічі лауреат Нобелівської премії.',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/6/69/Marie_Curie_c1920.jpg',
    ),
    Scientist(
      name: 'Галілео Галілей',
      description: 'Астрономія, телескопічні відкриття.',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/5/5a/Galileo_Galilei_2.jpg',
    ),
    Scientist(
      name: 'Чарльз Дарвін',
      description: 'Теорія еволюції, природний відбір.',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/5/58/Charles_Darwin_by_Julia_Margaret_Cameron_2.jpg',
    ),
    Scientist(
      name: 'Нікола Тесла',
      description: 'Електротехніка, винахідник змінного струму.',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/d/d4/N.Tesla.JPG',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Світові вчені'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: scientists.length,
        itemBuilder: (context, index) {
          final scientist = scientists[index];

          return Card(
            margin: const EdgeInsets.all(8),
            child: ListTile(
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: Image.network(
                  scientist.imageUrl,
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return const Icon(Icons.person, size: 50);
                  },
                ),
              ),
              title: Text(
                scientist.name,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(scientist.description),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                    title: Text(scientist.name),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.network(
                          scientist.imageUrl,
                          height: 200,
                          errorBuilder: (context, error, stackTrace) {
                            return const Icon(Icons.person, size: 100);
                          },
                        ),
                        const SizedBox(height: 12),
                        Text(scientist.description),
                      ],
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text('Закрити'),
                      ),
                    ],
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
