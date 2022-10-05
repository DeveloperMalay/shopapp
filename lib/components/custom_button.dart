import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shopapp/utils/custom_theme.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {Key? key,
      required this.text,
      required this.onPress,
      this.loading = false})
      : super(key: key);
  final String text;
  final void Function() onPress;
  final bool loading;
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 56,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(35),
          color: CustomTheme.violet,
          boxShadow: CustomTheme.buttonShadow,
        ),
        child: MaterialButton(
          onPressed: loading ? null : onPress,
          child: Center(
            child: loading
                ? const Text('loading')
                : Text(
                    text,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
          ),
        ));
  }
}
