
import 'bp.dart';

BP getBreakPoint(double width) =>
  BP.values.firstWhere((bp) => bp.check(width));