import 'package:flutter/material.dart';

import '../../view/search/search_view.dart';


class CustomSearchFiled extends StatefulWidget {
  final String hintTxt;

  const CustomSearchFiled({Key? key, required this.hintTxt}) : super(key: key);

  @override
  State<CustomSearchFiled> createState() => _SearchFiled();
}

class _SearchFiled extends State<CustomSearchFiled> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: double.maxFinite,
      child: TextField(
        onTap: () {
          Navigator.push(
            context,
             MaterialPageRoute(
              builder: (context) => SearchPage(),
            ),
          );
        },
        style: const TextStyle(fontSize: 12),
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.search),
          labelStyle: const TextStyle(fontSize: 12),
          hintStyle: const TextStyle(fontSize: 12),
          hintText: widget.hintTxt,
          filled: true,
          fillColor: const Color(0xFFf3f3f2),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Color(0xFFf3f3f2), width: 1),
            borderRadius: BorderRadius.circular(10),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Color(0xFFf3f3f2), width: 1),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        keyboardType: TextInputType.text,
      ),
    );
  }
}
