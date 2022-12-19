import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_time_format/date_time_format.dart';
import 'package:fitness_app/constants/constants.dart';
import 'package:fitness_app/constants/controllers.dart';
import 'package:fitness_app/constants/firebase_constants.dart';
import 'package:fitness_app/controllers/bottom_nav.dart';
import 'package:fitness_app/screens/explore/add_post.dart';
import 'package:fitness_app/screens/explore/comments.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  final BottomNavController _navController = Get.put(BottomNavController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: kBlack,
        floatingActionButton: FloatingActionButton(
          onPressed: () => Get.to(() => const AddPost())!.then((value) {
            setState(() {});
          }),
          backgroundColor: kRed,
          child: const Icon(Icons.add),
        ),
        body: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                _navController.navigateTo(0);
              },
              child: Center(
                child: SizedBox(
                  height: 55,
                  child: Image.asset("assets/images/logo.png"),
                ),
              ),
            ),
            Expanded(
              child: FutureBuilder<dynamic>(
                  future: FirebaseFirestore.instance
                      .collection("explore")
                      .orderBy("timestamp", descending: true)
                      .get(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return RefreshIndicator(
                        onRefresh: () async {
                          setState(() {});
                        },
                        color: kRed,
                        displacement: 20,
                        child: ListView(
                          children: List.generate(
                            snapshot.data.docs.length,
                            (index) => postCard(
                              size,
                              snapshot.data.docs[index]['id'],
                              snapshot.data.docs[index]['name'],
                              snapshot.data.docs[index]['timestamp'],
                              snapshot.data.docs[index]['image'],
                              snapshot.data.docs[index]['likes']
                                  .contains(authController.getCurrentUser()),
                              snapshot.data.docs[index]['likes'].length,
                              snapshot.data.docs[index]['comments'].length,
                            ),
                          ),
                        ),
                      );
                    } else {
                      return Padding(
                        padding: const EdgeInsets.only(top: 30),
                        child: Center(
                          child: SpinKitSpinningLines(
                            color: kRed,
                          ),
                        ),
                      );
                    }
                  }),
            ),
          ],
        ),
      ),
    );
  }

  Widget postCard(Size size, String id, String name, Timestamp time,
      String image, bool liked, int likes, int comments) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style:
                kBodyText.copyWith(fontSize: 16, fontWeight: FontWeight.w900),
          ),
          const SizedBox(
            height: 2,
          ),
          Text(
            DateTimeFormat.relative(time.toDate(),
                ifNow: 'Now', appendIfAfter: 'ago'),
            style:
                kBodyText.copyWith(fontSize: 10, fontWeight: FontWeight.w900),
          ),
          const SizedBox(
            height: 10,
          ),
          AspectRatio(
            aspectRatio: 4 / 3,
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: kWhite, width: 1),
                borderRadius: BorderRadius.circular(24),
              ),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(24),
                  child: CachedNetworkImage(
                    imageUrl: image,
                    imageBuilder: (context, imageProvider) => Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    errorWidget: (context, url, error) => Icon(
                      Icons.error,
                      color: kWhite,
                    ),
                    placeholder: (context, url) =>
                        SpinKitSpinningLines(color: kRed),
                    fit: BoxFit.cover,
                  )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Row(
              children: [
                IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    firestore.collection("explore").doc(id).update({
                      "likes": liked
                          ? FieldValue.arrayRemove(
                              [authController.getCurrentUser()])
                          : FieldValue.arrayUnion(
                              [authController.getCurrentUser()]),
                    }).then((value) {
                      setState(() {});
                    });
                  },
                  icon: Icon(
                    liked ? Icons.favorite : Icons.favorite_outline,
                    color: liked ? kRed : kWhite,
                    size: 25,
                  ),
                ),
                Text(
                  likes.toString(),
                  style: kBodyText.copyWith(fontSize: 15, color: kGrey),
                ),
                const SizedBox(
                  width: 10,
                ),
                IconButton(
                  onPressed: () =>
                      Get.to(() => CommentsScreen(id: id))!.then((value) {
                    setState(() {});
                  }),
                  icon: Icon(
                    Icons.chat_outlined,
                    color: kWhite,
                    size: 25,
                  ),
                ),
                Text(
                  comments.toString(),
                  style: kBodyText.copyWith(fontSize: 15, color: kGrey),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
