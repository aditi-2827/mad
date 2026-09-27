int sumOfDigits(int number) {
  if (number < 10) {
    return number;
  }

  return (number % 10) + sumOfDigits(number ~/ 10);
}

void main() {
  int number = 58321;

  int result = sumOfDigits(number);

  print('Number: $number');
  print('Sum of digits: $result');
}