library load_toast;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:load_toast/src/options.dart';
import 'package:load_toast/src/toast.dart';

final _tKey = GlobalKey(debugLabel: 'overlay_parent');
final _loadToastKey =
    GlobalKey<LoadToastChildState>(debugLabel: 'load_toast_overlay_child');

OverlayState? get _overlayState {
  final context = _tKey.currentContext;
  if (context == null) return null;

  NavigatorState? navigator;
  void visitor(Element element) {
    if (navigator != null) return;

    if (element.widget is Navigator) {
      navigator = (element as StatefulElement).state as NavigatorState?;
    } else {
      element.visitChildElements(visitor);
    }
  }

  context.visitChildElements(visitor);

  assert(navigator != null,
      '''Cannot find LoadToast above the widget tree, unable to show overlay''');
  return navigator?.overlay;
}

late OverlayEntry _overlayEntry;

/// These methods deal with showing and hiding the overlay
Future<bool> _showOverlay({required Widget child}) {
  final overlay = _overlayState!;

  _overlayEntry = OverlayEntry(
    builder: (context) => child,
  );

  overlay.insert(_overlayEntry);
  return Future.value(true);
}

hideOverlay() {
  try {
    _overlayEntry.remove();
  } catch (e) {
    debugPrint('''LoadToast error: $e''');
  }
}

/// --------------------------- end overlay methods --------------------------

/// These methods deal with the load toast
Future<bool> showLoadToast(
    {Color? backgroundColor, Color? indicatorColor, String? text}) async {
  try {
    try {
      if (_loadToastKey.currentState != null &&
          (_loadToastKey.currentState?.mounted ?? false)) {
        hideOverlay();
      }
    } catch (err) {
      hideOverlay(); //
    }
    final loadToastChild = Positioned(
      height: 100.0,
      left: 5.0,
      right: 5.0,
      child: LoadToastChild(
        key: _loadToastKey,
        loadToastOptions: LTOptions(
            text: text,
            backgroundColor: backgroundColor,
            indicatorColor: indicatorColor),
      ),
    );

    await _showOverlay(
      child: loadToastChild,
    );

    Future.delayed(Duration(milliseconds: 200))
        .whenComplete(() => _loadToastKey.currentState?.show(text: text));

    return Future.value(true);
  } catch (err) {
    debugPrint('''Unable to show LoadToast,
    if you find this issue as a bug please file an issue at\nhttps://github.com/fayaz07/load_toast''');
    print(err);
    return Future.value(false);
  }
}

hideLoadToastWithSuccess() async {
  if (_loadToastKey.currentState != null &&
      (_loadToastKey.currentState?.mounted ?? false)) {
    await _loadToastKey.currentState?.success();
    hideOverlay();
  } else {
    debugPrint('''LoadToast error: LoadToast not shown/disposed''');
    hideOverlay();
  }
}

hideLoadToastWithError() async {
  if (_loadToastKey.currentState != null &&
      (_loadToastKey.currentState?.mounted ?? false)) {
    await _loadToastKey.currentState?.error();
    hideOverlay();
  } else {
    debugPrint('''LoadToast error: LoadToast not shown/disposed''');
    hideOverlay();
  }
}

hideLoadToastWithWarning() async {
  if (_loadToastKey.currentState != null &&
      (_loadToastKey.currentState?.mounted ?? false)) {
    await _loadToastKey.currentState?.warning();
    hideOverlay();
  } else {
    debugPrint('''LoadToast error: LoadToast not shown/disposed''');
    hideOverlay();
  }
}

/// ----------------------- LoadToast methods end ---------------------------------
class LoadToast extends StatelessWidget {
  final Widget? child;

  const LoadToast({Key? key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      key: _tKey,
      child: child,
    );
  }
}
