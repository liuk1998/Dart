// ! Dart 是不支持多继承的，但是它支持 mixin，简单来讲 mixin 可以 “组合” 多个类

void main() {
  
}
class Person {
  say () {
    print('say');
  }
}

mixin Eat {
  eat () {
    print('eat');
  }
}

mixin Walk {
  walk () {
    print('walk');
  }
}

mixin Code {
  code () {
    print('code');
  }
}

class Dog with Eat, Walk{}
class Man extends Person with Eat, Walk, Code{}