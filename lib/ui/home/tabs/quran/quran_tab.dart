import 'package:flutter/material.dart';
import 'package:islami/ui/home/tabs/quran/details/sura_details_screen.dart';
import 'package:islami/ui/home/tabs/quran/quran_resources.dart';
import 'package:islami/ui/home/tabs/quran/sura_list_widget.dart';
import 'package:islami/utils/app_assets.dart';
import 'package:islami/utils/app_colors.dart';
import 'package:islami/utils/app_styles.dart';

class QuranTab extends StatelessWidget {
  const QuranTab({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: width * 0.04),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            cursorColor: AppColors.primaryColor,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(
                  color: AppColors.primaryColor,
                  width: 2,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(
                  color: AppColors.primaryColor,
                  width: 2,
                ),
              ),
              prefixIcon: ImageIcon(
                AssetImage(AppAssets.iconSearch),
                color: AppColors.primaryColor,
              ),
              hintText: "Sura Name",
              hintStyle: AppStyles.bold16White,
            ),
          ),
          SizedBox(height: height * 0.02),
          Text("Most Recently ", style: AppStyles.bold16White),
          SizedBox(height: height * 0.01),
          SizedBox(
            width: double.infinity,
            height: height * 0.16,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index) {
                return SizedBox(width: width * 0.02);
              },
              itemBuilder: (context, index) {
                return Container(
                  width: width * 0.75,
                  height: height * 0.16,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: AppColors.primaryColor,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: height * 0.02,
                          horizontal: width * 0.03,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Al-Anbiya", style: AppStyles.bold24Black),
                            Text("الأنبياء", style: AppStyles.bold24Black),
                            Text("112 Verses  ", style: AppStyles.bold14Black),
                          ],
                        ),
                      ),
                      Image.asset(AppAssets.mostRecentlyImage),
                    ],
                  ),
                );
              },
              itemCount: 10,
            ),
          ),
          SizedBox(height: height * 0.01),
          Text("Suras List", style: AppStyles.bold16White),
          SizedBox(height: height * 0.01),
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) {
                return InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed(
                          SuraDetailsScreen.routeName,
                          arguments: index);
                    }
                    , child: SuraListWidget(index: index));
              },
              separatorBuilder: (context, index) {
                return Divider(
                  color: AppColors.whiteColor,
                  thickness: 2,
                  indent: width * 0.09,
                  endIndent: width * 0.05,
                );
              },
              itemCount: QuranResources.versesNumbersList.length,
            ),
          ),
        ],
      ),
    );
  }
}
