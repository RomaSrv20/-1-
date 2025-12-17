import 'dart:math';

void main() {
  const int variant = 7;

  final double y = 4.6 * variant;
  final double z = 36.6 / variant;

  final double xStart = 1.23 * variant;
  final double xEnd = xStart + 10;
  const double dx = 1;

  // Анонімна функція b = f(x, y, z)
  final bFunc = (double x) {
    return 1
        - (x + y) / pow(z.abs(), 0.34)
        + pow(y, 2) / factorial(3)
        + pow(z, 3) / factorial(5)
        + exp(x - y) / (z + y);
  };

  // Зовнішня функція (замикання)
  Function createAFunc(double y, double z) {
    // Вкладена функція
    double a(double x) {
      final double b = bFunc(x);

      final double expression = (y - sqrt((x * x - b).abs())) *
          ((y - x * x) / (z + 4 * y * y));

      return log(pow(expression.abs(), 2 / 3));
    }

    return a;
  }

  final aFunc = createAFunc(y, z);

  print('Табулювання функції a(x) для варіанта №$variant\n');
  print('x\t\ta(x)');
  print('-----------------------------');

  for (double x = xStart; x <= xEnd; x += dx) {
    final double result = aFunc(x);
    print('${x.toStringAsFixed(2)}\t${result.toStringAsFixed(6)}');
  }
}

// Обчислення факторіалу
int factorial(int n) {
  int result = 1;
  for (int i = 1; i <= n; i++) {
    result *= i;
  }
  return result;
}
