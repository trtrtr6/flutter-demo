import 'package:flutter/material.dart';

class BtnDemo extends StatelessWidget{
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("按钮"),
      ),
      body: Builder(builder: (context){
        return Container(
          padding: const EdgeInsets.all(20),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
//          mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              RaisedButton(
                child: Text("RaisedButton"),
                onPressed: (){
                  print("RaisedButton");
                },
              ),
              FlatButton(
                child: Text("FlatButton"),
                onPressed: (){
                  print("FlatButton");
                },
              ),
              OutlineButton(
                child: Text("OutlineButton"),
                onPressed: (){
                  print("OutlineButton");
                }
              ),
              IconButton(
                icon: Icon(Icons.thumb_up),
                onPressed: (){
                  print("IconButton");
                }
              ),
              RaisedButton.icon(
                icon: Icon(Icons.send),
                label: Text("发送"),
                onPressed: (){
                  print("发送");
                },
              ),
              OutlineButton.icon(
                icon: Icon(Icons.add),
                label: Text("添加"),
                onPressed: (){
                  print("添加");
                },
              ),
              FlatButton.icon(
                icon: Icon(Icons.info),
                label: Text("详情"),
                onPressed: (){
                  print("详情");
                },
              ),
              FlatButton(
                color: Colors.blue,
                highlightColor: Colors.blue[700],
                colorBrightness: Brightness.dark,
                splashColor: Colors.grey,
                child: Text("提交"),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                onPressed: () {},
              ),
              RaisedButton(
                color: Colors.blue,
                highlightColor: Colors.blue[700],
                colorBrightness: Brightness.dark,
                splashColor: Colors.grey,
                child: Text("提交"),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                onPressed: () {},
              ),
            ],
          ),
        );
      }),
    );
  }
}