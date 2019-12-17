import 'package:flutter/material.dart';

class CounterWidget extends StatefulWidget{
  CounterWidget({
    Key key,
    this.initValue: 0,
  }):super(key:key);

  final int initValue;

  @override
  _CounterWidgetState createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  int _counter;

  @override
  void initState() {
    super.initState();
    // 初始化状态
    _counter = widget.initValue;
    print("initState");
  }

  @override
  Widget build(BuildContext context) {
    print("build");
    return Scaffold(
      appBar: AppBar(
        title: Text("计数器"),
      ),
      body: Builder(builder: (context){
          return Center(
//        child: FlatButton(
//          // 点击后计数器自增
//          onPressed: ()=> setState(()=>++_counter),
//          child: Text("$_counter"),
//          color: Colors.blue,
//          textColor: Colors.white,
//        ),
            child: Column(
              mainAxisAlignment:MainAxisAlignment.center,
              children: <Widget>[
                FlatButton(
                  // 点击后计数器自增
                  onPressed: ()=> setState(()=>++_counter),
                  child: Text("$_counter"),
                  color: Colors.blue,
                  textColor: Colors.white,
                ),
                RaisedButton(
                  onPressed: (){
//                ScaffoldState _state = context.findAncestorStateOfType<ScaffoldState>();
//                ScaffoldState _state = context.ancestorStateOfType(
//                    TypeMatcher<ScaffoldState>());
                    print("------------$context");
                    ScaffoldState _state=Scaffold.of(context);
                    print("++++++++++++++$_state");
                    _state.showSnackBar(
                      SnackBar(content: Text("我是SnackBar")),
                    );
                  },
                  child: Text("显示SnackBar"),
                ),
              ],
            ),
          );
        })
    );
  }

  @override
  void didUpdateWidget(CounterWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("didUpdateWidget");
  }

  @override
  void deactivate() {
    super.deactivate();
    print("deactivate");
  }

  @override
  void dispose() {
    super.dispose();
    print("dispose");
  }

  @override
  void reassemble() {
    super.reassemble();
    print("reassemble");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("didChangeDependencies");
  }
}