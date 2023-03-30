import 'package:finance/add_bills.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'finance_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      routes: {
        '/':(context) => FinanceApp(),
        '/add':(context) => AddExpenses()
      },
    );
  }
}
