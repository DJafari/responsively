import 'package:flutter/material.dart';
import 'package:responsively/responsively.dart';
import 'package:responsively/src/models/responsive_width.dart';

class ResponsiveSizedBox extends StatelessWidget {
  final ResponsiveWidth width;
  final double height;
  final Widget child;

  ResponsiveSizedBox({
    Key key,
    @required this.width,
    @required this.child,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SizedBox(
      width: width.getValue(size.width) ?? double.infinity,
      height: height,
      child: child,
    );
  }
}
