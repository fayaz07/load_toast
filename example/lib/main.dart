import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:load_toast/load_toast.dart';

void main() {
  runApp(MaterialApp(home: LoadToast(child: Example())));
}

final textStyle =
    TextStyle(color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold);

class Example extends StatefulWidget {
  @override
  _ExampleState createState() => _ExampleState();
}

class _ExampleState extends State<Example> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Wrap(
          spacing: 8.0,
          runSpacing: 8.0,
          crossAxisAlignment: WrapCrossAlignment.center,
          alignment: WrapAlignment.center,
          direction: Axis.horizontal,
          children: <Widget>[
            RaisedButton(
              color: Colors.blue,
              child: Text(
                'Show LoadToast',
                style: textStyle,
              ),
              onPressed: () {
                showLoadToast();
              },
            ),
            RaisedButton(
              color: Colors.green,
              child: Text(
                'LoadToast Success',
                style: textStyle,
              ),
              onPressed: () {
                hideLoadToastWithSuccess();
              },
            ),
            RaisedButton(
              color: Colors.red,
              child: Text(
                'LoadToast Error',
                style: textStyle,
              ),
              onPressed: () {
                hideLoadToastWithError();
              },
            ),
            RaisedButton(
              color: Colors.orange,
              child: Text(
                'LoadToast Warning',
                style: textStyle,
              ),
              onPressed: () {
                hideLoadToastWithWarning();
              },
            ),
            RaisedButton(
              color: Colors.orange,
              child: Text(
                'Go to new page',
                style: textStyle,
              ),
              onPressed: () {
                Navigator.of(context).push(CupertinoPageRoute(
                    builder: (BuildContext context) => NewPage()));
              },
            ),
          ],
        ),
      ),
    );
  }
}

class NewPage extends StatefulWidget {
  @override
  _NewPageState createState() => _NewPageState();
}

class _NewPageState extends State<NewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Wrap(
          spacing: 8.0,
          runSpacing: 8.0,
          crossAxisAlignment: WrapCrossAlignment.center,
          alignment: WrapAlignment.center,
          direction: Axis.horizontal,
          children: <Widget>[
            Text(
              'Second page',
              style: textStyle,
            ),
            RaisedButton(
              color: Colors.blue,
              child: Text(
                'Show LoadToast',
                style: textStyle,
              ),
              onPressed: () {
                showLoadToast();
              },
            ),
            RaisedButton(
              color: Colors.green,
              child: Text(
                'LoadToast Success',
                style: textStyle,
              ),
              onPressed: () {
                hideLoadToastWithSuccess();
              },
            ),
            RaisedButton(
              color: Colors.red,
              child: Text(
                'LoadToast Error',
                style: textStyle,
              ),
              onPressed: () {
                hideLoadToastWithError();
              },
            ),
            RaisedButton(
              color: Colors.orange,
              child: Text(
                'LoadToast Warning',
                style: textStyle,
              ),
              onPressed: () {
                hideLoadToastWithWarning();
              },
            ),
          ],
        ),
      ),
    );
  }
}
