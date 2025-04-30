import 'package:flutter/material.dart';
import 'package:islami/provider/most_recent_provider.dart';
import 'package:islami/ui/home/tabs/quran/details/sura_details_screen.dart';
import 'package:islami/ui/home/tabs/quran/quran_resources.dart';
import 'package:islami/utils/app_assets.dart';
import 'package:islami/utils/app_colors.dart';
import 'package:islami/utils/app_styles.dart';
import 'package:provider/provider.dart';

class MostRecentWidget extends StatefulWidget {
  MostRecentWidget({super.key});

  @override
  State<MostRecentWidget> createState() => _MostRecentWidgetState();
}

class _MostRecentWidgetState extends State<MostRecentWidget> {
  late MostRecentListProvider provider;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      provider.refreshMostRecentList();
    });
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    provider = Provider.of<MostRecentListProvider>(context);

    return Visibility(
      visible: provider.mostRecentList.isNotEmpty,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
                return GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      SuraDetailsScreen.routeName,
                      arguments: provider.mostRecentList[index],
                    );
                  },
                  child: Container(
                    width: width * 0.80,
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
                              Text(
                                QuranResources.englishQuranList[provider
                                    .mostRecentList[index]],
                                style: AppStyles.bold24Black,
                              ),
                              Text(
                                QuranResources.arabicQuranList[provider
                                    .mostRecentList[index]],
                                style: AppStyles.bold24Black,
                              ),
                              Text(
                                "${QuranResources.versesNumbersList[provider.mostRecentList[index]]} Verses",
                                style: AppStyles.bold14Black,
                              ),
                            ],
                          ),
                        ),
                        Image.asset(AppAssets.mostRecentlyImage),
                      ],
                    ),
                  ),
                );
              },
              itemCount: provider.mostRecentList.length,
            ),
          ),
        ],
      ),
    );
  }
}
