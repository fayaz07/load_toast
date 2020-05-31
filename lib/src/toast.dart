import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:load_toast/src/options.dart';

final Widget _postChildSuccess =
    Image.asset('assets/success.png', package: 'load_toast');
final Widget _postChildError =
    Image.asset('assets/cancel.png', package: 'load_toast');
final Widget _postChildWarning =
    Image.asset('assets/warning.png', package: 'load_toast');

class LoadToastChild extends StatefulWidget {
  final LTOptions loadToastOptions;

  const LoadToastChild({
    Key key,
    this.loadToastOptions,
  }) : super(key: key);

  @override
  LoadToastChildState createState() => LoadToastChildState();
}

class LoadToastChildState extends State<LoadToastChild>
    with TickerProviderStateMixin {
  /// animation
  Animation _scaleAnim, _opacityAnim;
  AnimationController _scaleController, _opacityController;

  /// stream
  final StreamController<LTOptions> _ltOptionsController =
      StreamController(sync: true);

  var _animDuration = Duration(milliseconds: 400);
  double _containerHeight = 50.0, _radius = 25.0;

  Widget _postChild = Image.asset('assets/success.png', package: 'load_toast');

  bool _isShowing = false;

  show({String text}) {
    if (!_isShowing) {
//      debugPrint('Showing loadtoast');
      _ltOptionsController.sink
          .add(LTOptions.copy(widget.loadToastOptions, text: text));
      _opacityController.forward();
      _isShowing = true;
    }
  }

  Future<void> success() async {
    if (_isShowing) {
//      debugPrint('loadtoast success');
      _postChild = _postChildSuccess;
      await _scaleController.forward();
      await Future.delayed(Duration(milliseconds: 900));
      return;
    }
  }

  Future<void> error() async {
    if (_isShowing) {
//      debugPrint('loadtoast error');
      _postChild = _postChildError;
      await _scaleController.forward();
      await Future.delayed(Duration(milliseconds: 900));
      return;
    }
  }

  Future<void> warning() async {
    if (_isShowing) {
//      debugPrint('loadtoast warning');
      _postChild = _postChildWarning;
      await _scaleController.forward();
      await Future.delayed(Duration(milliseconds: 900));
      return;
    }
  }

  @override
  void initState() {
    _initAnimations();
    super.initState();
  }

  _initAnimations() {
    _scaleController = AnimationController(
      vsync: this,
      animationBehavior: AnimationBehavior.normal,
      duration: _animDuration,
    );

    _opacityController = AnimationController(
      vsync: this,
      animationBehavior: AnimationBehavior.normal,
      duration: Duration(milliseconds: 900),
    );

    _scaleAnim = Tween(begin: 250.0, end: 50.0).animate(
        CurvedAnimation(curve: Curves.linear, parent: _scaleController));
    _scaleAnim.addListener(_listenToScale);

    _opacityAnim = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        curve: Curves.easeInOutCirc, parent: _opacityController));

//    _opacityController.addListener(_listenToTransform);
  }

//  _listenToTransform() {}

  _listenToScale() {
    if (_scaleAnim.value <= 200.0) {
      _ltOptionsController.sink.add(LTOptions.copy(widget.loadToastOptions,
          state: LTState.End, postChild: _postChild));
    }
    if (_scaleAnim.isCompleted) {
      _opacityController.reverse(from: 1.0).whenComplete(() {
        _opacityController.reset();
        _scaleController.reset();
        _isShowing = false;
        _ltOptionsController.sink
            .add(LTOptions.copy(widget.loadToastOptions, state: LTState.Idle));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;

    return StreamBuilder<LTOptions>(
        stream: _ltOptionsController.stream,
        initialData: widget.loadToastOptions,
        builder: (context, AsyncSnapshot<LTOptions> snapshot) {
          return _getAnimatedBuilder(snapshot, height);
        });
  }

  Widget _getBody(AsyncSnapshot<LTOptions> snapshot) {
    final loading = Row(
      children: <Widget>[
        SizedBox(width: 16.0),
        Expanded(
          child: Text(
            "${snapshot.data.text ?? "Loading..."}",
            style: snapshot.data.textStyle,
          ),
        ),
        SizedBox(width: 8.0),
        CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation(snapshot.data.indicatorColor),
        ),
        SizedBox(width: 8.0),
      ],
    );
    switch (snapshot.data.state) {
      case LTState.Idle:
        return loading;
        break;
      case LTState.Loading:
        return loading;
        break;
      case LTState.End:
        return snapshot.data.postChild;
        break;
      default:
        return loading;
    }
  }

  /// do not touch
  Widget _getAnimatedBuilder(AsyncSnapshot<LTOptions> snapshot, double height) {
    return AnimatedBuilder(
        animation: _opacityAnim,
        builder: (BuildContext context, Widget child) {
          return Transform(
            transform: Matrix4.translationValues(
                0.0, _opacityAnim.value * height * 0.1, 0.0),
            child: Opacity(
              opacity: _opacityAnim.value,
              child: Align(
                alignment: Alignment.topCenter,
                child: AnimatedBuilder(
                  animation: _scaleAnim,
                  builder: (BuildContext context, Widget child) {
                    return Material(
                      borderRadius: BorderRadius.all(Radius.circular(_radius)),
                      color: snapshot.data.backgroundColor,
                      type: MaterialType.canvas,
                      elevation: 8.0,
                      child: SizedBox(
                        width: _scaleAnim.value,
                        height: _containerHeight,
                        child: _getBody(snapshot),
                      ),
                    );
                  },
                ),
              ),
            ),
          );
        });
  }

  @override
  void dispose() {
    _scaleController.dispose();
    _opacityController.dispose();
    _ltOptionsController.sink.close();
    _ltOptionsController.close();
    super.dispose();
  }
}
