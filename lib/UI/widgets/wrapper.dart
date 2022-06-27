import 'package:flutter/material.dart';

const _paddingMultiplier = 0.03;

class WidgetWrapper extends StatelessWidget {
  const WidgetWrapper({Key? key, required this.child, this.multiplier = 1})
      : super(key: key);

  final Widget child;
  final int multiplier;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(
        MediaQuery.of(context).size.width * _paddingMultiplier * multiplier,
      ),
      child: child,
    );
  }
}
