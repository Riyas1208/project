import 'package:flutter/material.dart';
import 'package:project/util/colors.dart';

class TabBarContainer extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTabSelected;

  const TabBarContainer({
    Key? key,
    required this.currentIndex,
    required this.onTabSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 3,
        itemBuilder: (context, index) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 30.0),
            child: TextButton(
              onPressed: () {
                onTabSelected(index);
              },

              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                    return index == currentIndex
                        ? AppColors.fontColor
                        : AppColors.hintTextColor;
                  },
                ),
              ),
              child: Container(
                child: Text(
                  index == 0 ? 'New Arrivals' : index == 1
                      ? 'Trending'
                      : 'Brands',
                  style: TextStyle(
                    color: index == currentIndex
                        ? AppColors.fontColor
                        : AppColors.hintTextColor,
                  ),
                ),

                decoration: BoxDecoration(

                  border: Border(
                    bottom: BorderSide(
                      color: index == currentIndex
                          ? AppColors.fontColor
                          : Colors.transparent,
                      width: 5.0,
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
