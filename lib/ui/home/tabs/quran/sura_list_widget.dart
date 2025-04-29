import 'package:flutter/material.dart';
import 'package:islami/ui/home/tabs/quran/quran_resources.dart';
import 'package:islami/utils/app_assets.dart';
import 'package:islami/utils/app_styles.dart';

class SuraListWidget extends StatelessWidget {
  int index;

  SuraListWidget({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Container(
      child: Row(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Image.asset(AppAssets.vector),
              Text("${index + 1}", style: AppStyles.bold16White),
            ],
          ),
          SizedBox(width: width * 0.04),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                QuranResources.englishQuranList[index],
                style: AppStyles.bold20White,
              ),
              Text(
                "${QuranResources.versesNumbersList[index]}",
                style: AppStyles.bold14White,
              ),
            ],
          ),
          Spacer(),
          Text(
            QuranResources.arabicQuranList[index],
            style: AppStyles.bold20White,
          ),
        ],
      ),
    );
  }
}
