import 'package:flutter/material.dart';
import 'package:islami/ui/home/tabs/hadith/hadith_tab.dart';
import 'package:islami/ui/home/tabs/quran/quran_tab.dart';
import 'package:islami/ui/home/tabs/radio/radio_tab.dart';
import 'package:islami/ui/home/tabs/sebha/sebha_tab.dart';
import 'package:islami/ui/home/tabs/time/time_tab.dart';
import 'package:islami/utils/app_assets.dart';
import 'package:islami/utils/app_colors.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "home_screen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  List<String> backgroundImages = [
    AppAssets.quranBg,
    AppAssets.hadithBg,
    AppAssets.sebhaBg,
    AppAssets.radioBg,
    AppAssets.timeBG,
  ];
  List <Widget> tabsList = [
    QuranTab(), HadithTab(), SebhaTab(), RadioTab(), TimeTab()
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(backgroundImages[selectedIndex],
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.fill,),
        Scaffold(
          bottomNavigationBar: Theme(
            data: Theme.of(context).copyWith(
                canvasColor: AppColors.primaryColor
            ),
            child: BottomNavigationBar(
                selectedItemColor: AppColors.whiteColor,
                unselectedItemColor: AppColors.blakeColor,
                showSelectedLabels: true,
                currentIndex: selectedIndex,
                onTap: (index) {
                  selectedIndex = index;
                  setState(() {

                  });
                },
                // backgroundColor:AppColors.primaryColor ,
                // type: BottomNavigationBarType.fixed,
                items: [
                  BottomNavigationBarItem(icon:
                  builtItemsInBottomavBar(
                      index: 0, imageName: AppAssets.iconQuran)
                      , label: "Quran"),
                  BottomNavigationBarItem(icon:
                  builtItemsInBottomavBar(
                      index: 1, imageName: AppAssets.iconHadith)
                      , label: "Hadith"),
                  BottomNavigationBarItem(icon:
                  builtItemsInBottomavBar(
                      index: 2, imageName: AppAssets.iconSebha)
                      , label: "Sebha"),
                  BottomNavigationBarItem(icon:
                  builtItemsInBottomavBar(
                      index: 3, imageName: AppAssets.iconRadio)
                      , label: "Radio"),
                  BottomNavigationBarItem(icon:
                  builtItemsInBottomavBar(
                      index: 4, imageName: AppAssets.iconTime)
                      , label: "Time"),

                ]),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(AppAssets.logo),
              Expanded(child: tabsList[selectedIndex]),
            ],
          ),
        )
      ],
    );
  }

  Widget builtItemsInBottomavBar({required int index,
    required String imageName}) {
    return selectedIndex == index ?
    Container(
      padding: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 6
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(66),
          color: AppColors.blakeBgColor
      ),
      child: ImageIcon(AssetImage(
          imageName
      )),
    ) : ImageIcon(AssetImage(
        imageName
    ));
  }
}
