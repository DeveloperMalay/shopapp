import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/components/custom_button.dart';
import 'package:shopapp/utils/application_state.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool _loadingButton = false;

  signOutButtonPressed() {
    setState(() {
      _loadingButton = true;
    });
    Provider.of<ApplicationState>(context, listen: false).signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 30,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Hi,there",
              style: TextStyle(fontSize: 20, color: Colors.black),
            ),
          ),
          CustomButton(
            text: "Sign Out",
            onPress: signOutButtonPressed,
            loading: _loadingButton,
          ),
        ],
      ),
    );
  }
}
