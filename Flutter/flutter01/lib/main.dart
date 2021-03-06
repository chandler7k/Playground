import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter/widgets.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // 注册路由表
      routes: {
        "new_page":(context) => NewRouteTextField(),
        "FormTestRoute":(context) => FormTestRoute(),
        "FocusTestRoute":(context) => FocusTestRoute(),
        "echo_page":(context) => EchoRoute(),
        "context_Route":(context) => ContextRoute(),
        "couter_page":(context) => CounterWidget(),
        "SnackBarWidget":(context) => SnackBarWidget(),
        "TapBoxA":(context) => TapBoxA(),
        "ParentWidget":(context) => ParentWidget(),
        "ProgressRoute":(context) => ProgressRoute(),
        "LayoutRoute":(context) => LayoutRoute(),
        "SwitchAndCheckBoxTestRoute":(context) => SwitchAndCheckBoxTestRoute(),
        "/":(context) => MyHomePage(title: 'Flutter Demo Home Page'),
      },
//      onGenerateRoute:(RouteSettings settings) {
//        return MaterialPageRoute(builder: (context) {
//          String routeName = settings.name;
//          // 如果访问的路由页需要登录，但当前未登录，则直接返回登录页路由，
//          // 引导用户登录；其它情况则正常打开路由。
//        });
//      }
//      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            RandomWordsWidget(),
            FlatButton(
              child: Text("open new route"),
              textColor: Colors.blue,
              onPressed: (){
//                Navigator.push(context, MaterialPageRoute(
//                  builder: (context){
//                  return RouterTestRoute();
//                },
//                  fullscreenDialog: true,
//                ));
              Navigator.pushNamed(context, "LayoutRoute",);
              },
            ),

          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class LayoutRoute extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("layout"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(" hello world "),
              Text(" jack ")
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(" hello world "),
              Text(" jack ")
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            textDirection: TextDirection.rtl,
            children: <Widget>[
              Text(" hello world "),
              Text(" jack ")
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            verticalDirection: VerticalDirection.up,
            children: <Widget>[
              Text(" hello world ", style: TextStyle(fontSize: 30),),
              Text(" jack ")
            ],
          ),
        ],
      ),
    );
  }
}

class ProgressRoute extends StatefulWidget{
  @override
  _ProgressRouteState createState() => new _ProgressRouteState();

}

class _ProgressRouteState extends State<ProgressRoute> with SingleTickerProviderStateMixin{
  AnimationController _animationController;
  @override
  void initState() {
    // TODO: implement initState
    _animationController = new AnimationController(vsync: this, duration: Duration(seconds: 3));
    _animationController.forward();
    _animationController.addListener(() => setState(() => {}));
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _animationController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("hello"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(16),
              child: LinearProgressIndicator(
                backgroundColor: Colors.grey[200],
                valueColor: ColorTween(begin: Colors.grey, end: Colors.blue).animate(_animationController),
                value: _animationController.value,
              ),
            )
          ],
        ),
      ),
    );
  }
}


class FormTestRoute extends StatefulWidget{
  @override
  _FormTextRouteState createState() => new _FormTextRouteState();
}

