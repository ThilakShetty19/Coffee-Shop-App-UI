// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:coffee_app_ui/models/coffee_item.dart';
import 'package:coffee_app_ui/screen/item_detail.dart';
import 'package:coffee_app_ui/utils/color_pallette.dart';

class CoffeeItemsWidget extends StatefulWidget {
  final CoffeeItem cItem;
  const CoffeeItemsWidget({
    Key? key,
    required this.cItem,
  }) : super(key: key);

  @override
  State<CoffeeItemsWidget> createState() => _CoffeeItemsWidgetState();
}

class _CoffeeItemsWidgetState extends State<CoffeeItemsWidget> {
  List<CoffeeItem> coffeeItem = [];
  void _getCoffeeItem() {
    coffeeItem = CoffeeItem.getCoffeeList();
  }

  @override
  Widget build(BuildContext context) {
    _getCoffeeItem();
    return Padding(
      padding: const EdgeInsets.only(left: 15),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => ItemDetails(
                cItem: widget.cItem,
                cartItems: const [],
              ),
            ),
          );
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: <Color>[
                AppColor.gradientTopLeft,
                Color.fromARGB(99, 29, 28, 28),
              ],
            ),
          ),
          height: 200,
          width: 150,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 140,
                width: 150,
                child: Stack(
                  children: [
                    Positioned(
                      top: 10,
                      left: 10,
                      child: Hero(
                        tag: widget.cItem.itemImg.toString(),
                        child: Container(
                          height: 120,
                          width: 130,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(widget.cItem.itemImg!),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 10,
                      left: 90,
                      child: Container(
                        height: 25,
                        width: 50,
                        decoration: BoxDecoration(
                          color: const Color(0xFF342520).withOpacity(0.7),
                          borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(15.0),
                            bottomLeft: Radius.circular(15.0),
                          ),
                        ),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.star,
                                  color: AppColor.coffeeSelected,
                                  size: 15,
                                ),
                                const SizedBox(width: 2),
                                Text(
                                  widget.cItem.rating.toString(),
                                  style: GoogleFonts.sourceSans3(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: 13),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  widget.cItem.title!,
                  style: GoogleFonts.sourceSans3(
                      color: Colors.white, fontSize: 17),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, bottom: 1),
                child: Text(
                  widget.cItem.subtitle!,
                  style: GoogleFonts.sourceSans3(
                      fontWeight: FontWeight.w200,
                      color: Colors.white,
                      fontSize: 12),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: 40,
                      width: 60,
                      child: Row(
                        children: [
                          Text(
                            '\$',
                            style: GoogleFonts.sourceSans3(
                                fontWeight: FontWeight.bold,
                                color: AppColor.coffeeSelected,
                                fontSize: 20),
                          ),
                          const SizedBox(width: 5),
                          Text(
                            widget.cItem.price.toString(),
                            style: GoogleFonts.sourceSans3(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          )
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          color: AppColor.coffeeSelected,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.add,
                            size: 11,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
