// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

class CallPage extends StatelessWidget {
  // ignore: use_super_parameters
  const CallPage({
    Key? key,
    required this.callID,
    required this.userID,
    required this.userName,
  }) : super(key: key);
  final String callID;
  final String userID;
  final String userName;

  @override
  Widget build(BuildContext context) {
    return ZegoUIKitPrebuiltCall(
      appID:
          688680283, // Fill in the appID that you get from ZEGOCLOUD Admin Console.
      appSign:
          "4d8d1513424d24e71d3869053e006cbda97b580ee1bff08209b5fab329f90b07", // Fill in the appSign that you get from ZEGOCLOUD Admin Console.
      userID: userID,
      userName: userName,
      callID: callID,
      // You can also use groupVideo/groupVoice/oneOnOneVoice to make more types of calls.
      config: ZegoUIKitPrebuiltCallConfig.oneOnOneVideoCall()
        ..onOnlySelfInRoom = (context) => Navigator.of(context).pop(),
    );
  }
}