# load_toast

A plugin that would really help you show some cool animated widget, describing your app is busy.
<p align="center">
  <img src="https://raw.githubusercontent.com/fayaz07/load_toast/master/mockup.png" align="center"/>
</p>


## How does it look like
<img src="https://raw.githubusercontent.com/fayaz07/load_toast/master/loadtoast_sketch.png"/>

## Supported Dart Versions
*Dart SDK version* **>=2.1.0 <3.0.0**


## Installation
Add the Package
```yaml
dependencies:
  load_toast: ^0.0.1
```

## How to use

Import the package in your dart file
```yaml
import 'package:load_toast/load_toast.dart';
```

Create an instance of it, maybe a static variable widget can really help as it would be an optimized choice. Wrap it in a MaterialApp->Stack->[YourApp(), loadtoast]

Create an instance of LoadToast
```dart
LoadToast loadToast = LoadToast();
```
> You can specify the optional parameters to the above constructor, **backgroundColor: Colors.greenAccent, circularIndicatorColor: Colors.white**

Plug it into your widget tree in a **Stack** parent
```dart  
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: <Widget>[
      //... your children
      loadToast
    ]));
  }
```

That's it, you're done, lets show it
```dart
loadToast.show();
```
> Note: You can specify the optional parameter to the above method, **text: "Hello there!"**

Handle the cases now
* The operation ended up in **Success**
```dart
loadToast.success();
```

* Unfortuantely it has failed
```dart
loadToast.error();
```

* Hmm... Succeeded but there's something tricky
```dart
loadToast.warning();
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
