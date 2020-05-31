library load_toast;

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:load_toast/src/options.dart';
import 'package:load_toast/src/toast.dart';

final _tKey = GlobalKey(debugLabel: 'overlay_parent');
final _loadToastKey =
    GlobalKey<LoadToastChildState>(debugLabel: 'load_toast_overlay_child');

OverlayEntry _overlayEntry;

/// These methods deal with showing and hiding the overlay
Future<bool> _showOverlay({@required Widget child}) {
  BuildContext context = _tKey.currentContext;

  _overlayEntry = OverlayEntry(
    builder: (context) => child,
  );

  Overlay.of(context).insert(_overlayEntry);
  return Future.value(true);
}

hideOverlay() {
  _overlayEntry.remove();
}

/// --------------------------- end overlay methods --------------------------

/// These methods deal with the load toast
Future<bool> showLoadToast(
    {Color backgroundColor, Color indicatorColor, String text}) async {
  try {
    try {
      if (_loadToastKey.currentState != null &&
          _loadToastKey.currentState.mounted) {
        hideOverlay();
      }
    } catch (err) {
      //
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
        .whenComplete(() => _loadToastKey.currentState.show(text: text));

    return Future.value(true);
  } catch (err) {
    debugPrint('''Unable to show LoadToast,
    if you find this issue as a bug please file an issue at\nhttps://github.com/fayaz07/load_toast''');
    print(err);
    throw err;
    return Future.value(false);
  }
}

hideLoadToastWithSuccess() async {
  if (_loadToastKey.currentState != null &&
      _loadToastKey.currentState.mounted) {
    await _loadToastKey.currentState.success();
    hideOverlay();
  } else {
    debugPrint('''LoadToast error: LoadToast not shown/disposed''');
  }
}

hideLoadToastWithError() async {
  if (_loadToastKey.currentState != null &&
      _loadToastKey.currentState.mounted) {
    await _loadToastKey.currentState.error();
    hideOverlay();
  } else {
    debugPrint('''LoadToast error: LoadToast not shown/disposed''');
  }
}

hideLoadToastWithWarning() async {
  if (_loadToastKey.currentState != null &&
      _loadToastKey.currentState.mounted) {
    await _loadToastKey.currentState.warning();
    hideOverlay();
  } else {
    debugPrint('''LoadToast error: LoadToast not shown/disposed''');
  }
}

/// ----------------------- LoadToast methods end ---------------------------------
class LoadToast extends StatelessWidget {
  final Widget child;

  const LoadToast({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      key: _tKey,
      child: child,
    );
  }
}
