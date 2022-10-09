import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopapp/components/grid_card.dart';
import 'package:shopapp/screens/login.dart';
import 'package:shopapp/screens/product_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final data = ["1", "2"];
  @override
  Widget build(BuildContext context) {
    onCardPress() {}

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: GridView.builder(
        itemCount: data.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 30,
          crossAxisSpacing: 30,
        ),
        itemBuilder: (BuildContext context, int index) {
          return GridCard(
            index: index,
            onPress: onCardPress,
          );
        },
      ),
    );
  }
}
