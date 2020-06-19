import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsively/responsively.dart';
import 'package:responsively/src/models/column_info.dart';

import 'responsive_column_base.dart';

enum MainAxisResponsiveRowAlignment {
  start, center, end,
}
enum CrossAxisResponsiveRowAlignment {
  start, center, end, stretch
}

class ResponsiveRow extends StatelessWidget {
  final int totalColumn;
  final double mainAxisSpacing;
  final double crossAxisSpacing;
  final List<ResponsiveColumnBase> children;
  final MainAxisResponsiveRowAlignment mainAxisAlignment;
  final CrossAxisResponsiveRowAlignment crossAxisAlignment;

  ResponsiveRow({
    Key key,
    @required this.children,
    this.mainAxisSpacing: 0.0,
    this.crossAxisSpacing: 0.0,
    this.mainAxisAlignment = MainAxisResponsiveRowAlignment.start,
    this.crossAxisAlignment = CrossAxisResponsiveRowAlignment.start,
    this.totalColumn = 12,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    List<Widget> rows = List();
    List<Widget> cols = List();

    int currentCount = 0;

    _buildRow() {
      if (currentCount < totalColumn) {
        if(mainAxisAlignment == MainAxisResponsiveRowAlignment.start) {
          cols.add(Spacer(
            flex: totalColumn - currentCount,
          ));
        } else if(mainAxisAlignment == MainAxisResponsiveRowAlignment.end) {
          cols.insert(0, Spacer(
            flex: totalColumn - currentCount,
          ));
        } else if(mainAxisAlignment == MainAxisResponsiveRowAlignment.center) {
          cols.insert(0, Spacer(
            flex: ((totalColumn - currentCount) / 2).floor(),
          ));
          cols.add(Spacer(
            flex: ((totalColumn - currentCount) / 2).floor(),
          ));
        }
      }
      if(crossAxisAlignment == CrossAxisResponsiveRowAlignment.stretch) {
        rows.add(IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: cols,
          ),
        ));
      } else {
        rows.add(Row(
          crossAxisAlignment: _crossAxisAlignment,
          children: cols,
        ));
      }
      cols = List();
      currentCount = 0;
    }

    List<_ResponsiveColumn> children = _makeChildren(w);
    for(_ResponsiveColumn col in children) {

      if(currentCount + col.width > totalColumn) {
        _buildRow();
      }
      final colWidget = Expanded(
        flex: col.width,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: mainAxisSpacing / 2,
            vertical: crossAxisSpacing / 2,
          ),
          child: col.col.toChild(context, ColumnInfo(getBreakPoint(w), col.width, col.order, col.offset)),
        ),
      );
      if(col.offset > 0) {
        cols.add(Spacer(
          flex: col.offset,
        ));
      }
      cols.add(colWidget);
      currentCount += (col.width + col.offset);
    }
    if(currentCount >= 0) {
      _buildRow();
    }

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: mainAxisSpacing / 2,
        vertical: crossAxisSpacing / 2,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: rows,
      ),
    );
  }

  List<_ResponsiveColumn> _makeChildren(double w) {
    List<_ResponsiveColumn> children = [];

    for(ResponsiveColumnBase col in this.children) {
      int width = col.width.getValue(w) ?? totalColumn;
      int offset = col.offset.getValue(w) ?? 0;
      int order = col.order.getValue(w);

      children.add(_ResponsiveColumn(
        col: col,
        order: order,
        width: width,
        offset: offset
      ));
    }
    children.sort((a, b) {
      if(a.order == null && b.order == null) {
        return 0;
      } else if(a.order == null) {
        return 1;
      } else if(b.order == null) {
        return 0;
      }

      return a.order.compareTo(b.order);
    });
    return children;
  }

  CrossAxisAlignment get _crossAxisAlignment {
    if(crossAxisAlignment == CrossAxisResponsiveRowAlignment.center) {
      return CrossAxisAlignment.center;
    }
    if(crossAxisAlignment == CrossAxisResponsiveRowAlignment.end) {
      return CrossAxisAlignment.end;
    }
    return CrossAxisAlignment.start;
  }
}

class _ResponsiveColumn {
  final ResponsiveColumnBase col;
  final int width;
  final int offset;
  final int order;

  _ResponsiveColumn({
    this.col,
    this.order,
    this.offset,
    this.width,
  });
}