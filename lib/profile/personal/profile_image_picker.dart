import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:poseapp/common/color2.dart';
import 'package:poseapp/profile/personal/image_helper.dart';

class ProfileImagePicker extends StatefulWidget {
  const ProfileImagePicker({super.key});

  @override
  State<ProfileImagePicker> createState() => _ProfileImagePickerState();
}

class _ProfileImagePickerState extends State<ProfileImagePicker> {
  File? selectedImage;

  @override
  void initState() {
    super.initState();
    _loadSavedImage();
  }

  Future<void> _loadSavedImage() async {
    String? imagePath = await DBHelper.getImagePath();

    if (imagePath != null && await File(imagePath).exists()) {
      setState(() {
        selectedImage = File(imagePath);
      });
    } else {
      await DBHelper.deleteImagePath();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          selectedImage != null
              ? CircleAvatar(
                  radius: 85,
                  backgroundImage: FileImage(selectedImage!),
                )
              : const CircleAvatar(
                  radius: 85,
                  backgroundImage: NetworkImage(
                      "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png"),
                ),
          Positioned(
            bottom: 0,
            left: 130,
            child: IconButton(
              onPressed: () {
                showImagePickerOption(context);
              },
              icon: const Icon(
                Icons.add_a_photo,
                color: Color.fromARGB(209, 255, 255, 255),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void showImagePickerOption(BuildContext context) {
    showModalBottomSheet(
        backgroundColor: backscreen,
        context: context,
        builder: (builder) {
          return Padding(
            padding: const EdgeInsets.all(18.0),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 4.5,
              child: Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        _pickImageFromGallery();
                      },
                      child: const SizedBox(
                        child: Column(
                          children: [
                            Icon(
                              Icons.image,
                              size: 70,
                              color: Color.fromARGB(210, 255, 255, 255),
                            ),
                            Text(
                              "Gallery",
                              style: TextStyle(
                                color: Color.fromARGB(200, 255, 255, 255),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        _pickImageFromCamera();
                      },
                      child: const SizedBox(
                        child: Column(
                          children: [
                            Icon(
                              Icons.camera_alt,
                              size: 70,
                              color: Color.fromARGB(210, 255, 255, 255),
                            ),
                            Text(
                              "Camera",
                              style: TextStyle(
                                color: Color.fromARGB(200, 255, 255, 255),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  Future _pickImageFromGallery() async {
    final returnImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (returnImage == null) return;

    setState(() {
      selectedImage = File(returnImage.path);
    });

    // Save the image path in SQLite
    await DBHelper.saveImagePath(returnImage.path);

    Navigator.of(context).pop();
  }

  Future _pickImageFromCamera() async {
    final returnImage =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (returnImage == null) return;

    setState(() {
      selectedImage = File(returnImage.path);
    });

    await DBHelper.saveImagePath(returnImage.path);

    Navigator.of(context).pop();
  }
}
