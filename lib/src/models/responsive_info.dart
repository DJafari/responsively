import 'package:flutter/cupertino.dart';
import 'package:responsively/responsively.dart';
import 'package:responsively/src/bp.dart';

class ResponsiveInfo<T> {
  final T xs;
  final T xsUp;
  final T sm;
  final T smUp;
  final T smDown;
  final T md;
  final T mdUp;
  final T mdDown;
  final T lg;
  final T lgUp;
  final T lgDown;
  final T xl;
  final T defaultValue;

  const ResponsiveInfo({this.xs, this.xsUp, this.sm, this.smUp, this.smDown, this.md,
    this.mdUp, this.mdDown, this.lg, this.lgUp, this.lgDown, this.xl,
    @required this.defaultValue});

  T getValue(double width) {
    double min;
    double max;
    _check() => (width >= min && width < max);

    min = BP.lg.from;
    max = BP.lg.to;
    if(xl != null && _check()) {
      return xl;
    }

    min = 0.0;
    max = BP.lg.to;
    if(lgDown != null && _check()) {
      return lgDown;
    }

    min = BP.lg.from;
    max = double.infinity;
    if(lgUp != null && _check()) {
      return lgUp;
    }

    min = BP.lg.from;
    max = BP.lg.to;
    if(lg != null && _check()) {
      return lg;
    }

    min = 0.0;
    max = BP.md.to;
    if(mdDown != null && _check()) {
      return mdDown;
    }

    min = BP.md.from;
    max = double.infinity;
    if(mdUp != null && _check()) {
      return mdUp;
    }

    min = BP.md.from;
    max = BP.md.to;
    if(md != null && _check()) {
      return md;
    }

    min = 0.0;
    max = BP.sm.to;
    if(smDown != null && _check()) {
      return smDown;
    }

    min = BP.sm.from;
    max = double.infinity;
    if(smUp != null && _check()) {
      return smUp;
    }

    min = BP.sm.from;
    max = BP.sm.to;
    if(sm != null && _check()) {
      return sm;
    }

    min = 0;
    max = double.infinity;
    if(xsUp != null && _check()) {
      return xsUp;
    }

    min = BP.xs.from;
    max = BP.xs.to;
    if(xs != null && _check()) {
      return xs;
    }
    return defaultValue;
  }
}