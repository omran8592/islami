import 'package:flutter/material.dart';
import 'package:islami/utils/app_assets.dart';
import 'package:islami/utils/app_styles.dart';

class SebhaTab extends StatefulWidget {
  const SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  int _counter = 33;
  double _rotationAngle = 0;
  int _currentDhikrIndex = 0;
  final List<String> _adhkar = ['سبحان الله', 'الله أكبر', 'الحمد لله'];

  void _rotateSebha() {
    setState(() {
      _rotationAngle += 30;
      _counter--;

      if (_counter <= 0) {
        _counter = 33;
        _currentDhikrIndex = (_currentDhikrIndex + 1) % _adhkar.length;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        children: [
          Text("سَبِّحِ اسْمَ رَبِّكَ الأعلى", style: AppStyles.bold36White),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(AppAssets.group),
                GestureDetector(
                  onTap: _rotateSebha,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Transform.rotate(
                        angle: _rotationAngle * 0.0174533,
                        child: Image.asset(AppAssets.sebhaBody),
                      ),
                      Column(
                        children: [
                          Text(_adhkar[_currentDhikrIndex],
                              style: AppStyles.bold36White),
                          Text("$_counter", style: AppStyles.bold36White),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}