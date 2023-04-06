// ! Dart是一种真正的面向对象的语言，所以即使是函数也是对象，并且有一个类型Function。这意味着函数可以赋值给变量或作为参数传递给其他函数，这是函数式编程的典型特征。

void main() {
  
  // ! Dart函数声明如果没有显式声明返回值类型时会默认当做dynamic处理，注意，函数返回值没有类型推断
  bool isNoble (int num) => true; // 声明返回值为 bool
  isNoble(1);


  // ! 函数作为变量
  var ask = (str) {
    print(str);
  };
  ask('你学习了吗?');


  // ! 函数作为参数传递
  void execute (var callback) {
    callback();
  }
  execute(() => print('刘可最帅'));


  // ! 可选的位置参数
  String say (String from, String msg, [String? device]) {
    var result = '$from says $msg';
    if (device != null) {
      result = '$result with a $device';
    }
    return result;
  }
  var name = say('Bob', 'hi');
  print(name);
  var device = say('Bob', 'hi', 'iPhone 14 Pro');
  print(device);


  // ! 可选的命名参数
  void enableFlags ({ bool? bold, int num = 1, required bool hidden }) { // required 必填
    if (bold != null) {
      print('$bold, $num, $hidden');
    }
  }
  enableFlags(bold: true, hidden: false);
}

// ! 注意，不能同时使用可选的位置参数和可选的命名参数。