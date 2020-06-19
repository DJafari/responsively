library responsively;

import 'package:responsively/src/breakpoints.dart';

export 'src/models/responsive_width.dart';
export 'src/models/responsive_info.dart';
export 'src/models/column_offset.dart';
export 'src/models/column_order.dart';
export 'src/models/column_width.dart';
export 'src/models/column_info.dart';

export 'src/breakpoints.dart';
export 'src/helpers.dart';
export 'src/bp.dart';

export 'src/widgets/responsive_row.dart';
export 'src/widgets/responsive_column.dart';
export 'src/widgets/responsive_column_builder.dart';
export 'src/widgets/responsive_builder.dart';
export 'src/widgets/responsive_sized_box.dart';
export 'src/widgets/responsive_widget.dart';

class Responsively {
  static Responsively _instance = Responsively._();
  static Responsively get instance => _instance;

  Responsively._();

  BreakPoints breakPoints = BreakPoints(
    xs: 576.0,
    sm: 768.0,
    md: 992.0,
    lg: 1200.0,
    xl: double.infinity
  );
}