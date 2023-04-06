import 'package:flutter/material.dart';
import 'package:app/pages/home_page.dart';
import 'package:app/lib/pages/nutrition.dart';
import 'package:app/lib/pages/profile.dart';
import 'package:app/lib/pages/settings.dart';
import 'package:app/lib/pages/workouts.dart';
import 'package:app/lib/pages/register.dart';
import "package:couchbase_lite/couchbase_lite.dart";

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CouchbaseLite.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Database _database = await CouchbaseLite.openDatabase("imperial_fitness");
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Imperial Fitness',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: StreamBuilder(
        stream: _database.currentUserChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            final User user = snapshot.data;
            if (user == null) {
              return Home();
            } else {
              return Profile();
            }
          }
          return CircularProgressIndicator();
        },
      ),
      routes: {
        Home.routeName: (context) => Home(),
        Workouts.routeName: (context) => Workouts(),
        Nutrition.routeName: (context) => Nutrition(),
        Settings.routeName: (context) => Settings(),
        Register.routeName: (context) => Register(),
      },
    );
  }
}