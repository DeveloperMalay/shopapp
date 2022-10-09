import 'package:flutter/material.dart';
import 'package:shopapp/utils/custom_theme.dart';

class CustomTextInput extends StatelessWidget {
  const CustomTextInput(
      {Key? key,
      required this.label,
      required this.placeholder,
      required this.icon,
      required this.textEditingController,
      required this.password})
      : super(key: key);

  final String label;
  final String placeholder;
  final IconData icon;
  final TextEditingController textEditingController;
  final bool password;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(
          padding: const EdgeInsets.only(left: 20.0, bottom: 8.0),
          child: Text(
            label,
            style: const TextStyle(color: Colors.black, fontSize: 14),
          ),
        ),
        SizedBox(
          height: 56,
          child: TextField(
            controller: textEditingController,
            obscureText: password,
            enableSuggestions: !password,
            autocorrect: !password,
            decoration: InputDecoration(
              prefixIcon: Padding(
                padding: const EdgeInsetsDirectional.only(start: 22, end: 20),
                child: Icon(
                  icon,
                  color: Colors.black,
                  size: 24,
                ),
              ),
              border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(35))),
              filled: true,
              hintStyle: const TextStyle(color: CustomTheme.grey),
              hintText: placeholder,
              fillColor: Colors.white,
            ),
          ),
        )
      ]),
    );
  }
}
