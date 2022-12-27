import 'package:flutter/material.dart';
import 'dart:math';

import 'package:zego_uikit_prebuilt_live_streaming/zego_uikit_prebuilt_live_streaming.dart';

class LiveScreen extends StatelessWidget {
  const LiveScreen({
    super.key,
  });

  final int appID = 513137546;
  final String appSign =
      '9bde21c054c12de69abf76b46ed27cc357d214cafa0e317801efbb74dd9fe565';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ZegoUIKitPrebuiltLiveStreaming(
        appID: appID,
        appSign: appSign,
        userID: "1234567",
        userName: 'Test User',
        liveID: "12345",
        config: ZegoUIKitPrebuiltLiveStreamingConfig.host()
          ..audioVideoViewConfig.showAvatarInAudioMode = true
          ..audioVideoViewConfig.showSoundWavesInAudioMode = true,
      ),
    );
  }
}
