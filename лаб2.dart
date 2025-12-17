// Інтерфейс (абстрактний клас)
abstract class GardenTree {
  int get id;
  int get age;
  bool get isFruitBearing;

  void grow();
  bool needTransplant();
  String getInfo();
}

// Базовий клас з автоматичною нумерацією
abstract class BaseTree implements GardenTree {
  static int _counter = 0;

  @override
  final int id;

  @override
  int age;

  @override
  bool isFruitBearing;

  BaseTree(this.age, this.isFruitBearing) : id = ++_counter;

  @override
  void grow() {
    age++;
  }

  @override
  String getInfo() {
    return 'Дерево №$id | Вік: $age | Плодоносить: $isFruitBearing';
  }
}

// Клас Яблуня
class AppleTree extends BaseTree {
  AppleTree(int age, bool isFruitBearing) : super(age, isFruitBearing);

  @override
  bool needTransplant() {
    return age > 10 && !isFruitBearing;
  }
}

// Клас Вишня
class CherryTree extends BaseTree {
  CherryTree(int age, bool isFruitBearing) : super(age, isFruitBearing);

  @override
  bool needTransplant() {
    return age > 8 && !isFruitBearing;
  }
}

// Клас Груша
class PearTree extends BaseTree {
  PearTree(int age, bool isFruitBearing) : super(age, isFruitBearing);

  @override
  bool needTransplant() {
    return age > 12 && !isFruitBearing;
  }
}

// Головна функція
void main() {
  List<GardenTree> trees = [
    AppleTree(12, false),
    CherryTree(6, true),
    PearTree(15, false),
  ];

  for (var tree in trees) {
    print(tree.getInfo());
    print(
      tree.needTransplant()
          ? '➡ Потрібна пересадка'
          : '✔ Пересадка не потрібна',
    );
    print('------------------------');
  }
}
