import 'package:flutter/material.dart';
import 'package:forms/pages/home1.dart';
import 'package:forms/pages/home2.dart';

void main() => runApp(
      MaterialApp(
        initialRoute: '/home1',
        routes: {
          '/home1': (context) => Home1(),
          '/home2': (context) => Home2(),
        },
      ),
    );
