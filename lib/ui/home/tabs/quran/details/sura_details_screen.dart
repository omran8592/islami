import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/provider/most_recent_provider.dart';
import 'package:islami/ui/home/tabs/quran/details/sura_content.dart';
import 'package:islami/ui/home/tabs/quran/quran_resources.dart';
import 'package:islami/utils/app_assets.dart';
import 'package:islami/utils/app_colors.dart';
import 'package:islami/utils/app_styles.dart';
import 'package:provider/provider.dart';

class SuraDetailsScreen extends StatefulWidget {
  static const String routeName = "sura_details";

  SuraDetailsScreen({super.key});

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  List<String> verses = [];
  late MostRecentListProvider provider;
  int? selectedVerseIndex;
  late int index;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    // لازم نأخر شوية علشان نضمن إن context جهز
    WidgetsBinding.instance.addPostFrameCallback((_) {
      index = ModalRoute.of(context)?.settings.arguments as int;
      loadSuraFile(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    provider = Provider.of<MostRecentListProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          isLoading ? "Loading..." : QuranResources.englishQuranList[index],
          style: AppStyles.bold20Primary,
        ),
      ),
      body: Container(
        color: AppColors.blakeBgColor,
        padding: EdgeInsets.symmetric(horizontal: width * 0.04),
        child:
            isLoading
                ? Center(
                  child: CircularProgressIndicator(
                    color: AppColors.primaryColor,
                  ),
                )
                : Column(
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
                      child: ListView.separated(
                        separatorBuilder:
                            (context, index) => SizedBox(height: height * 0.01),
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

  @override
  void dispose() {
    super.dispose();
    provider.refreshMostRecentList();
  }

  void loadSuraFile(int index) async {
    try {
      String fileContent = await rootBundle.loadString(
        "assets/files/${index + 1}.txt",
      );
      setState(() {
        verses = fileContent.split("\n");
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        verses = ["Error loading sura."];
        isLoading = false;
      });
    }
  }
}
