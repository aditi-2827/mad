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

class GraduateStudent extends Student {
  void displayProject(String project) {
    print('Project: $project');
  }
}

void main() {
  GraduateStudent student = GraduateStudent();

  student.displayName('Aditi');
  student.displayCourse('B.Sc. IT');
  student.displayProject('Codeoscope');
}