import 'package:flutter/material.dart';
import 'package:shyp/screen/orders.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (context, orientation, deviceType) {
      return MaterialApp(
        title: 'Shyp',
        theme: ThemeData(
          fontFamily: 'Poppins',
        ),
        home: Orders(),
      );
    });
  }
}
