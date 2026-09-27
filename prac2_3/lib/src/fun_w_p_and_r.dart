//Function With Parameter and With Return Type
int calculateTotal(int price, int quantity) {
  return price * quantity;
}

void main() {
  int price = 500;
  int quantity = 3;

  int total = calculateTotal(price, quantity);

  print('Price: ₹$price');
  print('Quantity: $quantity');
  print('Total: ₹$total');
}