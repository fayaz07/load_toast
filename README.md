# load_toast

A plugin that would really help you show some cool animated widget, describing your app is busy.
<p align="center">
  <img src="https://raw.githubusercontent.com/fayaz07/load_toast/master/mockup.png" align="center"/>
</p>


## Demo
<!-- <img src="https://raw.githubusercontent.com/fayaz07/load_toast/master/loadtoast_sketch.png"/> -->

[checkout video](https://raw.githubusercontent.com/fayaz07/load_toast/master/demo.mp4)

[Example](example/lib/main.dart)

## Supported Dart Versions
*Dart SDK version* **>=2.7.0 <3.0.0**


## Installation
Add the Package
```yaml
dependencies:
  load_toast: ^2.0.0
```

## How to use

#### Wrap your widget with **LoadToast**

```dart
void main() {
  runApp(
    MaterialApp(
      home: LoadToast(
        child: Example(),
      ),
    ),
  );
}
```

#### You can specify the optional parameters to the above constructor, **backgroundColor: Colors.greenAccent, circularIndicatorColor: Colors.white, text** in LTOptions


That's it, you're done, lets show it. You can call this method anywhere in your application
```dart
showLoadToast(
  backgroundColor: Colors.white,
  indicatorColor: Colors.blue,
  text: 'Please wait...',
);
```

> Note: You can specify the optional parameter to the above method, **text: "Hello there!"**

## Handle the cases now
* The operation ended up in **Success**
```dart
hideLoadToastWithSuccess();
```

* Unfortuantely it has failed
```dart
hideLoadToastWithError();
```

* Hmm... Succeeded but there's something tricky
```dart
hideLoadToastWithWarning();
```
---
### Want to contribute? 
Pull requests and issues are always welcome!

#### How to contribute?
<ol>
  <li> Fork the <a href="https://github.com/fayaz07/load_toast">repository</a></li>
  <li> Clone it to your local machine </li>
  <li> Open the project in your favourite editor </li>  
  <li> Open cmd/terminal and run <b>flutter clean</b> and then <b>flutter packages get</b> </li>
  <li> Make the changes </li>
  <li> Create a <b>Pull Request</b> </li>
</ol>

#### View the issues [here](https://github.com/fayaz07/load_toast/issues)

> Inspired by [loadToast - android](https://github.com/code-mc/loadtoast)
