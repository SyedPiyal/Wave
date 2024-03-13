import 'package:ecom_wave/view/edit_profile/edit_profile_view.dart';
import 'package:ecom_wave/view/profile/widget/profile_menu.dart';
import 'package:ecom_wave/view/profile/widget/profile_pic.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../chat/chat_view.dart';



class ProfileView extends StatelessWidget {


  void _showAlertDialog(BuildContext context) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: const Text('Log Out'),
        content: const Text('Are you sure want to Log Out?'),
        actions: <CupertinoDialogAction>[
          CupertinoDialogAction(
            onPressed: () {
              Navigator.pop(context);
            },
            isDefaultAction: true,
            child: const Text('No'),
          ),
          CupertinoDialogAction(
            onPressed: () {
              Navigator.pop(context);
            },
            isDestructiveAction: true,
            child: const Text('Yes'),
          ),
        ],
      ),
    );
  }

  const ProfileView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            const ProfilePic(),
            const SizedBox(height: 20),

            //Account menu
            ProfileMenu(
              press: () {
                Navigator.push(
                  context,
                   MaterialPageRoute(
                    builder: (context) => EditProfileView(),
                  ),
                );
              },
              text: "My Account",
              icon: "assets/icons/User Icon.svg",
            ),

            //Notification Menu
            ProfileMenu(
              press: () {},
              text: "Notifications",
              icon: "assets/icons/Bell.svg",
            ),

            //Settings Menu
            ProfileMenu(
              press: () {},
              text: "Settings",
              icon: "assets/icons/Settings.svg",
            ),

            //help center Menu
            ProfileMenu(
              press: () {
                Navigator.push(
                  context,
                   MaterialPageRoute(
                    builder: (context) => const UserChat(userName: 'Help Center',),
                  ),
                );
              },
              text: "Help Center",
              icon: "assets/icons/Question mark.svg",
            ),

            //Logout Menu
            ProfileMenu(
              press: () {
                _showAlertDialog(context);
              },
              text: "Log Out",
              icon: "assets/icons/Log out.svg",
            ),
          ],
        ),
      ),
    );
  }
}