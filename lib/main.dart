import 'package:flutter/material.dart';
import 'package:slicing_jurnalku/explore_page.dart' as PublicExplore;
import 'package:slicing_jurnalku/explore1.dart' as PrivateExplore;
import 'package:slicing_jurnalku/guide.dart';
import 'package:slicing_jurnalku/dashboard.dart';
import 'package:slicing_jurnalku/jurnal_page.dart';
import 'package:slicing_jurnalku/login.dart';
import 'package:slicing_jurnalku/progress_page.dart';
import 'package:slicing_jurnalku/saksi.dart';
import 'package:slicing_jurnalku/catatan_sikap.dart';
import 'package:slicing_jurnalku/settings.dart';
import 'package:slicing_jurnalku/profile.dart';

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
      initialRoute: "/explore",
      routes: {
        "/": (context) => PublicExplore.DirectoryPage(),

        "/login": (context) => LoginPage(),
        "/dashboard": (context) => DashboardPage(),
        "/guide": (context) => GuideApp(),
        "/jurnal": (context) => JurnalPage(),
        "/progress": (context) => ProgressPage(),
        "/saksi": (context) => SaksiPage(),

        "/explore": (context) => PublicExplore.DirectoryPage(),

        "/explore-private": (context) => PrivateExplore.DirectoryPage(),

        "/catatan-sikap": (context) => CatatanSikap(),
        "/profile": (context) => ProfileScreen(),
        "/settings": (context) => Settings(),
      },
    );
  }
}
