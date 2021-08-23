import 'package:flutter/material.dart';

final Widget _postChildSuccess =
    Image.asset('assets/success.png', package: 'load_toast');

enum LTState { Idle, Loading, End }

const _defaultTextStyle =
    TextStyle(color: Colors.black, fontSize: 24.0, fontWeight: FontWeight.w700);

class LTOptions {
  String? text;
  Color? backgroundColor;
  Color? indicatorColor;
  TextStyle? textStyle;
  Widget? postChild;
  LTState? state;

  LTOptions(
      {this.text = "Loading...",
      this.backgroundColor = Colors.white,
      this.indicatorColor = Colors.blue,
      this.textStyle = _defaultTextStyle,
      this.postChild,
      this.state = LTState.Idle}) {
    /// initialization and assertions
    if (postChild == null) {
      postChild = _postChildSuccess;
    }
  }

  static LTOptions copy(LTOptions? options,
      {String? text,
      Color? backgroundColor,
      Color? indicatorColor,
      TextStyle? textStyle,
      Widget? postChild,
      LTState? state}) {
    ///
    LTOptions _copy = LTOptions(
      text: (text ?? options?.text) ?? "Loading...",
      backgroundColor: backgroundColor ?? options?.backgroundColor,
      indicatorColor: indicatorColor ?? options?.indicatorColor,
      postChild: postChild ?? options?.postChild,
      state: state ?? options?.state,
      textStyle: textStyle ?? options?.textStyle,
    );

    return _copy;
  }
}
