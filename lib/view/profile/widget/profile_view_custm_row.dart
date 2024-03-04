
import 'package:flutter/material.dart';

class ProfileViewCustomRow extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final VoidCallback onTap;
  const ProfileViewCustomRow({super.key, required this.title, required this.subtitle, required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(5),
      onTap: onTap,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

          //leading icon

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 7,horizontal: 5),
            child: CircleAvatar(backgroundColor: const Color(0xffEBFAEF),
              child: Icon(icon),
            ),
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
      ),
    );
  }
}
