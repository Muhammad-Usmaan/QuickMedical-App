import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quick_medical/screens/login.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  registerUser() async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passController.text,
      );
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const LoginView()),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    double _screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Signup",
            style: GoogleFonts.josefinSans(
              fontStyle: FontStyle.italic,
              fontSize: 22,
              color: Color.fromRGBO(9, 15, 71, 1),
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
              "Please enter your Email and Password to Sign up",
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
                controller: emailController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    hintText: 'Enter your Email'),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              width: 400,
              child: TextField(
                obscureText: true,
                controller: passController,
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
                Text("Already have an account?"),
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginView()),
                    );
                  },
                  child: Text("Login here"),
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            ElevatedButton(
              onPressed: () async {
                await registerUser();
              },
              child: Text(
                "Create Account",
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
