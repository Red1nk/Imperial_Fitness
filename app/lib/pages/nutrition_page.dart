import 'package:flutter/material.dart';

class NutritionPage extends StatefulWidget {
  @override
  _NutritionPageState createState() => _NutritionPageState();
}

class _NutritionPageState extends State<NutritionPage> {
  final _formKey = GlobalKey<FormState>();

  String _foodName = '';
  int _calories = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nutrition'),
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(labelText: 'Food Name'),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter a food name';
                  }
                  return null;
                },
                onSaved: (value) {
                  _foodName = value;
                },
              ),
              SizedBox(height: 20.0),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Calories'),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter the number of calories';
                  }
                  return null;
                },
                onSaved: (value) {
                  _calories = int.parse(value);
                },
              ),
              SizedBox(height: 20.0),
              RaisedButton(
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    _formKey.currentState.save();
                    // Do something with the food name and calories values
                  }
                },
                child: Text('Add'),
              ),
              SizedBox(height: 20.0),
              Text(
                'Total Calories: $_calories',
                style: TextStyle(fontSize: 24.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
