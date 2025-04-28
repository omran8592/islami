import 'package:flutter/material.dart';
import 'package:islami/utils/app_colors.dart';
import 'package:islami/utils/app_styles.dart';

class SuraContent extends StatelessWidget {
  final String suraContent;
  final int index;
  final bool isSelected;

  SuraContent({
    super.key,
    required this.suraContent,
    required this.index,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Container(
      margin: EdgeInsets.only(top: height * 0.02),
      padding: EdgeInsets.symmetric(vertical: height * 0.02),
      decoration: BoxDecoration(
        color:
            isSelected
                ? AppColors.primaryColor.withOpacity(0.2)
                : Colors.transparent,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: AppColors.primaryColor, width: 2),
      ),
      child: Text(
        "$suraContent [${index + 1}]",
        textDirection: TextDirection.rtl,
        textAlign: TextAlign.center,
        style: AppStyles.bold20Primary,
      ),
    );
  }
}
