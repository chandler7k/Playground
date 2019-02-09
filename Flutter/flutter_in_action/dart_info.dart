void main() {
  final name = "noobs";
  print('$name');
  int lineCount;
  assert(lineCount == null);
  
  var one = int.parse('1');
  print('$one');
  String oneAsString = one.toString();
  print('$oneAsString');
  
  const aNumString = 0;
  print('$aNumString');
  
  for (int i = 0; i < 5; i++) {
    print('hello ${i + 1}');
  }
  
//   Future.delayed(new Duration(seconds: 2){
//     return "hi world";
//   }).then((data){
//     print(data);
//   });
  
  Future.delayed(new Duration(seconds: 2), (){
    throw AssertionError("Error");
  }).then((data){
    print("success");
  }).catchError((e){
    print(e);
  }).whenComplete((){
		print('hello done');
  });
  
  Future.delayed(new Duration(seconds: 2), (){
    throw AssertionError("error");
  }).then((data){
    print("success");
  }, onError: (e){
    print(e);
  });
  
  Future.wait([
    Future.delayed(new Duration(seconds: 2), (){
      return "hello";
    }),
    Future.delayed(new Duration(seconds: 4), (){
      return " world";
    })
  ]).then((results){
    print(results[0]+results[1]);
  }).catchError((e){
    print(e);
  });
  
//   typedef bool CALLBACK();
  
//   bool isNoble(){
//     return false;
//   }
  
//   void test(CALLBACK cb){
//     print(cb());
//   }
  
//   test(isNoble
  Stream.fromFutures([
    Future.delayed(new Duration(seconds: 1),(){
      return "hello 1";
    }),
    Future.delayed(new Duration(seconds: 2),(){
      throw AssertionError("Error");
    }),
    Future.delayed(new Duration(seconds: 3), (){
      return "hello 3";
    })
  ]).listen((data){
    print(data);
  },onError: (e){
    print(e.message);
  },onDone:(){
    
  });
}

