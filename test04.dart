// ! Dart类库有非常多的返回Future或者Stream对象的函数。 这些函数被称为异步函数：它们只会在设置好一些耗时操作之后返回，而不是等到这个操作完成。
// ! async和await关键词支持了异步编程，允许您写出和同步代码很像的异步代码

void main() {

  // ! Future与JavaScript中的Promise非常相似.
  // ! 使用Future.delayed 创建了一个延时任务（实际场景会是一个真正的耗时任务，比如一次网络请求），即2秒后返回结果字符串"hi world!"，然后我们在then中接收异步结果并打印结果
  Future.delayed(Duration(seconds: 2), (){
    return 'hi 刘彦琦';
  }).then((data) {
    print(data);
  });

  // ! 如果异步任务发生错误，我们可以在catchError中捕获错误
  Future.delayed(Duration(seconds: 3), (){
    throw AssertionError('catchError接收报错');
  }).then((data) {
    print('success');
  }).catchError((e) {
    print(e);
  });

  // ! then方法还有一个可选参数onError，我们也可以用它来捕获异常
  Future.delayed(Duration(seconds: 4), (){
    throw AssertionError('onError接收报错');
  }).then((data) {
    print(data);
  }, onError: (e) {
    print(e);
  });

  // ! 有时，我们会遇到无论异步任务执行成功或失败都需要做一些事的场景，比如在网络请求前弹出加载对话框，在请求结束后关闭对话框。这种场景，有两种方法，第一种是分别在then或catch中关闭一下对话框，第二种就是使用Future的whenComplete回调
  Future.delayed(Duration(seconds: 5), (){
    throw AssertionError('Error');
  }).then((data) {
    // 执行成功会走到这里
    print(data);
  }).catchError((e) {
    // 执行失败会走到这里
    print(e);
  }).whenComplete(() {
    // 无论成功失败都会走到这里
    print('无论成功失败都会走到这里');
  });

  // ! Future.wait 接受一个Future数组参数，只有数组中所有Future都执行成功后，才会触发then的成功回调，只要有一个Future执行失败，就会触发错误回调。
  Future.wait([
    Future.delayed(Duration(seconds: 6), () {
      return 'Hello';
    }),
    Future.delayed(Duration(seconds: 7), () {
      return 'World';
    })
  ]).then((res) {
    print(res[0] + res[1]);
  }).catchError((e) {
    print(e);
  });

  // ! Stream 也是用于接收异步事件数据，和 Future 不同的是，它可以接收多个异步操作的结果（成功或失败）。 也就是说，在执行异步任务时，可以通过多次触发成功或失败事件来传递结果数据或错误异常。 Stream 常用于会多次读取数据的异步任务场景，如网络内容下载、文件读写等。
  Stream.fromFutures([
    // 返回结果
    Future.delayed(Duration(seconds: 8), () {
      return 'stream1 success';
    }),
    // 抛出异常
    Future.delayed(Duration(seconds: 9), () {
      throw ArgumentError('stream2 error');
    })
  ]).listen((data) {
    print(data);
  }, onError: (e) {
    print(e.message);
  }, onDone: () {

  });
}
