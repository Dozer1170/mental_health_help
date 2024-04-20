import 'package:flutter/material.dart';

SlideTransition buildSlideTransition({
  required Offset begin,
  required Offset end,
  required Animation<double> animation,
  required Widget child,
  Curve curve = Curves.easeInOut,
}) {
  final tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
  final offsetAnimation = animation.drive(tween);

  return SlideTransition(
    position: offsetAnimation,
    child: child,
  );
}

Widget buildTransition({
  required TransitionType type,
  required Animation<double> animation,
  required Widget child,
  Curve curve = Curves.easeInOut,
}) {
  switch (type) {
    case TransitionType.fade:
      return FadeTransition(
        opacity: animation,
        child: child,
      );
    case TransitionType.scale:
      return ScaleTransition(
        scale: animation,
        child: child,
      );
    case TransitionType.rotate:
      return RotationTransition(
        turns: animation,
        child: child,
      );
    case TransitionType.slideUp:
      return buildSlideTransition(
        begin: const Offset(0.0, 1.0),
        end: Offset.zero,
        animation: animation,
        child: child,
        curve: curve,
      );
    case TransitionType.slideDown:
      return buildSlideTransition(
        begin: const Offset(0.0, -1.0),
        end: Offset.zero,
        animation: animation,
        child: child,
        curve: curve,
      );
    case TransitionType.slideLeft:
      return buildSlideTransition(
        begin: const Offset(1.0, 0.0),
        end: Offset.zero,
        animation: animation,
        child: child,
        curve: curve,
      );
    case TransitionType.slideRight:
      return buildSlideTransition(
        begin: const Offset(-1.0, 0.0),
        end: Offset.zero,
        animation: animation,
        child: child,
        curve: curve,
      );
    default:
      throw StateError('Invalid transition type');
  }
}

enum TransitionType {
  fade,
  scale,
  rotate,
  slideUp,
  slideDown,
  slideLeft,
  slideRight,
}
