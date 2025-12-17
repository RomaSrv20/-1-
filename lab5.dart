import 'dart:async';

// ====================
// Клас День
// ====================
class Day {
  String _dayName;
  int _visitors;
  String _comment;

  Day(this._dayName, this._visitors, this._comment);

  String get dayName => _dayName;
  int get visitors => _visitors;
  String get comment => _comment;

  set dayName(String value) => _dayName = value;
  set visitors(int value) => _visitors = value;
  set comment(String value) => _comment = value;

  @override
  String toString() =>
      '$dayName: $visitors відвідувачів, коментар: "$comment"';
}

// ====================
// Generic клас
// ====================
class GenericCollection<T> {
  List<T> _items = [];

  void add(T item) {
    _items.add(item);
  }

  List<T> get items => _items;

  // ---------- Generic методи ----------
  T getFirst<T>(List<T> list) {
    return list.first;
  }

  List<T> filterItems<T>(
      List<T> list, bool Function(T element) condition) {
    return list.where(condition).toList();
  }

  void printAll<T>(List<T> list) {
    for (var item in list) {
      print(item);
    }
  }
}

// ====================
// Клас Виставка
// ====================
class Exhibition {
  String _title;
  String _artistSurname;
  GenericCollection<Day> _days = GenericCollection<Day>();

  Exhibition(this._title, this._artistSurname);

  String get title => _title;
  String get artistSurname => _artistSurname;
  List<Day> get days => _days.items;

  set title(String value) => _title = value;
  set artistSurname(String value) => _artistSurname = value;

  void addDay(Day day) {
    _days.add(day);
  }

  int totalVisitors() {
    return days.fold(0, (sum, day) => sum + day.visitors);
  }

  Day minVisitorsDay() {
    return days.reduce((a, b) => a.visitors < b.visitors ? a : b);
  }

  List<String> commentsWithWord(String word) {
    return days
        .where((day) => day.comment.toLowerCase().contains(word.toLowerCase()))
        .map((day) => day.comment)
        .toList();
  }
}

// ====================
// Функції, які повертають Future
// ====================

// 1. Створює Future за допомогою конструктора Future.value (перший вид)
Future<Day> getFirstDayFuture(Day day) {
  return Future.value(day); // миттєвий Future
}

// 2. Створює Future за допомогою конструктора Future.delayed (другий вид)
Future<Day> getDelayedDayFuture(Day day, int milliseconds) {
  return Future.delayed(Duration(milliseconds: milliseconds), () => day);
}

// ====================
// Асинхронна функція з обробкою помилок
// ====================
Future<void> processDays() async {
  try {
    Day day1 = Day('Понеділок', 120, 'Дуже цікава виставка');
    Day day2 = Day('Вівторок', 80, 'Мало людей, але гарні картини');

    // Викликаємо Future-повертаючі функції послідовно
    Day firstDay = await getFirstDayFuture(day1);
    print('Отримали day1 через Future.value: $firstDay');

    Day delayedDay = await getDelayedDayFuture(day2, 1000);
    print('Отримали day2 через Future.delayed: $delayedDay');

  } catch (e) {
    print('Сталася помилка: $e');
  }
}

// ====================
// main()
// ====================
void main() async {
  Exhibition exhibition =
      Exhibition('Сучасне мистецтво', 'Петренко');

  exhibition.addDay(Day('Понеділок', 120, 'Дуже цікава виставка'));
  exhibition.addDay(Day('Вівторок', 80, 'Мало людей, але гарні картини'));
  exhibition.addDay(Day('Середа', 150, 'Цікава експозиція і художник'));
  exhibition.addDay(Day('Четвер', 60, 'Мало відвідувачів'));

  print('Назва виставки: ${exhibition.title}');
  print('Художник: ${exhibition.artistSurname}');
  print('Сумарна кількість відвідувачів: ${exhibition.totalVisitors()}');

  Day minDay = exhibition.minVisitorsDay();
  print(
      'Найменше відвідувачів: ${minDay.dayName} (${minDay.visitors})');

  print('Коментарі зі словом "цікава":');
  for (var comment in exhibition.commentsWithWord('цікава')) {
    print('- $comment');
  }

  print('\n=== Асинхронна обробка Future ===');
  await processDays(); // виклик асинхронної функції
}
