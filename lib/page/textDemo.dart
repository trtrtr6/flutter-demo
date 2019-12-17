import 'package:flutter/material.dart';

class TextDemo extends StatelessWidget{
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("文本及样式"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
//        mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("Hello world",
              textAlign: TextAlign.left,
            ),
            Text("Hello world! I'm Jack. "*14,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            Text("Hello world",
              textScaleFactor: 1.5,
            ),
            Text("测试一下",
              style: TextStyle(
                color: Colors.blue,
                fontSize: 18,
                fontFamily: "Courier",
                background: new Paint()..color = Colors.yellow,
                decoration:TextDecoration.underline,
                decorationStyle: TextDecorationStyle.dashed
              ),
            ),
            Text.rich(TextSpan(
              children: [
                TextSpan(text: "label："),
                TextSpan(
                  text: "测试时刻库斯库斯",
                  style: TextStyle(
                    color:Colors.blue,
                  ),
//                  recognizer: _tapRecognizer,
                )
              ],
            )),
            DefaultTextStyle(
              style: TextStyle(
                color:Colors.red,
                fontSize: 20.0,
              ),
              textAlign: TextAlign.center,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("hello worldhello worldhello worldhello worldhello worldhello worldhello worldhello worldhello worldhello worldhello world"),
                  Text("I am Jack"),
                  Text("I am Jack",
                    style: TextStyle(
                        color: Colors.grey
                    ),
                  ),
                  Text("I am Jack",
                    style: TextStyle(
                        inherit: false, //2.不继承默认样式
                        color: Colors.grey
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      )
    );
  }
}