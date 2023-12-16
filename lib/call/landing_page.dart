// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:testchat/call/call_page.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  TextEditingController callIdController = TextEditingController();
  TextEditingController userIdController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  // ignore: unused_field
  bool _callIdSelected = false;
  // ignore: unused_field
  bool _userIdSelected = false;
  // ignore: unused_field
  bool _userNameSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Stack(
        children: [
          // Gradient background
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomRight,
                colors: [
                  Color.fromARGB(255, 255, 255, 255),
                  Color.fromARGB(255, 223, 197, 244),
                ],
              ),
            ),
          ),
          // Content
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16.0, bottom: 16.0),
                child: Text(
                  'Connect with your friends instantly!',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Text(
                    'Enter your details to join the call:',
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              Container(
                width: MediaQuery.of(context).size.width - 32.0,
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                margin: const EdgeInsets.symmetric(vertical: 8.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: TextFormField(
                  controller: callIdController,
                  decoration: InputDecoration(
                    hintText: 'Enter Call ID',
                    labelText: 'Call ID',
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.all(12.0),
                  ),
                  onTap: () {
                    setState(() {
                      _callIdSelected = true;
                      _userIdSelected = false;
                      _userNameSelected = false;
                    });
                  },
                ),
              ),
              const SizedBox(height: 12.0),
              Container(
                width: MediaQuery.of(context).size.width - 32.0,
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                margin: const EdgeInsets.symmetric(vertical: 8.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: TextFormField(
                  controller: userIdController,
                  decoration: InputDecoration(
                    hintText: 'Enter User ID',
                    labelText: 'User ID',
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.all(12.0),
                  ),
                  onTap: () {
                    setState(() {
                      _userIdSelected = true;
                      _callIdSelected = false;
                      _userNameSelected = false;
                    });
                  },
                ),
              ),
              const SizedBox(height: 12.0),
              Container(
                width: MediaQuery.of(context).size.width - 32.0,
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                margin: const EdgeInsets.symmetric(vertical: 8.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: TextFormField(
                  controller: userNameController,
                  decoration: InputDecoration(
                    hintText: 'Enter Username',
                    labelText: 'Username',
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.all(12.0),
                  ),
                  onTap: () {
                    setState(() {
                      _userNameSelected = true;
                      _callIdSelected = false;
                      _userIdSelected = false;
                    });
                  },
                ),
              ),
              const SizedBox(height: 20.0),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue[700],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32.0,
                    vertical: 16.0,
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CallPage(
                        callID: callIdController.text,
                        userID: userIdController.text,
                        userName: userNameController.text,
                      ),
                    ),
                  );
                },
                child: const Text('Join the Call'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
