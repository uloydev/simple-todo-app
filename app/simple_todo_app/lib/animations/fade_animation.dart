import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:supercharged/supercharged.dart';

enum FadeProps { opacity, translateY }

class FadeAnimation extends StatelessWidget {
  final Widget child;
  final int delay;

  FadeAnimation({this.child, this.delay});

  @override
  Widget build(BuildContext context) {
    final tween = MultiTween<FadeProps>()
      ..add(FadeProps.translateY, (-50.0).tweenTo(0.0), 400.milliseconds)
      ..add(FadeProps.opacity, 0.0.tweenTo(1.0), 500.milliseconds);

    return CustomAnimation(
      tween: tween,
      duration: tween.duration,
      child: child,
      delay: Duration(milliseconds: delay),
      builder: (context, child, value) {
        return Transform.translate(
            offset: Offset(0, value.get(FadeProps.translateY)),
            child: Opacity(
              child: child,
              opacity: value.get(FadeProps.opacity),
            )
        );
      },
    );
  }
}
