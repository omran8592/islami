import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/model/hadith_model.dart';
import 'package:islami/utils/app_assets.dart';
import 'package:islami/utils/app_colors.dart';
import 'package:islami/utils/app_styles.dart';

class HadithItem extends StatefulWidget {
  int index;

  HadithItem({required this.index});

  @override
  State<HadithItem> createState() => _HadithItemState();
}

class _HadithItemState extends State<HadithItem> {
  Hadith? hadith;

  @override
  void initState() {
    super.initState();
    loadHadithFile(widget.index);
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: width * 0.02,
        vertical: height * 0.02,
      ),
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(image: AssetImage(AppAssets.hadithCardBg)),
      ),
      child:
          hadith == null
              ? const Center(
                child: CircularProgressIndicator(color: AppColors.blakeBgColor),
              )
              : Column(
                children: [
                  Row(
                    children: [
                      Image.asset(AppAssets.hadithBgLeft, width: width * 0.15),
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              hadith?.title ?? "",
                              textAlign: TextAlign.center,
                              style: AppStyles.bold20Black,
                            ),
                          ],
                        ),
                      ),
                      Image.asset(AppAssets.hadithBgRight, width: width * 0.15),
                    ],
                  ),
                  SizedBox(height: height * 0.01),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Text(
                        hadith?.content ?? "",
                        textAlign: TextAlign.center,
                        style: AppStyles.bold16Black,
                      ),
                    ),
                  ),
                  Image.asset(AppAssets.mosqueHadith),
                ],
              ),
    );
  }

  void loadHadithFile(int index) async {
    String fileContent = await rootBundle.loadString(
      "assets/files/hadeeth/h$index.txt",
    );
    int fileLinesIndex = fileContent.indexOf("\n");
    String title = fileContent.substring(0, fileLinesIndex);
    String content = fileContent.substring(fileLinesIndex + 1);
    hadith = Hadith(title: title, content: content);
    setState(() {});
  }
}
