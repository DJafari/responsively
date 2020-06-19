
import 'package:flutter/widgets.dart';
import 'package:responsively/src/models/column_info.dart';
import 'package:responsively/src/models/column_offset.dart';
import 'package:responsively/src/models/column_order.dart';
import 'package:responsively/src/models/column_width.dart';

abstract class ResponsiveColumnBase {
  final ColumnWidth width;
  final ColumnOrder order;
  final ColumnOffset offset;

  ResponsiveColumnBase({
    this.width,
    this.order,
    this.offset
  });

  Widget toChild(BuildContext context, ColumnInfo info);
}