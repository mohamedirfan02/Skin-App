import 'package:flutter/material.dart';
import 'package:skin_app/shared/extensions.dart';
import 'package:skin_app/views/home_view.dart';

import 'edit_profile_view.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            context.goto(()=> HomeScreen());
          },
        ),
        title:  Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Profile',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Column(
              children: [
                const SizedBox(height: 110),
                Container(
                  // color: Color(0xFFF7F7F7),
                  height: 180,
                  margin: const EdgeInsets.symmetric(horizontal: 23),
                  padding:
                  const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xFFE0E0E0) ,
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(onPressed: () {
                            context.goto(() =>  const EditProfile());
                          },
                              icon: Icon(Icons.edit_calendar_outlined, color: Colors.blue,)),
                          const Text("Edit", style: TextStyle(color: Colors.blue),),
                        ],
                      ),
                      const Text(
                        'Kate Norman',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black
                        ),
                      ),
                      const Divider(),
                      const SizedBox(height: 8),
                      const Row(
                        children: [
                          Text(
                            'Email Id',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              'abc@email.com',
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const Divider(color: Colors.lightBlueAccent,),
                    ],
                  ),
        
                ),
        
              ],
            ),
            const Positioned(
              top: 30,
              child: CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage("assets/images/profile.png"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}