import 'package:shared_preferences/shared_preferences.dart';

class PrefKeys {
  static const String mostRecentKey = "most_recent_key";
}

void updateMostRecentIndicesList(int newSuraIndex) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  List<String> mostRecentIndicesList =
      prefs.getStringList(PrefKeys.mostRecentKey) ?? [];
  if (mostRecentIndicesList.contains("$newSuraIndex")) {
    mostRecentIndicesList.remove("$newSuraIndex");
    mostRecentIndicesList.insert(0, "$newSuraIndex");
  } else {
    mostRecentIndicesList.insert(0, "$newSuraIndex");
  }
  if (mostRecentIndicesList.length > 5) {
    mostRecentIndicesList.removeLast();
  }
  await prefs.setStringList(PrefKeys.mostRecentKey, mostRecentIndicesList);
}
