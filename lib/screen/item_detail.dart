import 'package:coffee_app_ui/widgets/cart_data.dart';
import 'package:coffee_app_ui/utils/color_pallette.dart';
import 'package:coffee_app_ui/models/coffee_item.dart';
import 'package:coffee_app_ui/screen/cart_page.dart';
import 'package:coffee_app_ui/widgets/Button.dart';
import 'package:coffee_app_ui/widgets/sized_button.dart';
import 'package:flutter/material.dart';
import 'package:glassmorphism_ui/glassmorphism_ui.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:colorful_iconify_flutter/icons/vscode_icons.dart';
import 'package:iconify_flutter/icons/ic.dart';

class ItemDetails extends StatefulWidget {
  final CoffeeItem cItem;
  final List<CoffeeItem> cartItems;
  const ItemDetails({
    super.key,
    required this.cItem,
    required this.cartItems,
  });

  @override
  State<ItemDetails> createState() => _ItemDetailsState();
}

class _ItemDetailsState extends State<ItemDetails> {
  int selectedIndex = 0;

  void addItemToCart(CoffeeItem item) {
    CartData().addOrIncreaseItem(item);

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const CartPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: screenHeight,
            width: screenWidth,
            color: Colors.black,
          ),
          Hero(
              tag: widget.cItem.toString(),
              child: Container(
                height: (screenHeight / 2) + 70,
                width: screenWidth,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(widget.cItem.itemImg.toString()),
                      fit: BoxFit.cover),
                ),
              )),
          Positioned(
            top: 25,
            left: 10,
            child: Container(
              color: Colors.transparent,
              height: 50,
              width: screenWidth - 20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      height: 45,
                      width: 45,
                      decoration: BoxDecoration(
                        color: const Color(0xFF14181D),
                        border: Border.all(
                            color: const Color(0xFF322B2E), width: 1.0),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: const Icon(
                        Icons.arrow_back_ios_new_rounded,
                        color: Color(0xFF525154),
                        size: 17.0,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: 45,
                      width: 45,
                      decoration: BoxDecoration(
                        color: const Color(0xFF14181D),
                        border: Border.all(
                            color: const Color(0xFF322B2E), width: 1.0),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: const Icon(
                        Icons.favorite_rounded,
                        color: Color(0xFF525154),
                        size: 17.0,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Positioned(
            top: (screenHeight / 2) - 30,
            child: GlassContainer(
              height: 150,
              width: screenWidth,
              blur: 4,
              border: const Border.fromBorderSide(BorderSide.none),
              borderRadius: BorderRadius.circular(30),
              color: Colors.black.withOpacity(0.6),
              child: SizedBox(
                height: 140,
                width: screenWidth - 20,
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(left: 25),
                      height: 140,
                      width: (screenWidth - 20) / 2,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.cItem.title!,
                            style: GoogleFonts.sourceSans3(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            widget.cItem.subtitle!,
                            style: GoogleFonts.sourceSans3(
                              color: const Color(0xFFADADAD),
                              fontSize: 17,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              const Icon(
                                Icons.star,
                                color: AppColor.coffeeSelected,
                                size: 22,
                              ),
                              const SizedBox(width: 10),
                              Text(
                                widget.cItem.rating.toString(),
                                style: GoogleFonts.sourceSans3(
                                    color: Colors.white,
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(width: 10),
                              Text(
                                '(6,986)',
                                style: GoogleFonts.sourceSans3(
                                  color: const Color(0xFFADADAD),
                                  fontSize: 15,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 25),
                      height: 140,
                      width: (screenWidth - 20) / 2,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: const Color(0xFF0F1419)),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Iconify(
                                      VscodeIcons.file_type_coffeescript,
                                      color: AppColor.coffeeSelected,
                                      size: 21,
                                    ),
                                    const SizedBox(
                                      height: 2,
                                    ),
                                    Text(
                                      'Coffee',
                                      style: GoogleFonts.sourceSans3(
                                        color: const Color(0xFF909193),
                                        fontSize: 12.0,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: const Color(0xFF0F1419)),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Iconify(
                                      Ic.round_water_drop,
                                      color: AppColor.coffeeSelected,
                                      size: 21,
                                    ),
                                    const SizedBox(
                                      height: 2,
                                    ),
                                    Text(
                                      'Milk',
                                      style: GoogleFonts.sourceSans3(
                                        color: const Color(0xFF909193),
                                        fontSize: 12.0,
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 35,
                                width: 120,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: const Color(0xFF0F1419)),
                                child: Center(
                                  child: Text(
                                    'Medium Roasted',
                                    style: GoogleFonts.sourceSans3(
                                      color: const Color(0xFF909193),
                                      fontSize: 12.0,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Positioned(
              top: screenHeight / 2 + 120,
              child: SizedBox(
                height: screenHeight / 2 - 140,
                width: screenWidth,
                child: ListView(
                  padding: const EdgeInsets.only(left: 15),
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Description',
                          style: GoogleFonts.sourceSans3(
                            color: const Color(0xFF999A9B),
                            fontSize: 17,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          height: 70,
                          width: screenWidth - 30,
                          child: Text(
                            textAlign: TextAlign.justify,
                            widget.cItem.description.toString(),
                            style: const TextStyle(
                                color: Colors.white, fontSize: 15.0),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'Size',
                          style: GoogleFonts.sourceSans3(
                            color: const Color(0xFF999A9B),
                            fontSize: 17.0,
                          ),
                        ),
                        const SizedBox(height: 10),
                        SizedBox(
                          width: screenWidth - 30,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedButton(
                                title: 'S',
                                index: 0,
                                selectedIndex: selectedIndex,
                                onTap: (index) {
                                  setState(() {
                                    selectedIndex = index;
                                  });
                                },
                              ),
                              SizedButton(
                                title: 'M',
                                index: 1,
                                selectedIndex: selectedIndex,
                                onTap: (index) {
                                  setState(() {
                                    selectedIndex = index;
                                  });
                                },
                              ),
                              SizedButton(
                                title: 'L',
                                index: 2,
                                selectedIndex: selectedIndex,
                                onTap: (index) {
                                  setState(() {
                                    selectedIndex = index;
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 10),
                        SizedBox(
                          width: screenWidth - 30,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                height: 60,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Price',
                                      style: GoogleFonts.sourceSans3(
                                        color: const Color(0xFF999A9B),
                                        fontSize: 17.0,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          '\$',
                                          style: GoogleFonts.sourceSans3(
                                            fontWeight: FontWeight.bold,
                                            color: AppColor.coffeeSelected,
                                            fontSize: 20,
                                          ),
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
                                    )
                                  ],
                                ),
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: Container(
                                  height: 50,
                                  width: (screenWidth / 2) + 50,
                                  decoration: BoxDecoration(
                                    color: AppColor.coffeeSelected,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Center(
                                    child: Button(
                                      title: 'Add to Cart',
                                      onTap: () => addItemToCart(widget.cItem),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(height: 5),
                      ],
                    )
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
