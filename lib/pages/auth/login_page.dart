import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:testchat/helper/helper_function.dart';
import 'package:testchat/pages/auth/forgot_password.dart';
import 'package:testchat/pages/auth/register_page.dart';
import 'package:testchat/pages/home_page.dart';
import 'package:testchat/service/auth_service.dart';
import 'package:testchat/service/database_service.dart';
import 'package:testchat/widgets/widgets.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  String email = "";
  String password = "";
  bool _isEmailValid = true;
  bool _isPasswordValid = true;
  bool _isLoading = false;
  AuthService authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(90),
        child: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          elevation: 0,
          flexibleSpace: ClipPath(
            clipper: AppBarClipper(),
            child: Container(
              color: Colors.indigo,
            ),
          ),
          title: Text(
            "CHAT BUDDY",
            style: TextStyle(
              color: Colors.white,
              fontSize: 24, // Adjust the font size as needed
              // You can also use other TextStyle properties like fontWeight, letterSpacing, etc.
            ),
          ),
          centerTitle: true,
        ),
      ),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(
                color: Theme.of(context).primaryColor,
              ),
            )
          : SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.asset(
                            "assets/iiit.png",
                            width: MediaQuery.of(context).size.width *
                                0.47, // set your desired width
                            height: MediaQuery.of(context).size.width *
                                0.2, // set your desired height
                          ),
                          SizedBox(
                              width: MediaQuery.of(context).size.width * 0.05),
                          Text(
                            'Proudly\nPresenting you',
                            style: TextStyle(fontSize: 22),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                      const SizedBox(height: 50),
                      Image.asset("assets/download.png"),
                      const SizedBox(height: 50),
                      TextFormField(
                        decoration: textInputDecoration.copyWith(
                          labelText: "Email",
                          prefixIcon: Icon(
                            Icons.email,
                            color: Colors.indigo, // Change to indigo color
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color:
                                    Colors.indigo), // Change border line color
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.indigo.withOpacity(
                                    0.5)), // Change border line color
                          ),
                        ),
                        autocorrect: false,
                        textCapitalization: TextCapitalization.none,
                        onChanged: (val) {
                          setState(() {
                            email = val;
                          });
                        },
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              !value.contains('iiitdwd.ac.in')) {
                            _isEmailValid = false;
                            return 'Invalid email address';
                          }
                          _isEmailValid = true;
                          return null;
                        },
                      ),
                      const SizedBox(height: 25),
                      TextFormField(
                        obscureText: true,
                        decoration: textInputDecoration.copyWith(
                          labelText: "Password",
                          prefixIcon: Icon(
                            Icons.lock,
                            color: Colors.indigo, // Change to indigo color
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color:
                                    Colors.indigo), // Change border line color
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.indigo.withOpacity(
                                    0.5)), // Change border line color
                          ),
                        ),
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              !RegExp(
                                r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]+$',
                              ).hasMatch(value)) {
                            _isPasswordValid = false;
                            return 'Invalid Password';
                          }
                          _isPasswordValid = true;
                          return null;
                        },
                        onChanged: (val) {
                          setState(() {
                            password = val;
                          });
                        },
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ResetScreen()));
                            },
                            child: const Text(
                              "Forgot Password?",
                              style: TextStyle(
                                color: Colors.black,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      SizedBox(
                        width: 160, // Adjust the width as needed
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.indigo, // Mix of grey and black
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  15), // Adjust the border radius
                            ),
                          ),
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 10), // Adjust the padding
                            child: Center(
                              child: Text(
                                "Sign In",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18), // Adjust the font size
                              ),
                            ),
                          ),
                          onPressed: () {
                            login();
                          },
                        ),
                      ),
                      SizedBox(
                        height: 35,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 2.0, // Height of the line
                            width: 100.0, // Width of the line
                            color: Colors.grey, // Color of the line
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.0),
                            child: Text(
                              'OR',
                              style: TextStyle(
                                  fontSize: 18.0, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            height: 2.0, // Height of the line
                            width: 100.0, // Width of the line
                            color: Colors.grey, // Color of the line
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 35,
                      ),
                      Text.rich(
                        TextSpan(
                          text: "Need an account? ",
                          style: const TextStyle(
                              color: Colors.black, fontSize: 14),
                          children: <TextSpan>[
                            TextSpan(
                              text: "Sign Up",
                              style: const TextStyle(
                                color: Colors.black,
                                decoration: TextDecoration.underline,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  nextScreen(context, const RegisterPage());
                                },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }

  login() async {
    if (formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      await authService.loginWithUserNameandPassword(email, password).then(
        (value) async {
          if (value == true) {
            // Fetching user data from Firestore
            QuerySnapshot snapshot = await DatabaseService(
                    uid: FirebaseAuth.instance.currentUser!.uid)
                .gettingUserData(email);

            // Checking if the email is verified
            bool isEmailVerified =
                FirebaseAuth.instance.currentUser!.emailVerified;

            if (isEmailVerified) {
              // If email is verified, save user details and navigate to HomePage
              await HelperFunctions.saveUserLoggedInStatus(true);
              await HelperFunctions.saveUserEmailSF(email);
              await HelperFunctions.saveUserNameSF(
                  snapshot.docs[0]['fullName']);
              nextScreenReplace(context, const HomePage());
            } else {
              // If email is not verified, show a snackbar
              showSnackbar(context, Colors.red,
                  'Email address not verified. Please verify your email.');
            }

            setState(() {
              _isLoading = false;
            });
          } else {
            // If login is unsuccessful, show a snackbar
            showSnackbar(context, Colors.red, value);
            setState(() {
              _isLoading = false;
            });
          }
        },
      );
    }
  }
}

class AppBarClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - 40);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 40);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
