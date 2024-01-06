import 'package:flutter/material.dart';
import 'package:project/util/colors.dart';

class TabBarContainer extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTabSelected;

  final List<String> tabTitles;

  const TabBarContainer({
    Key? key,
    required this.currentIndex,
    required this.onTabSelected,
    required this.tabTitles,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: tabTitles.length,
        itemBuilder: (context, index) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 30.0),
            child: TextButton(
              onPressed: () {
                onTabSelected(index);
              },
              style: ButtonStyle(
                overlayColor: MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                    return Colors.transparent;
                  },
                ),
                foregroundColor: MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                    return index == currentIndex
                        ? AppColors.fontColor
                        : AppColors.hintTextColor;
                  },
                ),
              ),
              child: Container(
                child: Padding(
                  padding: EdgeInsets.only(bottom: 5.0),
                  child: Text(
                    tabTitles[index],
                    style: TextStyle(
                      color: index == currentIndex
                          ? AppColors.fontColor
                          : AppColors.hintTextColor,
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: index == currentIndex
                          ? AppColors.fontColor
                          : Colors.transparent,
                      width: 2.0,
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
