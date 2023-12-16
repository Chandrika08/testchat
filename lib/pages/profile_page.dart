import 'package:flutter/material.dart';
import 'package:testchat/pages/home_page.dart';
import 'package:testchat/service/auth_service.dart';
import 'package:testchat/widgets/widgets.dart';

class ProfilePage extends StatefulWidget {
  String userName;
  String email;

  ProfilePage({Key? key, required this.email, required this.userName})
      : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool isEditing = false;
  TextEditingController fullNameController = TextEditingController();
  AuthService authService = AuthService();

  @override
  void initState() {
    super.initState();
    fullNameController.text = widget.userName;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            nextScreenReplace(context, HomePage());
          },
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 4, 58, 103),
                Color.fromARGB(255, 68, 183, 255),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        elevation: 0,
        title: const Text(
          "Profile",
          style: TextStyle(
            color: Colors.white,
            fontSize: 27,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10),
            _buildCard("Email", widget.email, "Email cannot be changed"),
            SizedBox(height: 20),
            _buildEditableCard(
              "Full Name",
              fullNameController,
              () {
                setState(() {
                  isEditing = !isEditing;
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCard(String title, String content, String footer) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      elevation: 2,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: TextStyle(fontSize: 17)),
            SizedBox(height: 8),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(content, style: TextStyle(fontSize: 17)),
            ),
            SizedBox(height: 20),
            Text(
              footer,
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEditableCard(
    String title,
    TextEditingController controller,
    VoidCallback onTap,
  ) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(title, style: TextStyle(fontSize: 17)),
                isEditing
                    ? Row(
                        children: [
                          ElevatedButton(
                            onPressed: () async {
                              await authService.updateUsername(controller.text);
                              setState(() {
                                widget.userName = controller.text;
                                isEditing = false;
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Colors.black,
                              elevation: 5,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                            child: Text(
                              "Save",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                isEditing = false;
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Colors.red,
                              elevation: 5,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                            child: Text(
                              "Cancel",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ],
                      )
                    : ElevatedButton(
                        onPressed: onTap,
                        style: ElevatedButton.styleFrom(
                          primary: Colors.black,
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        child: Text(
                          "Edit",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ),
              ],
            ),
            SizedBox(height: 8),
            isEditing
                ? TextFormField(
                    controller: controller,
                    style: TextStyle(fontSize: 17),
                  )
                : Text(
                    widget.userName,
                    style: TextStyle(fontSize: 17),
                  ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