class _FormTextRouteState extends State<FormTestRoute>{
  TextEditingController _usernameController = new TextEditingController();
  TextEditingController _pwdController = new TextEditingController();
  GlobalKey _formKey = new GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("From Test"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        child: Form(
          key: _formKey,
          autovalidate: true,
          child: Column(
            children: <Widget>[
              TextFormField(
                autofocus: true,
                controller: _usernameController,
                decoration: InputDecoration(
                  labelText: "用户名",
                  hintText: "用户名邮箱",
                  icon: Icon(Icons.person)
                ),
                validator: (v){
                  return v.trim().length > 0 ? null : "用户名不能为空";
                },
              ),
              TextFormField(
                controller: _pwdController,
                decoration: InputDecoration(
                    labelText: "密码",
                    hintText: "您的登录密码",
                    icon: Icon(Icons.lock)
                ),
                obscureText: true,
                validator: (v){
                  return v.trim().length > 5 ? null : "密码不能少于6位";
                },
              ),
              Padding(
                padding: const EdgeInsets.only(top: 28),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Builder(builder: (context){
                        return RaisedButton(
                          padding: EdgeInsets.all(15),
                          child: Text("登录"),
                          color: Theme.of(context).primaryColor,
                          textColor: Colors.white,
                          onPressed: (){
                            if((_formKey.currentState as FormState).validate()){

                            }
                          },
                        );
                      },)
                    ),
//                    SizedBox(
//                      height: 3,
//                      child: LinearProgressIndicator(
//                        backgroundColor: Colors.grey[200],
//                        valueColor: AlwaysStoppedAnimation(Colors.blue),
//                      ),
//                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );

  }
}


class FocusTestRoute extends StatefulWidget{
  @override
  _FocusTestRouteState createState() => new _FocusTestRouteState();
}

class _FocusTestRouteState extends State<FocusTestRoute>{
  FocusNode focusNode1 = new FocusNode();
  FocusNode focusNode2 = new FocusNode();
  FocusScopeNode focusScopeNode;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    focusNode1.addListener(() {
      print(focusNode1.hasFocus);
    });
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("focusnode"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            TextField(
              autofocus: true,
              focusNode: focusNode1,
              decoration: InputDecoration(
                  labelText: "input1",
                prefixIcon: Icon(Icons.person),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue)
                  )
              ),
            ),
            TextField(
              focusNode: focusNode2,//关联focusNode2
              decoration: InputDecoration(
                  labelText: "input2"
              ),
            ),
            Builder(builder: (ctx){
              return Column(
                children: <Widget>[
                  RaisedButton(
                    child: Text("移动焦点"),
                    onPressed: (){
                      if(focusScopeNode == null){
                        focusScopeNode = FocusScope.of(context);
                      }
                      focusScopeNode.requestFocus(focusNode2);
                    },
                  ),
                  RaisedButton(
                    child: Text("隐藏键盘"),
                    onPressed: (){
                      focusNode1.unfocus();
                      focusNode2.unfocus();
                    },
                  )
                ],
              );
            },),
            Theme(
              data: Theme.of(context).copyWith(
                hintColor: Colors.grey[200],
                inputDecorationTheme: InputDecorationTheme(
                  labelStyle: TextStyle(color: Colors.grey),
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 14.0)
                )
              ),
              child: Column(
                children: <Widget>[
                  TextField(
                    decoration: InputDecoration(
                        labelText: "用户名",
                        hintText: "用户名或邮箱",
                        prefixIcon: Icon(Icons.person)
                    ),
                  ),
                  TextField(
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.lock),
                        labelText: "密码",
                        hintText: "您的登录密码",
                        hintStyle: TextStyle(color: Colors.grey, fontSize: 13.0)
                    ),
                    obscureText: true,
                  )
                ],
              ),
            ),
            Container(
              child: TextField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    labelText: "Email",
                    hintText: "电子邮件地址",
                    prefixIcon: Icon(Icons.email),
                    border: InputBorder.none //隐藏下划线
                ),
              ),
              decoration: BoxDecoration(
                // 下滑线浅灰色，宽度1像素
                  border: Border(bottom: BorderSide(color: Colors.grey[200], width: 1.0))
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ParentWidget extends StatefulWidget{
  @override
  _ParentWidgetState createState() => new _ParentWidgetState();
}

class _ParentWidgetState extends State<ParentWidget>{
  bool _active = false;

  void _handleTapboxChanged(bool newValue){
    setState(() {
      _active = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
      child: TapboxC(
        active: _active,
        onChanged: _handleTapboxChanged,
      ),
//      child: new TapBoxB(
//        active: _active,
//        onChanged: _handleTapboxChanged,
//      ),
    );
  }
}


class TapboxC extends StatefulWidget{
  TapboxC({Key key, this.active: false, @required this.onChanged}):super(key:key);
  final bool active;
  final ValueChanged<bool> onChanged;
  @override
  _TapboxCState createState() => new _TapboxCState();
}

class _TapboxCState extends State<TapboxC>{
  bool _highlight = false;

  void _handleTapDown(TapDownDetails details){
    setState(() {
      _highlight = true;
    });
  }

  void _handleTapUp(TapUpDetails details){
    setState(() {
      _highlight = false;
    });
  }

  void _handleTapCancel(){
    setState(() {
      _highlight = false;
    });
  }

  void _handleTap(){
    widget.onChanged(!widget.active);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new GestureDetector(
      onTapDown: _handleTapDown,
      onTapUp: _handleTapUp,
      onTap: _handleTap,
      onTapCancel: _handleTapCancel,
      child: new Container(
        child: new Center(
          child: new Text(widget.active ? 'Active' : 'Inactive',
          style: new TextStyle(fontSize: 32, color: Colors.white),),
        ),
        width: 200.0,
        height: 200.0,
        decoration: new BoxDecoration(
          color: widget.active ? Colors.lightGreen[700] : Colors.grey[600],
          border: _highlight
              ? new Border.all(
            color: Colors.teal[700],
            width: 10.0,
          )
              : null,

        ),
      ),
    );
  }
}


class TapBoxB extends StatelessWidget{
  TapBoxB({Key key, this.active, @required this.onChanged}):super(key:key);
  final bool active;
  final ValueChanged<bool> onChanged;
  void _handleTap(){
    onChanged(!active);
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new GestureDetector(
      onTap: _handleTap,
      child: new Container(
        child: new Center(
          child: new Text(
            active ? 'Active' : 'Inactive',
            style: new TextStyle(fontSize: 32, color: Colors.white),
          ),
        ),
        width: 200,
        height: 200,
        decoration: new BoxDecoration(
          color: active ? Colors.lightGreen[700] : Colors.grey[600],
        ),
      ),
    );
  }
}


class TapBoxA extends StatefulWidget{
  TapBoxA({Key key}): super(key:key);
  @override
  _TapBoxAState createState() => new _TapBoxAState();
}

class _TapBoxAState extends State<TapBoxA>{
  bool _active = false;

  void _handleTap(){
    setState(() {
      _active = !_active;
    });
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new GestureDetector(
      onTap: _handleTap,
      child: new Container(
        child: new Center(
          child: new Text(
            _active ? "Active" : "Inactive",
            style: new TextStyle(fontSize: 32.0, color: Colors.white),
          ),
        ),
        width: 200,
        height: 200,
        decoration: new BoxDecoration(
          color: _active ? Colors.lightGreen[700] : Colors.grey[600],
        ),
      ),
    );
  }
}
class NewRouteTextField extends StatefulWidget{
  @override
  _NewRouteTextFieldState createState() => new _NewRouteTextFieldState();
}

class _NewRouteTextFieldState extends State<NewRouteTextField>{
  TextEditingController _usernameController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    _usernameController.text = "hello world";
    _usernameController.selection = TextSelection(
      baseOffset: 2,
      extentOffset: _usernameController.text.length,
    );
    _usernameController.addListener(() {
      print(_usernameController.text);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New route"),
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                autofocus: true,
                controller: _usernameController,
                decoration: InputDecoration(
                  labelText: "用户名",
                  hintText: "用户名或者邮箱",
                  prefixIcon: Icon(Icons.person),
                ),
                onChanged: (v){
                  print("onchange:$v");
//                  print(_usernameController.text);
                },
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: "密码",
                  hintText: "登录密码",
                  prefixIcon: Icon(Icons.lock),
                ),
                obscureText: true,
              )
            ]
        ),
      ),
    );
  }
}




