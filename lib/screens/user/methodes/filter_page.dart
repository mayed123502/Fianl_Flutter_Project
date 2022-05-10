
import 'package:e_commerce/screens/user/favoritePage.dart';
import 'package:e_commerce/screens/user/profilPage.dart';
import 'package:e_commerce/screens/user/searchPage.dart';
import 'package:e_commerce/screens/user/settingsPage.dart';
import 'package:e_commerce/screens/user/filtterPage.dart';

import 'package:flutter/cupertino.dart';

// ignore: non_constant_identifier_names
FiltersPage(int index, BuildContext context) {
  switch (index) {
    case 0:
      Navigator.pushNamed(context, SearchPage.id);
      break;
    case 1:
      Navigator.pushNamed(context, ProfilePage.id);

      break;
    case 2:
      Navigator.pushNamed(context, FilterPage.id);

      break;
    case 3:
      Navigator.pushNamed(context, SettingsPage.id);

      break;
    case 4:
      Navigator.pushNamed(context, FavoritePage.id);

      break;
  }
}
