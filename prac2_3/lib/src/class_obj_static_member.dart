class Student {
  String name;
  int rollNo;

  Student(this.name, this.rollNo);

  static String college = 'Jai Hind College';

  void displayDetails() {
    print('Name: $name');
    print('Roll No: $rollNo');
    print('College: $college');
  }
}

void main() {
  Student student = Student('Aditi', 24);

  student.displayDetails();

  print('College: ${Student.college}');
}