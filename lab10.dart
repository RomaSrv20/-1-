import 'package:flutter/material.dart';

void main() {
  runApp(const ScientistsApp());
}

class ScientistsApp extends StatelessWidget {
  const ScientistsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Світові вчені',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const ScientistsListPage(),
    );
  }
}

class ScientistsListPage extends StatefulWidget {
  const ScientistsListPage({super.key});

  @override
  State<ScientistsListPage> createState() => _ScientistsListPageState();
}

class _ScientistsListPageState extends State<ScientistsListPage> {
  // Індекс вибраного елемента
  int? selectedIndex;

  // Дані про вчених
  final List<Map<String, String>> scientists = [
    {
      'name': 'Альберт Ейнштейн',
      'description': 'Теорія відносності, фізик',
      'image': 'https://upload.wikimedia.org/wikipedia/commons/d/d3/Albert_Einstein_Head.jpg'
    },
    {
      'name': 'Ісаак Ньютон',
      'description': 'Закони руху та гравітація, фізик',
      'image': 'https://upload.wikimedia.org/wikipedia/commons/d/d1/Sir_Isaac_Newton_%281642-1727%29.jpg'
    },
    {
      'name': 'Марія Кюрі',
      'description': 'Радіоактивність, хімік та фізик',
      'image': 'https://upload.wikimedia.org/wikipedia/commons/6/69/Marie_Curie_c1920.jpg'
    },
    {
      'name': 'Чарльз Дарвін',
      'description': 'Теорія еволюції, біолог',
      'image': 'https://upload.wikimedia.org/wikipedia/commons/8/8e/Charles_Darwin_by_G._Richmond.jpg'
    },
    {
      'name': 'Нікола Тесла',
      'description': 'Електротехнік, винахідник',
      'image': 'https://upload.wikimedia.org/wikipedia/commons/d/d4/N.Tesla.JPG'
    },
    {
      'name': 'Стівен Гокінг',
      'description': 'Космолог, чорні діри',
      'image': 'https://upload.wikimedia.org/wikipedia/commons/e/eb/Stephen_Hawking.StarChild.jpg'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Світові вчені')),
      body: ListView.builder(
        itemCount: scientists.length,
        itemBuilder: (context, index) {
          final scientist = scientists[index];
          final isSelected = selectedIndex == index;

          return GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index; // вибір елемента
              });
            },
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: isSelected ? Colors.blue[100] : Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                    color: isSelected ? Colors.blue : Colors.grey.shade300,
                    width: 2),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade300,
                    blurRadius: 3,
                    offset: const Offset(2, 2),
                  )
                ],
              ),
              child: Row(
                children: [
                  // Зображення
                  ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.network(
                      scientist['image']!,
                      width: 60,
                      height: 60,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 10),
                  // Текстова інформація
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          scientist['name']!,
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          scientist['description']!,
                          style: const TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                  // Іконка вибору
                  if (isSelected)
                    const Icon(Icons.check_circle, color: Colors.green)
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
