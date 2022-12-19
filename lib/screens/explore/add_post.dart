import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:fitness_app/constants/constants.dart';
import 'package:fitness_app/constants/controllers.dart';
import 'package:fitness_app/constants/firebase_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';

class AddPost extends StatefulWidget {
  const AddPost({Key? key}) : super(key: key);

  @override
  State<AddPost> createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {
  File? image;
  final picker = ImagePicker();

  Future pickImage() async {
  final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        image = File(pickedFile.path);
      });
    }
  }

  Future captureImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      setState(() {
        image = File(pickedFile.path);
      });
    }
  }

  Future uploadImageToFirebase() async {
    String fileName = const Uuid().v4();
    Reference firebaseStorageRef =
        FirebaseStorage.instance.ref().child('explore/$fileName');
    UploadTask uploadTask = firebaseStorageRef.putFile(image!);
    try {
      uploadTask.whenComplete(() async {
        String url = await firebaseStorageRef.getDownloadURL();
        firestore
            .collection("users")
            .doc(authController.getCurrentUser())
            .get()
            .then((value) {
          firestore.collection("explore").doc(fileName).set({
            "image": url,
            "id": fileName,
            "uid": authController.getCurrentUser(),
            "name": value["name"],
            "likes": [],
            "comments": [],
            "timestamp": DateTime.now(),
          }).then((value) {
            Get.back();
            Get.back();
            Get.rawSnackbar(
              messageText: Text(
                "Your image is added successfully",
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
    } on FirebaseException catch (error) {
      Get.rawSnackbar(
        messageText: Text(
          error.toString(),
          style: kBodyText.copyWith(color: kBlack),
        ),
        backgroundColor: kWhite,
        snackPosition: SnackPosition.TOP,
        borderRadius: 10,
        margin: const EdgeInsets.all(10),
      );
    }
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
          Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Center(
                child: Text(
                  "Add Image",
                  style: kBodyText.copyWith(
                      fontWeight: FontWeight.bold, fontSize: 24),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    customButton(
                      size,
                      'Camera',
                      Icons.camera_alt,
                    ),
                    customButton(
                      size,
                      'Gallery',
                      Icons.collections,
                    ),
                  ],
                ),
              ),
              Visibility(
                visible: image != null,
                child: AspectRatio(
                  aspectRatio: 4 / 3,
                  child: Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 30),
                      decoration: BoxDecoration(
                        border: Border.all(color: kWhite, width: 1),
                        borderRadius: BorderRadius.circular(24),
                        image: DecorationImage(
                          image: FileImage(image ?? File("")),
                          fit: BoxFit.cover,
                        ),
                      )),
                ),
              ),
            ],
          ),
          Visibility(
            visible: image != null,
            child: GestureDetector(
              onTap: () {
                Get.dialog(
                  SpinKitSpinningLines(color: kRed),
                  barrierDismissible: false,
                );
                uploadImageToFirebase();
              },
              child: Container(
                margin: const EdgeInsets.all(20),
                height: 55,
                decoration: BoxDecoration(
                    color: kWhite, borderRadius: BorderRadius.circular(12)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.upload,
                      color: kBlack,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Add",
                      style: kButtonText.copyWith(color: kBlack),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    ));
  }

  Widget customButton(
    Size size,
    String title,
    IconData icon,
  ) {
    return Flexible(
      child: GestureDetector(
        onTap: () {
          if (title == "Camera") {
            captureImage();
          } else {
            pickImage();
          }
        },
        child: Padding(
          padding: const EdgeInsets.only(
            left: 10.0,
            right: 10.0,
          ),
          child: Container(
            height: 55,
            decoration: BoxDecoration(
                color: kWhite, borderRadius: BorderRadius.circular(12)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  color: kBlack,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  title,
                  style: kButtonText.copyWith(color: kBlack),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
