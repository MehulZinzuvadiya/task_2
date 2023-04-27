import 'package:flutter/material.dart';
import '../Utils/shared_Pref.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController txtemail = TextEditingController();
  TextEditingController txtpassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF000000),
          centerTitle: true,
          elevation: 0,
          title: const Text(
            "Sign Up",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
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
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  var email = txtemail.text;
                  var password = txtpassword.text;
                  Shr shr = Shr();
                  shr.creatShr(email, password);
                  Navigator.pop(context);
                },
                child: const Text("Sign up"),
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF000000)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
