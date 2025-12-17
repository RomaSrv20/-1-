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
}

// ====================
// GENERIC КЛАС КОЛЕКЦІЇ
// ====================
class GenericCollection<T> {
  List<T> _items = [];

  void add(T item) {
    _items.add(item);
  }

  List<T> get items => _items;

  // ---------- GENERIC МЕТОД 1 ----------
  T getFirst<T>(List<T> list) {
    return list.first;
  }

  // ---------- GENERIC МЕТОД 2 ----------
  List<T> filterItems<T>(
      List<T> list, bool Function(T element) condition) {
    return list.where(condition).toList();
  }

  // ---------- GENERIC МЕТОД 3 ----------
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

  // Сумарна кількість відвідувачів
  int totalVisitors() {
    int sum = 0;
    for (var day in days) {
      sum += day.visitors;
    }
    return sum;
  }

  // День з мінімальною кількістю відвідувачів
  Day minVisitorsDay() {
    Day minDay = days.first;
    for (var day in days) {
      if (day.visitors < minDay.visitors) {
        minDay = day;
      }
    }
    return minDay;
  }

  // Коментарі з певним словом
  List<String> commentsWithWord(String word) {
    List<String> result = [];
    for (var day in days) {
      if (day.comment.toLowerCase().contains(word.toLowerCase())) {
        result.add(day.comment);
      }
    }
    return result;
  }
}

// ====================
// main()
// ====================
void main() {
  Exhibition exhibition =
      Exhibition('Сучасне мистецтво', 'Петренко');

  exhibition.addDay(
      Day('Понеділок', 120, 'Дуже цікава виставка'));
  exhibition.addDay(
      Day('Вівторок', 80, 'Мало людей, але гарні картини'));
  exhibition.addDay(
      Day('Середа', 150, 'Цікава експозиція і художник'));
  exhibition.addDay(
      Day('Четвер', 60, 'Мало відвідувачів'));

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
}
