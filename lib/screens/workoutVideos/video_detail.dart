import 'package:fitness_app/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class WorkoutVideoDetail extends StatefulWidget {
  final String title;
  final String description;
  final String difficultyLevel;
  final String muscleGroup;
  final String equipment;
  final String location;
  final String videoURL;
  final String thumbnail;

  const WorkoutVideoDetail({
    super.key,
    required this.title,
    required this.description,
    required this.difficultyLevel,
    required this.muscleGroup,
    required this.equipment,
    required this.location,
    required this.videoURL,
    required this.thumbnail,
  });

  @override
  State<WorkoutVideoDetail> createState() => _WorkoutVideoDetailState();
}

class _WorkoutVideoDetailState extends State<WorkoutVideoDetail> {
  final videoUrl = "https://www.youtube.com/watch?v=X_9VoqR5ojM";

  late YoutubePlayerController _playerController;

  @override
  void initState() {
    final videoId = YoutubePlayer.convertUrlToId(videoUrl);

    _playerController = YoutubePlayerController(
        initialVideoId: videoId!,
        flags: const YoutubePlayerFlags(
          autoPlay: false,
        ));

    super.initState();
  }

  @override
  void dispose() {
    _playerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      backgroundColor: kBlack,
      appBar: AppBar(
        backgroundColor: kBlack,
        title: SizedBox(
          height: 55,
          child: Image.asset("assets/images/logo.png"),
        ),
        centerTitle: true,
        leading: Center(
          child: GestureDetector(
            onTap: () => Get.back(),
            child: Container(
              padding: const EdgeInsets.only(right: 4),
              margin: const EdgeInsets.only(left: 10),
              height: 32,
              width: 32,
              decoration: BoxDecoration(color: kDark, shape: BoxShape.circle),
              child: Center(
                child: Icon(
                  Icons.arrow_back_ios_new,
                  color: kWhite,
                  size: 18,
                ),
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: AspectRatio(
                      aspectRatio: 16 / 9,
                      child: YoutubePlayer(
                        controller: _playerController,
                        showVideoProgressIndicator: true,
                        progressIndicatorColor: kRed,
                        progressColors: ProgressBarColors(
                            backgroundColor: kRed.withOpacity(0.2),
                            bufferedColor: kRed.withOpacity(0.4),
                            playedColor: kRed.withOpacity(0.7),
                            handleColor: kRed),
                      )),
                ),
                // Padding(
                //   padding: const EdgeInsets.symmetric(vertical: 20.0),
                //   child:
                //   _videoPlayerController.value.isInitialized
                //       ? AspectRatio(
                //           aspectRatio: _videoPlayerController.value.aspectRatio,
                //           child:
                //         )
                //       : Container(
                //           //margin: const EdgeInsets.only(bottom: 15, right: 15),
                //           padding: const EdgeInsets.all(15),
                //           width: size.width,
                //           height: 190,
                //           decoration: BoxDecoration(
                //               borderRadius: BorderRadius.circular(24)),
                //           child: Center(
                //             child: SpinKitSpinningLines(
                //               color: kRed,
                //             ),
                //           ),
                //         ),
                // ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 30),
              child: Text(
                widget.title,
                style: kBodyText.copyWith(
                    fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Text(
                'Description',
                style: kBodyText.copyWith(
                    fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 20, right: 20, top: 5, bottom: 20),
              child: Text(
                widget.description,
                style: kBodyText.copyWith(fontSize: 13),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                children: [
                  Flexible(
                    child: Column(
                      children: [
                        Text(
                          'Difficulty Level',
                          style: kBodyText.copyWith(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          height: 50,
                          decoration: BoxDecoration(
                              color: kWhite,
                              borderRadius: BorderRadius.circular(12)),
                          child: Center(
                              child: Text(
                            widget.difficultyLevel,
                            style: kButtonText,
                          )),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Flexible(
                    child: Column(
                      children: [
                        Text(
                          'Muscle Group',
                          style: kBodyText.copyWith(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          height: 50,
                          decoration: BoxDecoration(
                              color: kWhite,
                              borderRadius: BorderRadius.circular(12)),
                          child: Center(
                              child: Text(
                            widget.muscleGroup,
                            style: kButtonText,
                          )),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                children: [
                  Flexible(
                    child: Column(
                      children: [
                        Text(
                          'Equipment',
                          style: kBodyText.copyWith(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          height: 50,
                          decoration: BoxDecoration(
                              color: kWhite,
                              borderRadius: BorderRadius.circular(12)),
                          child: Center(
                              child: Text(
                            widget.equipment,
                            style: kButtonText,
                          )),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Flexible(
                    child: Column(
                      children: [
                        Text(
                          'Location',
                          style: kBodyText.copyWith(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          height: 50,
                          decoration: BoxDecoration(
                              color: kWhite,
                              borderRadius: BorderRadius.circular(12)),
                          child: Center(
                              child: Text(
                            widget.location,
                            style: kButtonText,
                          )),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
