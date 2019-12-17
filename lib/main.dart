import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import './page/counter.dart';
import './page/newRoute.dart';
import './page/tip.dart';
import './page/textDemo.dart';
import './page/btnDemo.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: "/",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
//        "new_page": (context) => NewRoute(),
        "tip2": (BuildContext context){
          print(ModalRoute.of(context).settings.arguments); // TODO 为啥会走两次
          return TipRoute(text: ModalRoute.of(context).settings.arguments);
        },
        "/" : (context) => MyHomePage(title: 'Flutter Demo Home Page'),
        "counter": (context) => CounterWidget(),
        "text_demo": (context) => TextDemo(),
        "btn_demo": (context) => BtnDemo(),
      },
      onGenerateRoute:(RouteSettings settings){
        return MaterialPageRoute(builder: (context){
          String routeName = settings.name;
          print(routeName);
          if(routeName == 'new_page') return NewRoute();
          return NewRoute();
        });
      },
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

  void _handleTap(String type){
    if(type == 'text'){
      print("文本、字体样式");
      Navigator.pushNamed(context, 'text_demo');
    }else if(type == 'btn'){
      print("按钮");
      Navigator.pushNamed(context, 'btn_demo');
    }
  }

  @override
  Widget build(BuildContext context) {
    print("========${widget.title}");
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
            FlatButton(
              child:  Text("打开新页面"),
              textColor: Colors.blue,
              onPressed: (){
//                Navigator.push(context, MaterialPageRoute(builder: (context){
//                  return NewRoute();
//                }));
                Navigator.pushNamed(context, "new_page");
              },
            ),
            RaisedButton(
              onPressed: () async {
//                var result = await Navigator.push(
//                  context,
//                  MaterialPageRoute(
//                    builder: (context){
//                      return TipRoute(
//                        text:"我是提示xxxx"
//                      );
//                    },
//                  ),
//                );
                var result = await Navigator.of(context).pushNamed("tip2", arguments: "测试参数");
                print("路由返回值：$result");
              },
              child:Text("打开提示页")
            ),
            RandomWordsWidget(),
            RaisedButton(
              onPressed: ()=> Navigator.pushNamed(context, "counter"),
              child: Text("打开计数器"),
            ),
            ListView(
              shrinkWrap: true,
              padding: const EdgeInsets.all(20.0),
              children: <Widget>[
                GestureDetector(
                  onTap: ()=>_handleTap("text"),
                  child: Container(
                    height: 50,
                    color: Colors.amber[600],
                    child: const Center(
                        child: Text("文本、字体样式")
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: ()=>_handleTap("btn"),
                  child: Container(
                    height: 50,
                    margin: EdgeInsets.only(top:10),
                    color: Colors.amber[500],
                    child: const Center(
                        child: Text("按钮")
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Container(height: 50.0,),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class RandomWordsWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // 生成随机字符串
    final wordPair = new WordPair.random();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: new Text(wordPair.toString())
    );
  }
}
