import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Loader extends StatelessWidget {
  const Loader({Key? key, this.scale = 1}) : super(key: key);
  final double scale;
  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: scale,
      child: const CircularProgressIndicator(
        color: Colors.black,
        semanticsLabel: "Circular progress bar",
      ),
    );
  }
}
