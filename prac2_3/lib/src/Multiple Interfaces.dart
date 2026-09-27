abstract class Printable {
  void printDetails();
}

abstract class Contactable {
  void showContact();
}

class Student implements Printable, Contactable {
  @override
  void printDetails() {
    print('Name: Aditi');
    print('Course: B.Sc. IT');
  }

  @override
  void showContact() {
    print('Email: aditi@gmail.com');
  }
}

void main() {
  Student student = Student();

  student.printDetails();
  student.showContact();
}