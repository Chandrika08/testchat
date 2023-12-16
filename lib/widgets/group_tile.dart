import 'package:testchat/pages/chat_page.dart';
import 'package:testchat/service/database_service.dart';
import 'package:testchat/widgets/widgets.dart';
import 'package:flutter/material.dart';

class GroupTile extends StatefulWidget {
  final String userName;
  final String groupId;
  final String groupName;

  const GroupTile({
    Key? key,
    required this.groupId,
    required this.groupName,
    required this.userName,
  }) : super(key: key);

  @override
  State<GroupTile> createState() => _GroupTileState();
}

class _GroupTileState extends State<GroupTile> {
  String? lastMessage = "";
  late String userName1 = widget.userName;

  @override
  void initState() {
    super.initState();
    // Retrieve the last message when the widget initializes
    getLastMessage();
  }

  void getLastMessage() async {
    // Call a function to get the last message from the group's chat
    String? message = await DatabaseService().getLastMessage(widget.groupId);
    setState(() {
      lastMessage = message;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        nextScreen(
          context,
          ChatPage(
            groupId: widget.groupId,
            groupName: widget.groupName,
            userName: widget.userName,
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
        child: ListTile(
          leading: CircleAvatar(
            radius: 30,
            backgroundColor: Colors.deepPurple,
            child: Text(
              widget.groupName.substring(0, 1).toUpperCase(),
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          title: Text(
            widget.groupName,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text('Take part in the group as $userName1'),
        ),
      ),
    );
  }
}
