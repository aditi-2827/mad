import 'package:flutter_test/flutter_test.dart';
import 'package:cal_package/cal_package.dart';

void main() {
  test('Calculator operations', () {
    final calculator = Calculator();

    expect(calculator.add(2, 3), 5);
    expect(calculator.subtract(5, 2), 3);
    expect(calculator.multiply(2, 3), 6);
    expect(calculator.divide(10, 2), 5);
  });
}