import 'package:flutter/material.dart';
import 'package:islami/utils/app_colors.dart';

class RadioTab extends StatelessWidget {
  const RadioTab({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blakeColor,
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                Image.asset('assets/images/group_bg6.png'),
                Image.asset('assets/images/group_bg5.png'),
                Image.asset('assets/images/group_bg7.png'),
                Image.asset('assets/images/group_bg8.png'),
                Image.asset('assets/images/group_bg6.png'),
                Image.asset('assets/images/group_bg2.png'),
                Image.asset('assets/images/group_bg.png'),
                Image.asset('assets/images/group_bg3.png'),
                Image.asset('assets/images/group_bg4.png'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}