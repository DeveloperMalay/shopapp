import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shopapp/components/custom_button.dart';
import 'package:shopapp/utils/custom_theme.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  bool addButtonLoad = false;
  void onAddtoCart() async {
    setState(() {
      addButtonLoad = true;
    });

    //add to cart
    setState(() {
      addButtonLoad = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  children: [
                    SizedBox(
                      height: 500,
                      width: double.infinity,
                      child: CachedNetworkImage(
                        imageUrl:
                            "https://m.media-amazon.com/images/I/61FFlMkOxhL._SL1320_.jpg",
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      top: 35,
                      right: 35,
                      child: Container(
                        decoration: const ShapeDecoration(
                          color: CustomTheme.violet,
                          shape: CircleBorder(),
                          shadows: [
                            BoxShadow(
                              color: CustomTheme.grey,
                              blurRadius: 3,
                              offset: Offset(1, 3),
                            ),
                          ],
                        ),
                        child: IconButton(
                          icon: const Icon(
                            Icons.share,
                            color: Colors.white,
                          ),
                          onPressed: () {},
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                  ),
                  child: DefaultTextStyle(
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(top: 20),
                          child: Text("title"),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          child: Row(
                            children: const [Text("MRP:"), Text("\$ Price")],
                          ),
                        ),
                        CustomButton(text: "Add to Cart", onPress: () {}),
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 20),
                          child: Text(
                            "About the Item",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(bottom: 20),
                          child: Text(
                            "The Item Description",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 24,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 35,
            left: 30,
            child: Container(
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(5),
                  ),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 3,
                      offset: Offset(1, 3),
                      color: CustomTheme.grey,
                    ),
                  ]),
              child: IconButton(
                icon: const Icon(Icons.arrow_back),
                color: Colors.black,
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
          ),
        ],
      )),
    );
  }
}