class NewRouteImage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
//    return Echo(text: "Hello world",);
    void _onpressde(){

    }
    String icons = "";
    icons += "\uE914";
    return Scaffold(
      appBar: AppBar(
        title: Text("New route"),
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
//            FlatButton.icon(onPressed: _onpressde, icon: Icon(Icons.send), label: Text("发送"))
              Image(
                image: AssetImage("images/IMG_F4167770EC92-1.jpeg"),
                width: 100,
                height: 200,
                repeat: ImageRepeat.repeatY,
              ),
              Image.network("https://avatars2.githubusercontent.com/u/20411648?s=460&v=4",width: 100,),
              Text(
                icons,
                style: TextStyle(
                  fontFamily: "MaterialIcons",
                  fontSize: 24,
                  color: Colors.green,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.accessible, color: Colors.green,)
                ],
              )
            ]
        ),
      ),
    );
  }
}

class SwitchAndCheckBoxTestRoute extends StatefulWidget{
  @override
  _SwitchAndCheckBoxTextRouteState createState() => new _SwitchAndCheckBoxTextRouteState();
}

class _SwitchAndCheckBoxTextRouteState extends State<SwitchAndCheckBoxTestRoute>{
  bool _switchSelected = true;
  bool _checkBoxSelected = true;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("test"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Switch(
              value: _switchSelected,
              onChanged: (value){
                setState(() {
                  _switchSelected = value;
                });
              },
            ),
            Checkbox(
              value: _checkBoxSelected,
              activeColor: Colors.red,
              onChanged: (value){
                setState(() {
                  _checkBoxSelected = value;
                });
              },
            )
          ],
        ),
      ),
    );

  }
}


class NewRouteButton extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
//    return Echo(text: "Hello world",);
    void _onpressde(){

    }
    return Scaffold(
      appBar: AppBar(
        title: Text("New route"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
//            FlatButton.icon(onPressed: _onpressde, icon: Icon(Icons.send), label: Text("发送"))
            FlatButton(
              color: Colors.blue,
              highlightColor: Colors.blue[700],
              colorBrightness: Brightness.dark,
              splashColor: Colors.grey,
              child: Text('submit'),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              onPressed: _onpressde,
            )
            ]
        ),
      ),
    );
  }
}

