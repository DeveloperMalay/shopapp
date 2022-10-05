import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shopapp/utils/custom_theme.dart';

class ListCard extends StatelessWidget {
  const ListCard({Key? key, required this.price}) : super(key: key);
  final String price;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 123,
      margin: const EdgeInsets.only(
        left: 30,
        right: 30,
        bottom: 30,
      ),
      decoration: CustomTheme.getCardDecoration(),
      child: Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(35),
          child: Row(
            children: [
              Expanded(
                flex: 4,
                child: SizedBox(
                  width: double.infinity,
                  child: CachedNetworkImage(
                    imageUrl:
                        'https://m.media-amazon.com/images/I/61FFlMkOxhL._SL1320_.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Expanded(
                flex: 6,
                child: Container(
                  margin: const EdgeInsets.only(left: 10),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(bottom: 8),
                          child: Text(
                            'title',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(bottom: 8),
                          child: Text(
                            'Qty:1',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: Text(
                            price,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ]),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
