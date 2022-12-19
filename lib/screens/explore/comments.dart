import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_time_format/date_time_format.dart';
import 'package:fitness_app/constants/constants.dart';
import 'package:fitness_app/constants/controllers.dart';
import 'package:fitness_app/constants/firebase_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

class CommentsScreen extends StatefulWidget {
  final String id;
  const CommentsScreen({Key? key, required this.id}) : super(key: key);

  @override
  State<CommentsScreen> createState() => _CommentsScreenState();
}

class _CommentsScreenState extends State<CommentsScreen> {
  TextEditingController commentController = TextEditingController();

  @override
  void dispose() {
    commentController.dispose();
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  StreamBuilder<dynamic>(
                      stream: FirebaseFirestore.instance
                          .collection("explore")
                          .doc(widget.id)
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return postCard(
                            size,
                            snapshot.data['id'],
                            snapshot.data['name'],
                            snapshot.data['timestamp'],
                            snapshot.data['image'],
                            snapshot.data['likes']
                                .contains(authController.getCurrentUser()),
                            snapshot.data['likes'].length,
                            snapshot.data['comments'].length,
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
                  StreamBuilder<dynamic>(
                      stream: FirebaseFirestore.instance
                          .collection("explore")
                          .doc(widget.id)
                          .collection("comments")
                          .orderBy("timestamp", descending: true)
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return snapshot.data.docs.length > 0
                              ? Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Comments",
                                          style: kBodyText.copyWith(
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        ...List.generate(
                                            snapshot.data.docs.length,
                                            (index) => Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    const SizedBox(
                                                      height: 10,
                                                    ),
                                                    Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        Text(
                                                          snapshot.data
                                                                  .docs[index]
                                                              ["name"],
                                                          style: kBodyText
                                                              .copyWith(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                        ),
                                                        const SizedBox(
                                                          width: 5,
                                                        ),
                                                        Text(
                                                          "(${DateTimeFormat.relative(snapshot.data.docs[index]["timestamp"].toDate(), ifNow: 'Now', appendIfAfter: 'ago')})",
                                                          style: kBodyText
                                                              .copyWith(
                                                            fontSize: 9,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    const SizedBox(
                                                      height: 5,
                                                    ),
                                                    Text(
                                                      snapshot.data.docs[index]
                                                          ["comment"],
                                                      style: kBodyText.copyWith(
                                                        fontSize: 14,
                                                      ),
                                                    ),
                                                    Visibility(
                                                      visible: snapshot.data
                                                                  .docs.length -
                                                              1 !=
                                                          index,
                                                      child: Divider(
                                                        color: kLightGrey
                                                            .withOpacity(0.5),
                                                      ),
                                                    )
                                                  ],
                                                )),
                                      ]),
                                )
                              : Center(
                                  child: Padding(
                                  padding: const EdgeInsets.all(20),
                                  child: Text(
                                    "No comments yet!",
                                    style: kBodyText,
                                  ),
                                ));
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
                  const SizedBox(
                    height: 20,
                  )
                ],
              ),
            ),
          ),
          TextField(
            onSubmitted: (value) {
              addComment();
            },
            controller: commentController,
            cursorColor: kBlack,
            style: kBodyText.copyWith(color: kBlack),
            textInputAction: TextInputAction.done,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              fillColor: kLightGrey,
              filled: true,
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 18, horizontal: 20),
              hintText: "Write your comment",
              hintStyle: kBodyText.copyWith(color: kBlack),
              suffixIcon: IconButton(
                onPressed: () {
                  addComment();
                },
                icon: Icon(
                  Icons.send,
                  color: kRed,
                  size: 25,
                ),
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: kLightGrey,
                  width: 1,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: kLightGrey,
                  width: 1,
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }

  Future addComment() async {
    if (commentController.text.isNotEmpty) {
      Get.dialog(
        SpinKitSpinningLines(color: kRed),
        barrierDismissible: false,
      );
      FocusScope.of(context).unfocus();
      String id = const Uuid().v4();
      await firestore
          .collection("users")
          .doc(authController.getCurrentUser())
          .get()
          .then((value) {
        firestore
            .collection("explore")
            .doc(widget.id)
            .collection("comments")
            .doc(id)
            .set({
          "id": id,
          "uid": authController.getCurrentUser(),
          "name": value["name"],
          "comment": commentController.text,
          "timestamp": DateTime.now(),
        }).then((value) {
          firestore.collection("explore").doc(widget.id).update({
            "comments": FieldValue.arrayUnion([id]),
          }).then((value) {
            commentController.clear();
            Get.back();
            Get.rawSnackbar(
              messageText: Text(
                "Comment added successfully",
                style: kBodyText.copyWith(color: kBlack),
              ),
              backgroundColor: kWhite,
              snackPosition: SnackPosition.TOP,
              borderRadius: 10,
              margin: const EdgeInsets.all(10),
            );
          });
        });
      });
    }
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
                  onPressed: () => Get.to(() => CommentsScreen(id: id)),
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
