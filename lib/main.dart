import 'package:flutter/material.dart';
import 'package:hal_labeling_pre/pages/home.dart';

import 'pages/my_gallery.dart';
import 'pages/tagInput.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: Home.ROUTE,
      routes: {
        Home.ROUTE: (context) => Home(),
        TagInput.ROUTE: (context) => TagInput(),
        PageMyGallery.ROUTE: (context) => PageMyGallery(),
      },
    );
  }
}
