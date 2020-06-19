import 'package:responsively/src/models/responsive_info.dart';

class ResponsiveWidth extends ResponsiveInfo<double> {

  const ResponsiveWidth({
    double xs, double sm, double smUp, double smDown, double md, double mdUp,
    double mdDown, double lg, double lgUp, double lgDown, double xl,
    double defaultValue = double.infinity
  }) : super(
    xs: xs,
    sm: sm,
    smUp: smUp,
    smDown: smDown,
    md: md,
    mdUp: mdUp,
    mdDown: mdDown,
    lg: lg,
    lgUp: lgUp,
    lgDown: lgDown,
    xl: xl,
    defaultValue: defaultValue,
  );
}