//if-else - Used to execute code based on a condition.
void main() {
  int age = 19;

  if (age >= 18) {
    print("Adult");
  } else {
    print("Minor");
  }
}

//if else if else
void main() {
  int marks = 75;

  if (marks >= 80) {
    print("A");
  } else if (marks >= 60) {
    print("B");
  } else {
    print("C");
  }
}

//Switch Case
void main() {
  int day = 2;

  switch (day) {
    case 1:
      print("Monday");
      break;
    case 2:
      print("Tuesday");
      break;
    default:
      print("Invalid");
  }
}

//For Loop
void main() {
  for (int i = 1; i <= 5; i++) {
    print(i);
  }
}


//While Loop
void main() {
  int i = 1;

  while (i <= 5) {
    print(i);
    i++;
  }
}

//Do-While Loop
void main() {
  int i = 1;

  do {
    print(i);
    i++;
  } while (i <= 5);
}