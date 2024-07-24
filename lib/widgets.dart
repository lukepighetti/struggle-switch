import 'package:flutter/cupertino.dart';

class AnimatedVisibility extends StatelessWidget {
  const AnimatedVisibility({
    super.key,
    this.visible = true,
    required this.child,
    this.duration = const Duration(milliseconds: 250),
  });

  final Duration duration;
  final bool visible;

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: visible ? 1 : 0,
      duration: duration,
      child: IgnorePointer(
        ignoring: !visible,
        child: child,
      ),
    );
  }
}
