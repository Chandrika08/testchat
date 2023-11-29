import 'package:flutter/material.dart';

class MessageTile extends StatefulWidget {
  final String message;
  final String sender;
  final bool sentByMe;

  const MessageTile({
    Key? key,
    required this.message,
    required this.sender,
    required this.sentByMe,
  }) : super(key: key);

  @override
  State<MessageTile> createState() => _MessageTileState();
}

class _MessageTileState extends State<MessageTile> {
  @override
  Widget build(BuildContext context) {
    double maxWidth = MediaQuery.of(context).size.width - 140;
    return Container(
      padding: EdgeInsets.only(
        top: 15,
        bottom: 2,
        left: widget.sentByMe ? 0 : 15,
        right: widget.sentByMe ? 15 : 0,
      ),
      alignment: widget.sentByMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: widget.sentByMe
            ? const EdgeInsets.only(left: 130)
            : const EdgeInsets.only(right: 130),
        padding: const EdgeInsets.only(
          top: 12,
          bottom: 12,
          left: 12,
          right: 1,
        ),
        decoration: BoxDecoration(
          borderRadius: widget.sentByMe
              ? const BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(2), // Adjust this value
                )
              : const BorderRadius.only(
                  topLeft: Radius.circular(2), // Adjust this value
                  topRight: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                  bottomLeft: Radius.circular(15),
                ),
          gradient: widget.sentByMe
              ? LinearGradient(
                  colors: [
                    Color.fromARGB(255, 2, 134, 15),
                    Color.fromARGB(255, 68, 255, 109)
                  ],
                )
              : LinearGradient(
                  colors: [
                    Color.fromARGB(255, 68, 183, 255),
                    Color.fromARGB(255, 4, 58, 103),
                  ],
                ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 20, // Adjust the size as needed
              backgroundColor: Colors.purpleAccent[100],
              child: Text(
                widget.sender.substring(0, 1).toUpperCase(),
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(width: 10), // Adjust the spacing as needed
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.sender.toUpperCase(),
                    textAlign: TextAlign.start,
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      letterSpacing: -0.5,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    widget.message,
                    textAlign: TextAlign.start,
                    style: const TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
