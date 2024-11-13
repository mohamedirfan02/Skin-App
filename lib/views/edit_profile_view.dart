import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:skin_app/views/profile_view.dart';
import 'dart:io';
import '../custom_widgets/custom_button.dart';
import '../custom_widgets/custom_text_widgets.dart';
import '../custom_widgets/custom_textformfield.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  File? _image;

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(width: 48,height: 40),
              TextWidget(
                text: "Edit Profile",
                textColor: Colors.black,
                textSize: 18,
                fontWeight: FontWeight.bold,
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ProfileScreen()),
                  );
                },
                child: TextWidget(
                  text: "Cancel",
                  textSize: 12,
                  textColor: Colors.orange,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18,vertical: 20),
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  Center(
                    child: Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        CircleAvatar(
                          radius: 50,
                          backgroundImage: _image != null
                              ? FileImage(_image!)
                              : AssetImage('assets/images/profile.png') as ImageProvider,
                        ),
                        Positioned(
                          top: 70,
                          bottom: 0,
                          right: 0,
                          child: IconButton(
                            onPressed: _pickImage,
                            icon: Container(
                              // color: Colors.white,
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                color: Colors.pink.shade300,
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Colors.white, // Set the border color to white
                                  width: 2.0, // Increase the border width
                                ),
                              ),
                              child: Icon(
                                Icons.camera_alt_outlined,
                                color: Colors.white,
                                size: 19,
                              ),
                            ),
                            color: Colors.blueAccent,
                            iconSize: 30,
                            padding: EdgeInsets.all(0),
                            constraints: BoxConstraints(),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  // Divider(
                  //   color: Colors.grey,
                  //   thickness: 0.5,
                  // ),




                  // IconButton(
                  //   onPressed: () {},
                  //   icon: Icon(Icons.person, size: 30, color: Colors.grey),
                  // ),
                  CustomTextFormField(hintText: 'Kate Norman', iconData: Icons.person),
                  // TextWidget(
                  //   text: "Kate Norman",
                  //   textColor: Colors.black,
                  //   textSize: 17,
                  //   fontWeight: FontWeight.bold,
                  // ),


                  SizedBox(height: 370,),
                  CustomButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ProfileScreen()),
                      );
                    }, buttonText: 'Save Changes',
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