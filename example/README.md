```dart
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:load_toast/load_toast.dart';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: Example()));
}

class Example extends StatefulWidget {
  @override
  _ExampleState createState() => _ExampleState();
}

class _ExampleState extends State<Example> {

  LoadToast load_toast = LoadToast(backgroundColor: Colors.greenAccent,circularIndicatorColor: Colors.white,);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Positioned(
              top: 190.0,
              left: 20.0,
              right: 20.0,
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                onPressed: () {
                  load_toast.show();
                },
                child: SizedBox(
                  height: 50.0,
                  child: Center(
                    child: Text(
                      'Show toast',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                color: Colors.blueAccent,
              )),
          Positioned(
              top: 260.0,
              left: 20.0,
              right: 20.0,
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                onPressed: () {
                  load_toast.success();
                },
                child: SizedBox(
                  height: 50.0,
                  child: Center(
                    child: Text('Success',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                            fontWeight: FontWeight.w600)),
                  ),
                ),
                color: Colors.green,
              )),
          Positioned(
              top: 320.0,
              left: 20.0,
              right: 20.0,
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                onPressed: () {
                  load_toast.error();
                },
                child: SizedBox(
                  height: 50.0,
                  child: Center(
                    child: Text('Error',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                            fontWeight: FontWeight.w600)),
                  ),
                ),
                color: Colors.red,
              )),
          Positioned(
              top: 380.0,
              left: 20.0,
              right: 20.0,
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                onPressed: () {
                  load_toast.warning();
                },
                child: SizedBox(
                  height: 50.0,
                  child: Center(
                    child: Text('Warning',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                            fontWeight: FontWeight.w600)),
                  ),
                ),
                color: Colors.yellow,
              )),
          load_toast
        ],
      ),
    );
  }
}



```
