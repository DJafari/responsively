import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsively/responsively.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Responsively Widget Catalog'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ResponsiveSizedBox(
              width: ResponsiveWidth(
                lgUp: 50.0,
                mdUp: 40.0,
                defaultValue: 30.0
              ),
              child: Container(
                height: 100,
                color: Colors.red,
              ),
            ),
            ResponsiveRow(
              children: [
                ResponsiveColumn(
                  width: ColumnWidth(
                    lgUp: 3, // fill 3 from 12 column in large screen and bigger
                    mdUp: 4, // fill 4 from 12 column in medium screen and bigger
                    smUp: 6, // fill 6 from 12 column in small screen and bigger
                    defaultValue: 12, // if device size not exist in your definition defaultValue is your column width
                  ),
                  order: ColumnOrder(
                    lgUp: 0,
                    mdUp: 1,
                    smUp: 0,
                    xsUp: 1,
                  ),
                  offset: ColumnOffset(
                    lgUp: 2,
                  ),
                  child: Container(
                    height: 100,
                    color: Colors.purple,
                  )
                ),
                ResponsiveColumn(
                  width: ColumnWidth(
                    lgUp: 3, // fill 3 from 12 column in large screen and bigger
                    mdUp: 4, // fill 4 from 12 column in medium screen and bigger
                    smUp: 6, // fill 6 from 12 column in small screen and bigger
                  ),
                  order: ColumnOrder(
                    lgUp: 1,
                    mdUp: 0,
                    smUp: 1,
                    xsUp: 0,
                  ),
                  offset: ColumnOffset(
                    mdUp: 1,
                  ),
                  child: Container(
                    height: 100,
                    color: Colors.deepOrange,
                  )
                ),
              ],
            ),
            /*
            ResponsiveRow(
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              children: [
                ResponsiveColumnBuilder(
                  width: ColumnWidth(
                    xl: 2,
                    lgUp: 3,
                    mdUp: 4,
                    smUp: 6,
                  ),
                  order: ColumnOrder(
                    lgUp: 0,
                    mdUp: 1,
                    smUp: 3,
                  ),
                  builder: (context, info) {
                    return ChildItem(
                      color: Colors.blueGrey,
                      info: info,
                    );
                  }
                ),
                ResponsiveColumnBuilder(
                  width: ColumnWidth(
                    xl: 3,
                    lgUp: 3,
                    mdUp: 4,
                    smUp: 6,
                  ),
                  order: ColumnOrder(
                    lgUp: 1,
                    mdUp: 2,
                    smUp: 1,
                  ),
                  offset: ColumnOffset(
                    xl: 1,
                  ),
                  builder: (context, info) {
                    return ChildItem(
                      color: Colors.green[600],
                      info: info,
                    );
                  }
                ),
                ResponsiveColumnBuilder(
                  width: ColumnWidth(
                    xl: 2,
                    lgUp: 3,
                    mdUp: 4,
                    smUp: 6,
                  ),
                  order: ColumnOrder(
                    lgUp: 2,
                    mdUp: 2,
                    smUp: 0,
                  ),
                  offset: ColumnOffset(
                    xl: 1,
                  ),
                  builder: (context, info) {
                    return ChildItem(
                      color: Colors.orange[600],
                      info: info,
                    );
                  }
                ),
                ResponsiveColumnBuilder(
                  width: ColumnWidth(
                    xl: 2,
                    lgUp: 3,
                    mdUp: 4,
                    smUp: 6,
                  ),
                  order: ColumnOrder(
                    lgUp: 3,
                    mdUp: 0,
                    smUp: 1,
                  ),
                  offset: ColumnOffset(
                    xl: 1,
                  ),
                  builder: (context, info) {
                    return ChildItem(
                      color: Colors.purple[600],
                      info: info,
                    );
                  }
                ),
              ],
            ),
             */
          ],
        ),
      ),
    );
  }
}

class ChildItem extends StatelessWidget {
  final Color color;
  final ColumnInfo info;

  ChildItem({
    @required this.color,
    @required this.info,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: Theme.of(context).textTheme.bodyText1.copyWith(
        color: Colors.white,
      ),
      child: Container(
        color: color,
        alignment: Alignment.center,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              alignment: Alignment.center,
              color: Colors.black.withOpacity(0.1),
              padding: const EdgeInsets.all(8),
              child: Text(
                info.breakPoint.toString(),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(4),
                    child: Text(
                      "width: ${info.width}",
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text(
                      "order: ${info.order}",
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text(
                      "offset: ${info.offset}",
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
