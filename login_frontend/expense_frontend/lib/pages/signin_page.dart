import 'package:flutter/material.dart';
import '../services/api_service.dart';
import 'signup_page.dart';
import 'welcome_page.dart';

class SigninPage extends StatefulWidget {
  final VoidCallback? onLogin;
  const SigninPage({Key? key, this.onLogin}) : super(key: key);

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  signinUser() async {
    final res = await ApiService.signin(email.text, password.text);

    print(res);

    if (res['success']) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Login Successful")));
      if (widget.onLogin != null) widget.onLogin!();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(res['message'] ?? "Invalid credentials")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],

      body: Center(
        child: Container(
          width: 420,
          padding: EdgeInsets.all(30),

          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)],
          ),

          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Sign in",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),

              SizedBox(height: 5),

              Text("Login to continue"),

              SizedBox(height: 30),

              TextField(
                controller: email,
                decoration: InputDecoration(labelText: "Email"),
              ),

              SizedBox(height: 15),

              TextField(
                controller: password,
                obscureText: true,
                decoration: InputDecoration(labelText: "Password"),
              ),

              SizedBox(height: 25),

              SizedBox(
                width: double.infinity,
                height: 45,
                child: ElevatedButton(
                  onPressed: signinUser,
                  child: Text("Sign in"),
                ),
              ),

              SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account? "),

                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignupPage()),
                      );
                    },
                    child: Text(
                      "Sign up",
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
