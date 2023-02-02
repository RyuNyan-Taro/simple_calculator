import 'package:flutter/material.dart';
import 'dart:async';
import 'calculation.dart';


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
  String _expression = '';

  void _UpdateText(String letter) {
    setState(() {
      if(letter == 'C')
        _expression = '';
      else if (letter == '='){
        _expression = '';
        var ans = Calculator.Execute();
        controller.sink.add(ans);
      }else if (letter == 'e'){
        _expression = 'Error';
      }
      else
        _expression += letter;
    });
  }

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

  static final controller = StreamController.broadcast();
  @override
  void initState() {
    controller.stream.listen((event) => _UpdateText(event));
    controller.stream.listen((event) => Calculator.GetKey(event));
  }
}

class Keyboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Center(
        child: Container(
          color: const Color(0xff87cefa),
          child: GridView.count(
            crossAxisCount: 4,
            mainAxisSpacing: 3.0,
            crossAxisSpacing: 3.0,
            children: [
              '7', '8', '9', '÷',
              '4', '5', '6', 'x',
              '1', '2', '3', '-',
              'C', '0', '=', '+',
            ].map((key) {
              return GridTile(
                child: Button(key),
              );
            }).toList(),
          ),
        ),
      ),

    );
  }
}

class Button extends StatelessWidget {
  final _key;
  Button(this._key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // ignore: deprecated_member_use
      child: FlatButton(
        child: Center(
          child: Text(
            _key,
            style: TextStyle(
                fontSize: 46.0,
                color: Colors.black54,
            ),
          ),
        ),
        onPressed: (){
          _TextFieldState.controller.sink.add(_key);
        },
      ),
    );
  }
}

