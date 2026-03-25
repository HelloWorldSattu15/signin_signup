import 'package:flutter/material.dart';
import '../services/api_service.dart';
import 'signin_page.dart';

class SignupPage extends StatefulWidget {
  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final TextEditingController name = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  bool remember = true;

  signupUser() async {
    var res = await ApiService.signup(name.text, email.text, password.text);

    print(res);

    if (res['success']) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Signup Successful")));

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => SigninPage()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(res['message'] ?? "Signup Failed")),
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
                "Sign up",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),

              SizedBox(height: 5),

              Text("Sign up to continue"),

              SizedBox(height: 30),

              TextField(
                controller: name,
                decoration: InputDecoration(labelText: "Name"),
              ),

              SizedBox(height: 15),

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
                  onPressed: signupUser,
                  child: Text("Sign up"),
                ),
              ),

              SizedBox(height: 10),

              Row(
                children: [
                  Checkbox(
                    value: remember,
                    onChanged: (v) {
                      setState(() {
                        remember = v!;
                      });
                    },
                  ),

                  Text("Remember me"),
                ],
              ),

              SizedBox(height: 10),

              Text("ACCESS QUICKLY"),

              SizedBox(height: 10),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(onPressed: () {}, child: Text("Google")),

                  ElevatedButton(onPressed: () {}, child: Text("LinkedIn")),

                  ElevatedButton(onPressed: () {}, child: Text("SSO")),
                ],
              ),

              SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have an account? "),

                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SigninPage()),
                      );
                    },
                    child: Text(
                      "Sign in",
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
