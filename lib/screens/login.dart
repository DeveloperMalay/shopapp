import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shopapp/components/custom_button.dart';
import 'package:shopapp/components/custom_text_input.dart';
import 'package:shopapp/utils/custom_theme.dart';
import 'package:shopapp/utils/login_data.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _loadingButton = false;
  late Map<String, String> data = {
    "heading": "Getting Started",
    "subHeading": "Create ad account to continue",
    "label": "SIGN IN",
    "footer": "Create a new account? Sign in "
  };

  _loginScreenState() {
    data = LoginData.signIn;
  }

  void switchLogin() {
    setState(() {
      if (mapEquals(data, LoginData.signUp)) {
        data = LoginData.signIn;
      } else {
        data = LoginData.signUp;
      }
    });
  }

  void loginButtonPressed() {}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 40, bottom: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Text(
                      data["heading"] as String,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ],
              ),
              Text(
                data["subHeading"] as String,
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 15,
                ),
              ),
              model(data, _emailController, _passwordController),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 50,
                    child: TextButton(
                      onPressed: switchLogin,
                      child: Text(
                        data["footer"] as String,
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  model(
    Map<String, String> data,
    TextEditingController _emailController,
    TextEditingController _passwordController,
  ) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.only(right: 20, left: 20, top: 30, bottom: 56),
      decoration: CustomTheme.getCardDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextInput(
            label: "Your Email Address",
            placeholder: "email@address.com",
            icon: Icons.person_outline,
            textEditingController: _emailController,
            password: false,
          ),
          CustomTextInput(
            label: "Password",
            placeholder: "password",
            icon: Icons.lock_outline,
            textEditingController: _passwordController,
            password: true,
          ),
          CustomButton(
            text: data['label'].toString(),
            onPress: loginButtonPressed,
            loading: _loadingButton,
          )
        ],
      ),
    );
  }
}
