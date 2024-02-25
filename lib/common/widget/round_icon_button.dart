import 'package:flutter/material.dart';

import '../../utils/color/color.dart';

class RoundIconButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  final String icon;
  final Color color;
  final double fontSize;
  final FontWeight fontWeight;
  const RoundIconButton(
      {super.key,
      required this.title,
      required this.icon,
      required this.color,
      this.fontSize = 12,
      this.fontWeight = FontWeight.w500,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(28),
      ),
      child: Material(type: MaterialType.transparency,
        child: InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(25),
          child: Row(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                icon,
                width: 15,
                height: 15,
                fit: BoxFit.contain,
              ),
              const SizedBox(
                width: 8,
              ),
              Text(
                title,
                style: TextStyle(
                    color: TColor.white,
                    fontSize: fontSize,
                    fontWeight: fontWeight),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
