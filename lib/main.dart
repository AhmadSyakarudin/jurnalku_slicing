import 'package:flutter/material.dart';
import 'package:slicing_jurnalku/explore_page.dart';
import 'package:slicing_jurnalku/guide.dart';
import 'package:slicing_jurnalku/dashboard.dart';
import 'package:slicing_jurnalku/jurnal_page.dart';
import 'package:slicing_jurnalku/login.dart';
import 'package:slicing_jurnalku/progress_page.dart';
import 'package:slicing_jurnalku/saksi.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jurnalku App',
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {
        "/": (context) => LoginPage(),
        "/dashboard": (context) => DashboardPage(),
        "/guide": (context) => GuideApp(),
        "/jurnal": (context) => JurnalPage(),
        "/progress": (context) => ProgressPage(),
        "/saksi": (context) => SaksiPage(),
        "/explore": (context) => ExplorePage(),

      },
    );
  }
}

