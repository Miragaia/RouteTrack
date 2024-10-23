import 'package:flutter/material.dart';
import 'package:routertrack/routes.dart';
import 'package:firebase_core/firebase_core.dart';

import 'database/database.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final database = AppDatabase();
  await database.into(database.todoItems).insert(TodoItemsCompanion.insert(
    title: 'todo: finish drift setup',
    content: 'We can now write queries and define our own tables.',
  ));
  List<TodoItem> allItems = await database.select(database.todoItems).get();
  print('items in database: $allItems');
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RouterTrack',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: AppRoutes.splashScreen,
      routes: AppRoutes.routes,
    );
  }
}
