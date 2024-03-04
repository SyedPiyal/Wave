import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchViewBottomSheetWidget extends StatefulWidget {
  const SearchViewBottomSheetWidget({super.key});

  @override
  State<SearchViewBottomSheetWidget> createState() => _SearchViewBottomSheetWidgetState();
}


class _SearchViewBottomSheetWidgetState extends State<SearchViewBottomSheetWidget> {
  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 200,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text('Filter Search'),
            /*ElevatedButton(
              child: const Text('Close BottomSheet'),
              onPressed: () => Navigator.pop(context),
            ),*/
          ],
        ),
      ),
    );
  }
}
