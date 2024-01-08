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
              child: Column(
                children: [
                  SizedBox(height: 20.0),
                  Container(
                    child: Text(
                      tabTitles[index],
                      style: TextStyle(
                        color: index == currentIndex
                            ? AppColors.fontColor
                            : AppColors.hintTextColor,
                      ),
                    ),
                  ),
                  SizedBox(height: 5.0),
                  Container(
                    height: 2.0,
                    width: 30.0,
                    color: index == currentIndex
                        ? AppColors.fontColor
                        : Colors.transparent,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
