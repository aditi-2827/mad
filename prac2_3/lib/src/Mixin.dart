mixin NotificationMixin {
  void sendNotification(String message) {
    print('Notification: $message');
  }
}

class Student with NotificationMixin {
  void login() {
    print('Student logged in');
  }
}

void main() {
  Student student = Student();

  student.login();
  student.sendNotification('Assignment submission is tomorrow');
}