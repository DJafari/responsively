import 'package:responsively/src/models/responsive_info.dart';

class ColumnOffset extends ResponsiveInfo<int> {

  const ColumnOffset({
    int xs, int xsUp, int sm, int smUp, int smDown, int md, int mdUp,
    int mdDown, int lg, int lgUp, int lgDown, int xl, int defaultValue = 0,
  }) : super(
    xs: xs,
    xsUp: xsUp,
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

  const ColumnOffset.all(int offset) : super(
    defaultValue: offset,
  );
}