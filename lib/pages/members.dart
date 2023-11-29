import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MembersPage extends StatefulWidget {
  @override
  _MembersPageState createState() => _MembersPageState();
}

class _MembersPageState extends State<MembersPage> {
  late Future<List<Map<String, dynamic>>> _users;

  @override
  void initState() {
    super.initState();
    // Fetch the list of users (you may need to replace this with your own logic)
    _users = getUsers();
  }

  Future<List<Map<String, dynamic>>> getUsers() async {
    // Fetch user data from Firestore or any other data source
    QuerySnapshot<Map<String, dynamic>> users =
        await FirebaseFirestore.instance.collection('users').get();

    // Process the data and return a list of users
    return users.docs.map((DocumentSnapshot<Map<String, dynamic>> doc) {
      // Determine role based on the first character of email
      String email = doc['email'] ?? '';
      String role =
          email.isNotEmpty && email[0].toLowerCase().contains(RegExp(r'[a-z]'))
              ? 'Admin'
              : 'Student';

      return {
        'userName': doc['fullName'] ?? '',
        'email': email,
        'role': role,
      };
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: _users,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else {
            List<Map<String, dynamic>> users = snapshot.data ?? [];

            if (users.isEmpty) {
              return Center(
                child: Text('No members available.'),
              );
            }

            return ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(users[index]['userName']),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(users[index]['email']),
                          Text('Role: ${users[index]['role']}'),
                        ],
                      ),
                    ],
                  ),
                  // You can add more information or actions here
                );
              },
            );
          }
        },
      ),
    );
  }
}
