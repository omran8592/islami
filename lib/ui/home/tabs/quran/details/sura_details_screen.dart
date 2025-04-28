import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/ui/home/tabs/quran/details/sura_content.dart';
import 'package:islami/ui/home/tabs/quran/quran_resources.dart';
import 'package:islami/utils/app_assets.dart';
import 'package:islami/utils/app_colors.dart';
import 'package:islami/utils/app_styles.dart';

class SuraDetailsScreen extends StatefulWidget {
  static const String routeName = "sura_details";

  SuraDetailsScreen({super.key});

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  List<String> verses = [];
  int? selectedVerseIndex;

  @override
  Widget build(BuildContext context) {
    int index = ModalRoute.of(context)?.settings.arguments as int;
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    if (verses.isEmpty) {
      loadSuraFile(index);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          QuranResources.englishQuranList[index],
          style: AppStyles.bold20Primary,
        ),
      ),
      body: Container(
        color: AppColors.blakeBgColor,
        padding: EdgeInsets.symmetric(horizontal: width * 0.04),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(AppAssets.detailsLeftBg),
                Text(
                  QuranResources.arabicQuranList[index],
                  style: AppStyles.bold24Primary,
                ),
                Image.asset(AppAssets.detailsRightBg),
              ],
            ),
            Expanded(
              child:
                  verses.isEmpty
                      ? Center(
                        child: CircularProgressIndicator(
                          color: AppColors.primaryColor,
                        ),
                      )
                      : ListView.separated(
                        separatorBuilder: (context, index) {
                          return SizedBox(height: height * 0.01);
                        },
                        itemBuilder: (context, idx) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedVerseIndex = idx;
                              });
                            },
                            child: SuraContent(
                              suraContent: verses[idx],
                              index: idx,
                              isSelected: selectedVerseIndex == idx,
                            ),
                          );
                        },
                        itemCount: verses.length,
                      ),
            ),
            Image.asset(AppAssets.mosqueBg),
          ],
        ),
      ),
    );
  }

  void loadSuraFile(int index) async {
    String fileContent = await rootBundle.loadString(
      "assets/files/${index + 1}.txt",
    );
    List<String> suraLines = fileContent.split("\n");
    verses = suraLines;
    Future.delayed(const Duration(seconds: 1), () => setState(() {}));
  }
}
