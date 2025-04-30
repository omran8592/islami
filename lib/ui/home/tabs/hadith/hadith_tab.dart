import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:islami/ui/home/tabs/hadith/hadith_item.dart';

class HadithTab extends StatelessWidget {
  const HadithTab({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.only(bottom: height * 0.03),
      child: CarouselSlider(
        options: CarouselOptions(
          height: height * 0.75,
          viewportFraction: 0.8,
          enlargeCenterPage: true,
          enableInfiniteScroll: true,
        ),
        items:
            List.generate(50, (index) => index + 1).map((i) {
              return HadithItem(index: i);
            }).toList(),
      ),
    );
  }
}
