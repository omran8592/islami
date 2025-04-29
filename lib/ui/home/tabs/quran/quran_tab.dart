import 'package:flutter/material.dart';
import 'package:islami/ui/home/tabs/quran/details/most_recent_widget.dart';
import 'package:islami/ui/home/tabs/quran/details/sura_details_screen.dart';
import 'package:islami/ui/home/tabs/quran/quran_resources.dart';
import 'package:islami/ui/home/tabs/quran/sura_list_widget.dart';
import 'package:islami/utils/app_assets.dart';
import 'package:islami/utils/app_colors.dart';
import 'package:islami/utils/app_styles.dart';
import 'package:islami/utils/shared_prefes_utils.dart';

class QuranTab extends StatefulWidget {
  QuranTab({super.key});

  @override
  State<QuranTab> createState() => _QuranTabState();
}

class _QuranTabState extends State<QuranTab> {
  List<int> filterIndicesList = List.generate(114, (index) => index);

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
            onChanged: (newText) {
              filterListByNewText(newText);
            },
            style: AppStyles.bold20White,
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
          MostRecentWidget(),
          SizedBox(height: height * 0.01),
          Text("Suras List", style: AppStyles.bold16White),
          SizedBox(height: height * 0.01),
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) {
                return InkWell(
                    onTap: () {
                      updateMostRecentIndicesList(filterIndicesList[index]);
                      Navigator.of(context).pushNamed(
                          SuraDetailsScreen.routeName,
                          arguments: filterIndicesList[index]);
                    }
                    , child: SuraListWidget(index: filterIndicesList[index]));
              },
              separatorBuilder: (context, index) {
                return Divider(
                  color: AppColors.whiteColor,
                  thickness: 2,
                  indent: width * 0.09,
                  endIndent: width * 0.05,
                );
              },
              itemCount: filterIndicesList.length,
            ),
          ),
        ],
      ),
    );
  }

  void filterListByNewText(String newText) {
    List<int> filterList = [];
    for (int i = 0; i < QuranResources.englishQuranList.length; i++) {
      if (QuranResources.englishQuranList[i].toLowerCase().contains(
          newText.toLowerCase())) {
        filterList.add(i);
      }
      else if (QuranResources.arabicQuranList[i].contains(newText)) {
        filterList.add(i);
      }
      filterIndicesList = filterList;
      setState(() {

      });
    }

  }
}
