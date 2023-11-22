import 'package:flutter/material.dart';
import 'dart:io' as Platform;
import 'package:login_app/tela_principal.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool validateInputs() {
    String username = _usernameController.text.trim();
    String password = _passwordController.text.trim();

    if (username.isEmpty || password.isEmpty) {
      _showAlert("Ambos os campos devem ser preenchidos.");
      return false;
    }

    if (password.length < 2) {
      _showAlert("A senha deve ter pelo menos dois caracteres.");
      return false;
    }

    RegExp validCharacters = RegExp(r'^[a-zA-Z0-9]+$');
    if (!validCharacters.hasMatch(password)) {
      _showAlert("A senha não pode ter caracteres especiais.");
      return false;
    }

    if (username.length > 20 || password.length > 20) {
      _showAlert("Os campos não podem ter mais de 20 caracteres.");
      return false;
    }

    if (username.endsWith(' ') || password.endsWith(' ')) {
      _showAlert("Os campos não podem terminar com espaço no final.");
      return false;
    }

    return true;
  }

  void _showAlert(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Alerta"),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("OK"),
            ),
          ],
        );
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(labelText: 'Username'),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(labelText: 'Password'),
            ),
            SizedBox(height: 32.0),
            ElevatedButton(
              onPressed: () {
                if (validateInputs()) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TelaPrincipal(),
                    ),
                  );
                }
              },
              child: Text('Login'),
            ),
            SizedBox(height: 16.0),
            GestureDetector(

              child: Text(
                'Política de Privacidade',
                style: TextStyle(
                  color: Colors.blue,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
