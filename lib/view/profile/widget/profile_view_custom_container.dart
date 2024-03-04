
import 'package:flutter/material.dart';

class ProfileViewCustomContainer extends StatelessWidget {

  final String name;
  final IconData icon;
  final VoidCallback onTap;
  const ProfileViewCustomContainer({super.key, required this.name, required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color(0xff0299a4),
        ),
        margin: const EdgeInsets.symmetric(horizontal: 5,vertical: 5),
        //padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
        child: Material(
          type: MaterialType.transparency,
          child: InkWell(

            //for changing splash radious
            borderRadius: BorderRadius.circular(10),
            onTap: onTap,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Column(
                children: [
                  Icon(icon,color: Colors.white,),
                  Text(name,style: const TextStyle(color: Colors.white,fontSize: 10),)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
