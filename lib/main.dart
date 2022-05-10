import 'package:e_commerce/auth/log_in_screen.dart';
import 'package:e_commerce/auth/sign_login.dart';
import 'package:e_commerce/auth/sign_up_screen.dart';
import 'package:e_commerce/provider/addProductToCart.dart';
import 'package:e_commerce/provider/counter_order.dart';
import 'package:e_commerce/provider/filter_category.dart';
import 'package:e_commerce/provider/imageProfil.dart';
import 'package:e_commerce/provider/invisible_icon.dart';
import 'package:e_commerce/provider/modalProgressHUD.dart';
import 'package:e_commerce/provider/search_product.dart';
import 'package:e_commerce/screens/admin/add_product.dart';
import 'package:e_commerce/screens/admin/admin_panel.dart';
import 'package:e_commerce/screens/admin/edit_product.dart';
import 'package:e_commerce/screens/admin/order_details.dart';
import 'package:e_commerce/screens/admin/view_orders.dart';
import 'package:e_commerce/screens/admin/your_profile.dart';
import 'package:e_commerce/screens/user/cartPage.dart';
import 'package:e_commerce/screens/user/favoritePage.dart';
import 'package:e_commerce/screens/user/filtterPage.dart';
import 'package:e_commerce/screens/user/methodes/flter_category_user.dart';
import 'package:e_commerce/screens/user/methodes/produt_details.dart';
import 'package:e_commerce/screens/user/profilPage.dart';
import 'package:e_commerce/screens/user/searchPage.dart';
import 'package:e_commerce/screens/user/settingsPage.dart';
import 'screens/admin/methodes/flter_category_admin.dart';
import 'package:e_commerce/screens/admin/show_product.dart';
import 'screens/user/homePage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<InvisibleIcon>(
        create: (context) => InvisibleIcon(),
      ),
      ChangeNotifierProvider<ProgressProvider>(
        create: (context) => ProgressProvider(),
      ),
      ChangeNotifierProvider<FilterCategoryItem>(
        create: (context) => FilterCategoryItem(),
      ),
      ChangeNotifierProvider<ImageProfile>(
        create: (context) => ImageProfile(),
      ),
      ChangeNotifierProvider<Search>(
        create: (context) => Search(),
      ),
      ChangeNotifierProvider<CounterOrder>(
        create: (context) => CounterOrder(),
      ),
      ChangeNotifierProvider<AddProductToCart>(
        create: (context) => AddProductToCart(),
      ),
    ],

    child: MyApp(),
  ));
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  static const String id = 'MyApp';

  User firebaseUser = FirebaseAuth.instance.currentUser;
  String firstWidget() {
    if (firebaseUser != null && firebaseUser.email.contains("admin")) {
      return AdminPanel.id;
    } else if (firebaseUser != null) {
      return HomePage.id;
    } else {
      return SignOrLogin.id;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: firstWidget(),
      routes: {
        SignOrLogin.id: (context) => SignOrLogin(),
        SignUpScreen.id: (context) => SignUpScreen(),
        LogInScreen.id: (context) => LogInScreen(),
        HomePage.id: (context) => HomePage(),
        AdminPanel.id: (context) => AdminPanel(),
        MyApp.id: (context) => MyApp(),
        AddProduct.id: (context) => AddProduct(),
        ShowProduct.id: (context) => ShowProduct(),
        FilterCategory.id: (context) => FilterCategory(),
        EditProduct.id: (context) => EditProduct(),
        YourProfile.id: (context) => YourProfile(),
        FavoritePage.id: (context) => FavoritePage(),
        FilterPage.id: (context) => FilterPage(),
        ProfilePage.id: (context) => ProfilePage(),
        SearchPage.id: (context) => SearchPage(),
        SettingsPage.id: (context) => SettingsPage(),
        ProductDetails.id: (context) => ProductDetails(),
        FilterCategoryUser.id: (context) => FilterCategoryUser(),
        CartPage.id: (context) => CartPage(),
        ViewOrder.id: (context) => ViewOrder(),
        OrderDetails.id: (context) => OrderDetails(),
      },
    );
  }
}
