// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:coffee_app_ui/models/coffee_beans_item.dart';
import 'package:coffee_app_ui/utils/color_pallette.dart';
import 'package:google_fonts/google_fonts.dart';

class CoffeeBeansTile extends StatefulWidget {
  final CoffeeBeansItem cbItem;
  const CoffeeBeansTile({
    Key? key,
    required this.cbItem,
  }) : super(key: key);

  @override
  State<CoffeeBeansTile> createState() => _CoffeeBeansTileState();
}

class _CoffeeBeansTileState extends State<CoffeeBeansTile> {
  List<CoffeeBeansItem> beansItem = [];

  void _getBeansItem() {
    beansItem = CoffeeBeansItem.getBeansItem();
  }

  @override
  Widget build(BuildContext context) {
    _getBeansItem();
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: GestureDetector(
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
          height: 110,
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                SizedBox(
                  height: 100,
                  width: 100,
                  child: Hero(
                    tag: widget.cbItem.cbItemImg.toString(),
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(widget.cbItem.cbItemImg!),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Text(
                              widget.cbItem.cbTitle!,
                              style: GoogleFonts.sourceSans3(
                                color: Colors.white,
                                fontSize: 17,
                              ),
                            ),
                            const Spacer(),
                            const Icon(
                              Icons.star,
                              color: AppColor.coffeeSelected,
                              size: 15,
                            ),
                            const SizedBox(width: 3),
                            Text(
                              widget.cbItem.cbRating.toString(),
                              style: GoogleFonts.sourceSans3(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          widget.cbItem.cbSubtitle!,
                          style: GoogleFonts.sourceSans3(
                            fontWeight: FontWeight.w200,
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
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
                                  widget.cbItem.cbPrice.toString(),
                                  style: GoogleFonts.sourceSans3(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),
                                ),
                              ],
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
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
