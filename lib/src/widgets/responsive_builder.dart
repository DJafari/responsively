
import 'package:flutter/widgets.dart';
import 'package:responsively/src/bp.dart';
import 'package:responsively/src/helpers.dart';

typedef BreakPointBuilder = Widget Function(BuildContext context, BP breakPoint);

class ResponsiveBuilder extends StatelessWidget {
  final BreakPointBuilder builder;

  ResponsiveBuilder({
    Key key,
    @required this.builder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return builder(context, getBreakPoint(size.width));
  }
}