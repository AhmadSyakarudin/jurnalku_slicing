import 'package:flutter/material.dart';
import 'package:slicing_jurnalku/catatan_sikap.dart';
import 'package:slicing_jurnalku/settings.dart';
import 'package:slicing_jurnalku/profile.dart';
import 'package:slicing_jurnalku/catatan_sikap.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Jurnalku',
      home: CatatanSikap(),
    );
  }
}
