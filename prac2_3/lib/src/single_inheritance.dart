class Person {
  void displayName(String name) {
    print('Name: $name');
  }
}

class Student extends Person {
  void displayCourse(String course) {
    print('Course: $course');
  }
}

void main() {
  Student student = Student();

  student.displayName('Aditi');
  student.displayCourse('B.Sc. IT');
}