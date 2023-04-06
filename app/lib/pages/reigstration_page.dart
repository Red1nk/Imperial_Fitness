import 'package:flutter/material.dart';

class RegistrationPage extends StatefulWidget {
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  String _selectedArmy;
  List<String> _armyList = [    'Imperial Guard',    'Space Marines',    'Chaos Space Marines',    'Eldar',    'Tau Empire',    'Necrons',    'Orks',    'Tyranids'  ];

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState.validate()) {
      // Implement registration logic here
      print('Registration successful!');
      print('Email: ${_emailController.text}');
      print('Password: ${_passwordController.text}');
      print('Selected army: $_selectedArmy');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(labelText: 'Email'),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(labelText: 'Password'),
                obscureText: true,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              Text('Select your army:'),
              DropdownButtonFormField(
                value: _selectedArmy,
                items: _armyList.map((army) {
                  return DropdownMenuItem(
                    value: army,
                    child: Text(army),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedArmy = value;
                  });
                },
                validator: (value) {
                  if (value == null) {
                    return 'Please select your army';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              RaisedButton(
                onPressed: _submitForm,
                child: Text('Register'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
