import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void> registerUser() async {
    final String apiUrl = 'http://localhost:5984/my_app/users';
    Map<String, String> headers = {'Content-Type': 'application/json'};

    final response = await http.post(Uri.parse(apiUrl), headers: headers, body: jsonEncode({
      "email": emailController.text,
      "password": passwordController.text,
      "army": null,
      "rank": null,
      "avatar": null
    }));

    if (response.statusCode == 201) {
      print("User registered successfully");
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Profile()));
    } else {
      throw Exception('Failed to register user');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Imperial Fitness"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(hintText: "Email"),
              ),
              TextFormField(
                controller: passwordController,
                decoration: InputDecoration(hintText: "Password"),
                obscureText: true,
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  registerUser();
                },
                child: Text("Register"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Profile"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage("assets/images/avatar.png"),
            ),
            SizedBox(height: 16),
            Text("Experience: 0/100"),
            LinearProgressIndicator(
              value: 0.5,
              backgroundColor: Colors.grey,
              valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
            ),
            SizedBox(height: 16),
            Text("Rank: Cadet"),
          ],
        ),
      ),
    );
  }
}