//Function With Parameter and Without Return Type

void calculateDiscount(double price, double discount) {
  double finalPrice = price - (price * discount / 100);

  print('Original Price: ₹$price');
  print('Discount: $discount%');
  print('Final Price: ₹$finalPrice');
}

void main() {
  calculateDiscount(1000, 10);
}