void main() {
  var calculateFinalPrice = (double price, double discount) =>
  price - (price * discount / 100);

  double finalPrice = calculateFinalPrice(2500, 10);

  print('Original Price: ₹2500');
  print('Discount: 10%');
  print('Final Price: ₹$finalPrice');
}