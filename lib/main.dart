import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextField(),
            Keyboard(),
          ],
        ),
      ),
    );
  }
}

class TextField extends StatefulWidget {
  _TextFieldState createState() => _TextFieldState();
}

class _TextFieldState extends State<TextField> {
  String _expression = '1+1';

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        child: Align(
          alignment: Alignment.centerRight,
          child: Text(
            _expression,
            style: TextStyle(
              fontSize: 64.0,
            ),
          ),
        ),
      ),
    );
    //any
  }
}

class Keyboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(

    );
  }
}

class Button extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(

    );
  }
}
