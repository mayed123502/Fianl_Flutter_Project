import 'package:e_commerce/provider/filter_category.dart';
import 'package:e_commerce/screens/user/favoritePage.dart';
import 'package:e_commerce/widget/sign_up.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FilterCategoryUser extends StatefulWidget {
  
  static const String id = 'FilterCategoryUser';

  @override
  _FilterCategoryUserState createState() => _FilterCategoryUserState();
}

class _FilterCategoryUserState extends State<FilterCategoryUser> {
  final items = [
    "Jacket",
    "Dress Shirt",
    "Socks",
    "Shirt",
    "Shoes",
    "All Product"
  ];
  final itemProv = ["jacket", "dressShirt", "socks", "shirt", "shoes", null];

  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              items[index],
              style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 350,
              child: CupertinoPicker(
                looping: true,
                itemExtent: 64,
                children: items
                    .map(
                      (item) => Center(
                        child: Text(item),
                      ),
                    )
                    .toList(),
                onSelectedItemChanged: (item) {
                  setState(() {
                    index = item;
                  });
                  Provider.of<FilterCategoryItem>(context, listen: false)
                      .newCategoryUser(itemProv[item]);
                },
              ),
            ),
            SizedBox(
              height: 50,
            ),
            SignUp(() {
              Navigator.pushNamed(context, FavoritePage.id);
            }, "filter", 150.0)
          ],
        ),
      ),
    );
  }
}
