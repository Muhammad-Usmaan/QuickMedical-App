import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quick_medical/screens/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:quick_medical/widgets/btm-navigation.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  loginUser() async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _emailController.text, password: _passwordController.text);
           Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const BottomNavigationView()),
  );
  
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Login",
            style: GoogleFonts.josefinSans(
              fontStyle: FontStyle.italic,
              fontSize: 22,
              color: const Color.fromRGBO(9, 15, 71, 1),
            ),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 80),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                elevation: 8,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Icon(
                    Icons.local_hospital_outlined,
                    color: Colors.blue,
                    size: 42,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Text(
              "Quick Medical",
              style: GoogleFonts.josefinSans(
                fontStyle: FontStyle.italic,
                fontSize: 22,
                color: Color.fromRGBO(9, 15, 71, 1),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Text(
              "Please enter your Email and Password to Login",
              style: GoogleFonts.josefinSans(
                fontSize: 18,
                color: const Color.fromRGBO(9, 15, 71, 0.514),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              width: 400,
              child: TextField(
                controller: _emailController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    hintText: 'Enter you Email'),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              width: 400,
              child: TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    hintText: 'Enter your Password'),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Create an account"),
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SignupView()),
                    );
                  },
                  child: Text("Sign up here"),
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            ElevatedButton(
              onPressed: () {
                loginUser();
              },
              child: Text(
                "CONTINUE",
                style: GoogleFonts.josefinSans(
                  fontSize: 18,
                ),
              ),
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  minimumSize: Size(400, 60),
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}
