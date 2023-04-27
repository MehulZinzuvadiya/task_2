import 'package:flutter/material.dart';

import '../Utils/shared_Pref.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController txtemail = TextEditingController();
  TextEditingController txtpassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: txtemail,
                decoration: const InputDecoration(
                  label: Text(
                    "Email",
                    style: TextStyle(color: Color(0xFF000000)),
                  ),
                  prefixIcon: Icon(
                    Icons.email,
                    color: Color(0xFF000000),
                  ),
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF000000), width: 1),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: txtpassword,
                decoration: const InputDecoration(
                  label: Text(
                    "Password",
                    style: TextStyle(color: Color(0xFF000000)),
                  ),
                  prefixIcon: Icon(Icons.lock, color: Color(0xFF000000)),
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF000000), width: 1),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () async {
                  String userEmail = txtemail.text;
                  String userPassword = txtpassword.text;

                  Shr shr = Shr();
                  Map m1 = await shr.readShr();

                  if (userEmail == m1['e1'] && userPassword == m1['p1']) {
                    Navigator.pushNamed(context, 'home');
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Invalid Id or Password")));
                  }
                },
                child: const Text("Login"),
                style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF000000)),
              ),
              const SizedBox(height: 20),
              TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, 'signUp');
                  },
                  child: const Text(
                    "Don't have an account? Sign up.",
                    style: TextStyle(color: Color(0xFF000000)),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}


