import 'package:flutter/material.dart';
import '../../utils/color/color.dart';
import 'package:flutter/cupertino.dart';


class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  final double fontSize;
  const CustomButton({super.key, required this.onPressed, required this.title,this.fontSize = 16,});

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: 350,height: 56,
      child: ElevatedButton(onPressed: onPressed,style: ElevatedButton.styleFrom(backgroundColor: Color(0xFF196076)), child: Text(title,style: TextStyle(
          color:Colors.white, fontSize: fontSize, fontWeight: FontWeight.w600),)),
    );
  }
}
