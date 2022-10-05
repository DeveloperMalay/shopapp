import 'dart:convert';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:shopapp/firebase_options.dart';
import 'package:shopapp/screens/checkout.dart';
import 'package:shopapp/screens/home.dart';
import 'package:shopapp/screens/profile.dart';
import 'package:shopapp/utils/custom_theme.dart';

void main() async {
  //firebase setup
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  //stripe setup
  final String response =
      await rootBundle.loadString("assets/config/stripe.json");
  final data = await jsonDecode(response);
  Stripe.publishableKey = data["publishableKey"];
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: CustomTheme.getTheme(),
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('ShopApp'),
          ),
          bottomNavigationBar: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(35),
                topRight: Radius.circular(35),
              ),
              boxShadow: CustomTheme.cardShadow,
            ),
            child: const TabBar(tabs: [
              Tab(
                icon: Icon(Icons.home),
                text: "Home",
              ),
              Tab(
                icon: Icon(Icons.person),
                text: "Profile",
              ),
              Tab(
                icon: Icon(Icons.shopping_cart),
                text: "Cart",
              ),
            ]),
          ),
          body: const TabBarView(children: [
            HomeScreen(),
            ProfileScreen(),
            CheckoutScreen(),
          ]),
        ),
      ),
    );
  }
}