class NewRouteText extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
//    return Echo(text: "Hello world",);
    return Scaffold(
      appBar: AppBar(
        title: Text("New route"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
//            Echo(text: "Hello world")
//            CounterWidget()
            Text("hello world", textAlign: TextAlign.left,),
            Text("hello world"*6,maxLines: 1, overflow: TextOverflow.ellipsis),
            Text("hello world", textScaleFactor: 1.5,),
            Text("hello world",
            style: TextStyle(
                color: Colors.blue,
                fontSize: 18,
                height: 1.2,
                fontFamily: "Courier",
                background: new Paint()..color = Colors.yellow,
                decoration: TextDecoration.underline,
                decorationStyle: TextDecorationStyle.dashed
              ),
            ),
            DefaultTextStyle(
              style: TextStyle(
                color: Colors.red,
                fontSize: 20
              ),
              textAlign: TextAlign.start,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("hello world"),
                  Text("Im jack"),
                  Text("Im jack",
                    style: TextStyle(
                      inherit: false,
                      color: Colors.grey
                    ),
                  )
                ],
              ),
            )
          ],

//          children: <Widget>[
//            Text("This is new route"),
//            FlatButton(
//              child: Text("back"),
//              textColor: Colors.blue,
//              onPressed: (){
//                Navigator.pop(context);
//              },
//            ),
//          ],
        ),
      ),
    );
  }
}

/// tiproute 页面传值
class TipRoute extends StatelessWidget{
  TipRoute({
    Key key,
    @required this.text,
}):super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("提示"),
      ),
      body: Padding(
        padding: EdgeInsets.all(18),
        child: Center(
          child: Column(
            children: <Widget>[
              Text(text),
              RaisedButton(
                onPressed: () => Navigator.pop(context,"我是返回值"),
                child: Text("返回"),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class RouterTestRoute extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("test"),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () async{
            var result = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context){
                    return TipRoute(
                        text: "我是提示XXX"
                    );
                  },
                )
            );
            print("路由返回值：$result");
          },
          child: Text("打开提示页"),
        ),
      ),
    );
  }
}


/// 命名路由

class EchoRoute extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    var args = ModalRoute.of(context).settings.arguments;
    print(args);
    return Scaffold(
      appBar: AppBar(
        title: Text("test"),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () async{
          },
          child: Text("打开提示页"),
        ),
      ),
    );
  }
}


class RandomWordsWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final wordPair = new WordPair.random();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: new Text(wordPair.toString()),
    );
  }
}


class Echo extends StatelessWidget{
  final String text;
  final Color backgroundColor;
  const Echo({
  Key key,
    @required this.text,
    this.backgroundColor: Colors.grey,
}):super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Container(
        color: backgroundColor,
        child: Text(this.text),
      ),
    );
  }
}


class ContextRoute extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Context测试"),
      ),
      body: Container(
        child: Builder(builder: (context){
          Scaffold scaffold = context.findAncestorWidgetOfExactType<Scaffold>();
          return (scaffold.appBar as AppBar).title;
        }),
      ),
    );
  }
}


class CounterWidget extends StatefulWidget{
  const CounterWidget({
    Key key,
    this.initValue: 0,
});

  final int initValue;
  @override
  _CounterWidgetState createState() => new _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget>{
  int _counter;
  @override
  void initState(){
    super.initState();
    _counter = widget.initValue;
    print("initState");
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    print("build");
    return Scaffold(
      appBar: AppBar(
        title: Text("data"),
      ),
      body: Center(
        child: FlatButton(
          child: Text("$_counter"),
          onPressed: ()=>setState(()=>++_counter),
        ),
      ),
    );
  }
  @override
  void didUpdateWidget(CounterWidget oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    print("didUpdateWidget");
  }

  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
    print("deactivate");
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print("dispose");
  }

  @override
  void reassemble() {
    // TODO: implement reassemble
    super.reassemble();
    print("reassemble");
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    print("didChangeDependencies");
  }
}


class SnackBarWidget extends StatefulWidget{
  @override
  _SnackBarWidgetState createState() => new _SnackBarWidgetState();
}

class _SnackBarWidgetState extends State<SnackBarWidget>{

  static GlobalKey<ScaffoldState> _globalKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      key: _globalKey,
      appBar: AppBar(
        title: Text("子树中获取State对象"),
      ),
      body: Center(
        child: Builder(builder: (context){
          return RaisedButton(
              onPressed: (){
//                ScaffoldState _state = context.findAncestorStateOfType<ScaffoldState>();
//                ScaffoldState _state = Scaffold.of(context);
                  ScaffoldState _state = _globalKey.currentState;
                _state.showSnackBar(
                  SnackBar(
                    content: Text("我是SnackBar"),
                  )
                );
              },
            child: Text("显示SnackBar"),
          );
        }),
      ),
    );
  }
}
