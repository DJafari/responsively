import 'package:flutter/widgets.dart';
import 'package:responsively/src/models/column_info.dart';
import 'package:responsively/src/models/column_offset.dart';
import 'package:responsively/src/models/column_order.dart';
import 'package:responsively/src/models/column_width.dart';
import 'package:responsively/src/widgets/responsive_column_base.dart';

class ResponsiveColumn extends ResponsiveColumnBase {
  final Widget child;

  ResponsiveColumn({
    Key key,
    ColumnWidth width = const ColumnWidth(),
    @required this.child,
    ColumnOrder order = const ColumnOrder(),
    ColumnOffset offset = const ColumnOffset(),
  }) : super(
    width: width,
    order: order,
    offset: offset,
  );

  @override
  Widget toChild(BuildContext context, ColumnInfo info) {
    return this.child;
  }
}