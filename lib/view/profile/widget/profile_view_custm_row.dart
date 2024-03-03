
import 'package:flutter/material.dart';

class ProfileViewCustomRow extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  const ProfileViewCustomRow({super.key, required this.title, required this.subtitle, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [

        //leading icon

        CircleAvatar(backgroundColor: const Color(0xffEBFAEF),
          child: Icon(icon),
        ),

        //title and sub title
        Column(
          children: [
            Text(title),
            Text(subtitle,style: const TextStyle(fontWeight: FontWeight.w300),),
          ],
        ),

        //arrow icon

        const Icon(Icons.arrow_right)
      ],
    );
  }
}
