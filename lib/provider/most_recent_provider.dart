import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/shared_prefes_utils.dart';

class MostRecentListProvider extends ChangeNotifier {
  List<int> mostRecentList = [];

  void refreshMostRecentList() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> mostRecentIndicesAsString =
        prefs.getStringList(PrefKeys.mostRecentKey) ?? [];
    mostRecentList =
        mostRecentIndicesAsString.map((element) => int.parse(element)).toList();
    notifyListeners();
  }
}
