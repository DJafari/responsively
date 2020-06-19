import 'package:flutter/widgets.dart';
import 'package:responsively/responsively.dart';

enum BP {
  xl, lg, md, sm, xs,
}

extension BreakPointProperties on BP {
  double get from => {
    BP.xs: 0.0,
    BP.sm: Responsively.instance.breakPoints.xs,
    BP.md: Responsively.instance.breakPoints.sm,
    BP.lg: Responsively.instance.breakPoints.md,
    BP.xl: Responsively.instance.breakPoints.lg,
  }[this];

  double get to => {
    BP.xs: Responsively.instance.breakPoints.xs,
    BP.sm: Responsively.instance.breakPoints.sm,
    BP.md: Responsively.instance.breakPoints.md,
    BP.lg: Responsively.instance.breakPoints.lg,
    BP.xl: double.infinity,
  }[this];

  bool check(dynamic w) {
    double width;
    if(w is BuildContext) {
      width = MediaQuery.of(w).size.width;
    } else if(w is double) {
      width = w;
    }
    return (width >= from && width < to);
  }
}