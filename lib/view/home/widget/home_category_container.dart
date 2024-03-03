import 'package:flutter/material.dart';

class CategoryContainer extends StatelessWidget {
  final List data;
  final List selectedIndexs;
  final Function(int) onCategoryTap;

  const CategoryContainer({
    Key? key,
    required this.data,
    required this.selectedIndexs,
    required this.onCategoryTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: ListView.builder(
        itemCount: data.length,
        itemBuilder: (BuildContext context, int index) {
          final isSelected = selectedIndexs.contains(index);
          final categoryData = data[index];
          return Ink(
            child: InkWell(
              onTap: () {
                onCategoryTap(index);
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                      color: isSelected ? Colors.red : Colors.black12,
                    ),
                    borderRadius: BorderRadius.circular(6),
                    color: Colors.white,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset(categoryData["image"], width: 30, height: 30),
                      Padding(
                        padding: const EdgeInsets.only(right: 7, left: 5),
                        child: Text(
                          categoryData["text"],
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
