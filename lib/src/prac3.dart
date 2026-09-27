//Implement Any Simple Class with Object Utilization and Also Show the Usage of Static Member

class Student {
  String name = "Aditi";

  static String college = "Jai Hind";

  void display() {
    print(name);
    print(college);
  }
}

void main() {
  Student s = Student();
  s.display();

  print(Student.college);
}


//mplement Single Inheritance
class Animal {
  void eat() {
    print("Animal eats");
  }
}

class Dog extends Animal {
  void bark() {
    print("Dog barks");
  }
}

void main() {
  Dog d = Dog();

  d.eat();
  d.bark();
}

//Implement Multi Level Inheritance
class Animal {
  void eat() {
    print("Eating");
  }
}

class Dog extends Animal {
  void bark() {
    print("Barking");
  }
}

class Puppy extends Dog {
  void play() {
    print("Playing");
  }
}

void main() {
  Puppy p = Puppy();

  p.eat();
  p.bark();
  p.play();
}

//Implement Multiple Interface
class A {
  void showA() {
    print("A");
  }
}

class B {
  void showB() {
    print("B");
  }
}

class C implements A, B {
  @override
  void showA() {
    print("A");
  }

  @override
  void showB() {
    print("B");
  }
}

void main() {
  C obj = C();

  obj.showA();
  obj.showB();
}


//Implement the Concept of Mixin
mixin Animal {
  void eat() {
    print("Eating");
  }
}

class Dog with Animal {
  void bark() {
    print("Barking");
  }
}

void main() {
  Dog d = Dog();

  d.eat();
  d.bark();
}