import 'package:flutter/material.dart';
import 'package:forms/classes/user.dart';

class Home1 extends StatelessWidget {
  const Home1({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registration Page'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: RegistrationForm(),
      ),
    );
  }
}

class RegistrationForm extends StatefulWidget {
  const RegistrationForm({Key? key});

  @override
  _RegistrationFormState createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _password1Controller = TextEditingController();
  final TextEditingController _password2Controller = TextEditingController();

  String errorText = "";

  insertIntoDbKunwari() async {
    await Future.delayed(Duration(seconds: 2), () {
      print('inserted into db');
    });
  }

  void clearFields() {
    _usernameController.clear();
    _password1Controller.clear();
    _password2Controller.clear();
    errorText = "";
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextField(
          controller: _usernameController,
          decoration: InputDecoration(labelText: 'Username'),
        ),
        SizedBox(height: 16.0),
        TextField(
          controller: _password1Controller,
          obscureText: true,
          decoration: InputDecoration(labelText: 'Password'),
        ),
        SizedBox(height: 16.0),
        TextField(
          controller: _password2Controller,
          obscureText: true,
          decoration: InputDecoration(labelText: 'Confirm Password'),
        ),
        SizedBox(height: 16.0),
        ElevatedButton(
          onPressed: () async {
            String username = _usernameController.text;
            String password1 = _password1Controller.text;
            String password2 = _password2Controller.text;
            if (username.isEmpty || password1.isEmpty || password2.isEmpty) {
              setState(() {
                clearFields();
                errorText = 'Please fill in all fields!';
              });
              return;
            } else if (password1 != password2) {
              setState(() {
                clearFields();
                errorText = 'Please match the passwords!';
              });
              return;
            } else {
              User userInstance = User(
                username: username,
                password: password1,
              ); // just to show classes
              await insertIntoDbKunwari();
              print('printed after insert');
              Navigator.pushReplacementNamed(
                context,
                '/home2',
                arguments: {
                  'username': username,
                  'password': password1,
                },
              );
            }
            clearFields();
          },
          child: Text('Register'),
        ),
        Text(
          errorText,
          style: const TextStyle(
            color: Colors.red,
          ),
        ),
      ],
    );
  }
}
