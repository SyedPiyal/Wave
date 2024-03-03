import 'package:ecom_wave/view/chat/chat_view.dart';
import 'package:ecom_wave/view/profile/widget/profile_view_custm_row.dart';
import 'package:ecom_wave/view/profile/widget/profile_view_custom_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //==============================
              // profile image
              //==============================
              const CircleAvatar(
                backgroundImage: AssetImage("assets/image/iv_profile.jpg"),
                radius: 30,
              ),
              const SizedBox(height: 10),
              //==============================
              // user name
              //==============================
              const Text(
                'User Name',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),

              //==============================
              // user email address
              //==============================

              const Text(
                'user@example.com',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(
                height: 10,
              ),

              //==============================
              // row for user order,profile,address and message option
              //==============================

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [

                  //order button

                  ProfileViewCustomContainer(
                    onTap: () {},
                    name: 'Order',
                    icon: Icons.list_alt_sharp,

                  ),

                  //profile button

                  ProfileViewCustomContainer(
                    onTap: () {},
                    name: 'Profile',
                    icon: Icons.account_circle,

                  ),

                  //address button

                  ProfileViewCustomContainer(
                    onTap: () {},
                    name: 'Address',
                    icon: Icons.location_on_outlined,

                  ),

                  //message button

                  ProfileViewCustomContainer(
                    onTap: () {
                      Navigator.push(
                        context,
                         MaterialPageRoute(
                          builder: (context) => const UserChat(userName: 'Customer Care', userImage: "assets/image/iv_profile.jpg"),
                        ),
                      );
                    },
                    name: 'Message',
                    icon: Icons.message,

                  ),
                ],
              ),

              SizedBox(
                height: 15,
              ),
              const Divider(
                color: Colors.black12,
              ),
              const ProfileViewCustomRow(
                  title: 'UserName', subtitle: 'Arik', icon: CupertinoIcons.person),
              const SizedBox(
                height: 10,
              ),
              const ProfileViewCustomRow(
                  title: 'Notification',
                  subtitle: 'view notification',
                  icon: Icons.notification_important_rounded),

              const SizedBox(
                height: 10,
              ),
              const ProfileViewCustomRow(
                  title: 'Settings',
                  subtitle: 'language,log out',
                  icon: CupertinoIcons.settings),
            ],
          ),
        ),
      ),
    );
  }
}
