import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopapp/components/custom_button.dart';
import 'package:shopapp/components/list_card.dart';
import 'package:shopapp/utils/custom_theme.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({Key? key}) : super(key: key);

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  final carts = ["1", "2"];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
        ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.symmetric(vertical: 30),
          itemCount: carts.length,
          itemBuilder: (context, index) {
            return const ListCard(price: "100");
          },
        ),
        priceFooter(),
        Container(
          padding: const EdgeInsets.symmetric(
            vertical: 20,
            horizontal: 30,
          ),
          child: CustomButton(text: "Check Out", onPress: () {}),
        )
      ]),
    );
  }

  priceFooter() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Divider(
          height: 2,
          color: CustomTheme.grey,
          thickness: 2,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Row(
            children: const [
              Text(
                "Total:",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                ),
              ),
              Spacer(),
              Text(
                "\$ price",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
