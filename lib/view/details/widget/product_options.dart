import 'package:flutter/material.dart';

class SizeOption extends StatelessWidget {
  final String size;
  final bool isSelected;
  final Function() onSelect;

  SizeOption({
    required this.size,
    required this.isSelected,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onSelect,
      child: Container(
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.only(right: 8),
        decoration: BoxDecoration(
          color: isSelected ? Colors.deepOrange : Colors.grey,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Text(
          size,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}


// color_option.dart



class ColorOption extends StatelessWidget {
  final String color;
  final bool isSelected;
  final Function() onSelect;

  ColorOption({
    required this.color,
    required this.isSelected,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onSelect,
      child: Container(
        width: 20,
        height: 20,
        margin: const EdgeInsets.only(right: 8),
        decoration: BoxDecoration(
          color: _getColor(),
          shape: BoxShape.circle,
          border: Border.all(
            color: isSelected ? Colors.deepOrange : Colors.grey,
            width: 2,
          ),
        ),
      ),
    );
  }

  Color _getColor() {
    switch (color) {
      case 'Blue':
        return Colors.blue;
      case 'Red':
        return Colors.red;
      case 'Yellow':
        return Colors.yellow;
      case 'Pink':
        return Colors.pink;
      default:
        return Colors.grey;
    }
  }
}

