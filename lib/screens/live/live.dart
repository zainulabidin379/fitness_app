import 'package:fitness_app/constants/constants.dart';
import 'package:fitness_app/constants/controllers.dart';
import 'package:fitness_app/constants/firebase_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'dart:math';

import 'package:zego_uikit_prebuilt_live_streaming/zego_uikit_prebuilt_live_streaming.dart';

class LiveScreen extends StatelessWidget {
  const LiveScreen({
    super.key
  });


  final int appID = 513137546;
  final String appSign =
      '9bde21c054c12de69abf76b46ed27cc357d214cafa0e317801efbb74dd9fe565';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: StreamBuilder<dynamic>(
        stream: firestore.collection("users").doc(authController.getCurrentUser()).snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ZegoUIKitPrebuiltLiveStreaming(
            appID: appID,
            appSign: appSign,
            userID: authController.getCurrentUser(),
            userName: snapshot.data["name"],
            liveID: "789654123",
            config: ZegoUIKitPrebuiltLiveStreamingConfig.audience()
              ..audioVideoViewConfig.showAvatarInAudioMode = true
              ..audioVideoViewConfig.showSoundWavesInAudioMode = true,
          );
          } else {
            return Center(child: SpinKitSpinningLines(color: kRed));
          }
        }
      ),
    );
  }
}
