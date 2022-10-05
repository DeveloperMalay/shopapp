import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopapp/components/custom_button.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 30,
      ),
      child: Column(
        children: [
          const Text(
            "Hi,there",
            style: TextStyle(fontSize: 20, color: Colors.black),
          ),
          CustomButton(
            text: "Sign Out",
            onPress: () {},
          ),
        ],
      ),
    );
  }
}
