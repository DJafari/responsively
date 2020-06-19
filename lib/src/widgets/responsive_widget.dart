import 'package:flutter/material.dart';
import 'package:responsively/responsively.dart';
import 'package:responsively/src/models/responsive_info.dart';

typedef ResponsiveWidgetBuilder<T> = Widget Function(BuildContext context, T value);

class ResponsiveWidget<T> extends StatelessWidget {
  final ResponsiveWidgetBuilder<T> builder;
  final ResponsiveInfo<T> value;

  ResponsiveWidget({
    Key key,
    @required this.value,
    @required this.builder,
  });

  @override
  Widget build(BuildContext context) {
    T v = value.getValue(MediaQuery.of(context).size.width);
    return builder(context, v);
  }
}
