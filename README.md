# load_toast

A plugin that would really help you show some cool animated widget, describing your app is busy.
<p align="center">
  <img src="https://raw.githubusercontent.com/fayaz07/load_toast/master/mockup.png" align="center"/>
</p>

[![](https://img.shields.io/badge/dontate-Buy%20Me%20a%20Coffee-blueviolet)](https://www.buymeacoffee.com/fayaz) &nbsp;
[![LinkedIn](https://img.shields.io/badge/LinkedIn-in-0e76a8)](https://www.linkedin.com/in/fayaz07) &nbsp; [![Follow](https://img.shields.io/github/followers/fayaz07?style=social)](https://github.com/fayaz07) &nbsp; [![Fork](https://img.shields.io/github/forks/fayaz07/load_toast?style=social)](https://github.com/fayaz07/load_toast/fork) &nbsp; [![Star](https://img.shields.io/github/stars/fayaz07/load_toast?style=social)](https://github.com/fayaz07/load_toast/star) &nbsp; [![Watches](https://img.shields.io/github/watchers/fayaz07/load_toast?style=social)](https://github.com/fayaz07/load_toast/)

[![Get the library](https://img.shields.io/badge/Get%20library-pub-blue)](https://pub.dev/packages/load_toast) &nbsp; [![Example](https://img.shields.io/badge/Example-Ex-success)](https://pub.dev/packages/load_toast#-example-tab-)



## Demo
<!-- <img src="https://raw.githubusercontent.com/fayaz07/load_toast/master/loadtoast_sketch.png"/> -->

[checkout video](https://raw.githubusercontent.com/fayaz07/load_toast/master/demo.mp4)

[Example](example/lib/main.dart)

## Supported Dart Versions
*Dart SDK version* **>=2.12.0 <3.0.0**


## Installation
Add the Package
```yaml
dependencies:
  load_toast: ^3.0.0+1
```

## How to use

#### Wrap your widget with **LoadToast**

```dart
void main() {
  runApp(
    LoadToast(
      child: MaterialApp(
        home: Example(),
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

#### View the issues [here](https://github.com/nabil-hfz/load_toast/issues)

> Inspired by [loadToast - android](https://github.com/code-mc/loadtoast)
