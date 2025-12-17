// Клас День
class Day {
  String _dayName;
  int _visitors;
  String _comment;

  // Конструктор
  Day(this._dayName, this._visitors, this._comment);

  // Геттери
  String get dayName => _dayName;
  int get visitors => _visitors;
  String get comment => _comment;

  // Сеттери
  set dayName(String value) => _dayName = value;
  set visitors(int value) => _visitors = value;
  set comment(String value) => _comment = value;
}

// Клас Виставка
class Exhibition {
  String _title;
  String _artistSurname;
  List<Day> _days = [];

  // Конструктор
  Exhibition(this._title, this._artistSurname);

  // Геттери
  String get title => _title;
  String get artistSurname => _artistSurname;
  List<Day> get days => _days;

  // Сеттери
  set title(String value) => _title = value;
  set artistSurname(String value) => _artistSurname = value;

  // Додати день
  void addDay(Day day) {
    _days.add(day);
  }

  // Сумарна кількість відвідувачів
  int totalVisitors() {
    int sum = 0;
    for (var day in _days) {
      sum += day.visitors;
    }
    return sum;
  }

  // День з найменшою кількістю відвідувачів
  Day minVisitorsDay() {
    Day minDay = _days.first;
    for (var day in _days) {
      if (day.visitors < minDay.visitors) {
        minDay = day;
      }
    }
    return minDay;
  }

  // Список коментарів з певним словом
  List<String> commentsWithWord(String word) {
    List<String> result = [];
    for (var day in _days) {
      if (day.comment.contains(word)) {
        result.add(day.comment);
      }
    }
    return result;
  }
}

// main()
void main() {
  Exhibition exhibition = Exhibition(
    'Сучасне мистецтво',
    'Петренко',
  );

  exhibition.addDay(Day('Понеділок', 120, 'Дуже цікава виставка'));
  exhibition.addDay(Day('Вівторок', 80, 'Мало людей, але гарні картини'));
  exhibition.addDay(Day('Середа', 150, 'Цікава експозиція і художник'));
  exhibition.addDay(Day('Четвер', 60, 'Мало відвідувачів'));

  print('Назва виставки: ${exhibition.title}');
  print('Художник: ${exhibition.artistSurname}');
  print('Сумарна кількість відвідувачів: ${exhibition.totalVisitors()}');

  Day minDay = exhibition.minVisitorsDay();
  print(
      'Найменше відвідувачів було у день: ${minDay.dayName} (${minDay.visitors})');

  print('Коментарі зі словом "цікава":');
  for (var comment in exhibition.commentsWithWord('цікава')) {
    print('- $comment');
  }
}
