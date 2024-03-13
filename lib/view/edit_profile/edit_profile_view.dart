import 'package:flutter/material.dart';
import '../../common/widget/round_textfield.dart';
import '../profile/widget/profile_pic.dart';

class EditProfileView extends StatefulWidget {
  const EditProfileView({super.key});

  @override
  State<EditProfileView> createState() => _EditProfileViewState();
}

class _EditProfileViewState extends State<EditProfileView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Profile"),
      ),
      body:  Padding(
        padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Custom widget for User Profile Pic from Profile
            const Align(alignment: Alignment.center,child: ProfilePic()),
            const SizedBox(height: 30),

            const Text('   Full Name',style: TextStyle(fontSize: 16,),),
            const SizedBox(height: 10),
            const RoundTextfield(
              hintText: "Enter Name",
              keyboardType: TextInputType.name,
            ),

            const SizedBox(height: 30),

            const Text('   Email',style: TextStyle(fontSize: 16,),),
            const SizedBox(height: 10),
            const RoundTextfield(
              hintText: "Enter Email",
              keyboardType: TextInputType.name,
            ),

            const SizedBox(height: 30),

            const Text('   Password',style: TextStyle(fontSize: 16,),),
            const SizedBox(height: 10),
            const RoundTextfield(
              hintText: "Enter Password",
              keyboardType: TextInputType.name,
            ),

            const SizedBox(height: 100),

            // Buttons for Save and cancel
            //==============================
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //==============================
                // Cancel button
                //==============================

                SizedBox(
                  height: 40,
                  width: 120,
                  child:  ElevatedButton(
                    onPressed: () {
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue, // Change the color to blue
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                    child: const Text('Cancel',style: TextStyle(color: Colors.white),),
                  ),
                ),


                //==============================
                // Save button
                //==============================

                SizedBox(
                  height: 40,
                  width: 120,
                  child: ElevatedButton(
                    onPressed: () {
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue, // Change the color to blue
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                    child: const Text('Save',style: TextStyle(color: Colors.white),),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
