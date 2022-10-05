import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shopapp/utils/custom_theme.dart';

class GridCard extends StatelessWidget {
  const GridCard({
    Key? key,
    required this.index,
    required this.onPress,
  }) : super(key: key);
  final int index;
  final void Function() onPress;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: index % 2 == 0
          ? const EdgeInsets.only(left: 22)
          : const EdgeInsets.only(right: 22),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(35),
        boxShadow: CustomTheme.cardShadow,
      ),
      child: GestureDetector(
        onTap: onPress,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(35),
          child: Column(
            children: [
              Expanded(
                flex: 7,
                child: SizedBox(
                  width: double.infinity,
                  child: CachedNetworkImage(
                      imageUrl:
                          "https://m.media-amazon.com/images/I/61FFlMkOxhL._SL1320_.jpg"),
                ),
              ),
              Expanded(
                  flex: 3,
                  child: Column(
                    children: const [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 4.0),
                        child: Text(
                          "title",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                      Text(
                        "price",
                        style: TextStyle(color: Colors.black),
                      ),
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
