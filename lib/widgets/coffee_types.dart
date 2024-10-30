import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/color_pallette.dart';

class CoffeeTypes extends StatelessWidget {
  final String coffee;
  final String selectedItem;
  final Function(String) onSelected;

  const CoffeeTypes({
    Key? key,
    required this.coffee,
    required this.selectedItem,
    required this.onSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: coffee != selectedItem
          ? const EdgeInsets.only(left: 25)
          : const EdgeInsets.only(left: 25),
      child: Column(
        children: [
          GestureDetector(
            onTap: () => onSelected(coffee),
            child: Text(
              coffee,
              style: GoogleFonts.sourceSans3(
                  fontWeight: FontWeight.bold,
                  color: coffee == selectedItem
                      ? AppColor.coffeeSelected
                      : AppColor.coffeeUnselected,
                  fontSize: 17),
            ),
          ),
          const SizedBox(height: 4),
          Container(
            height: 8,
            width: 8,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: coffee == selectedItem
                    ? AppColor.coffeeSelected
                    : Colors.transparent),
          ),
        ],
      ),
    );
  }
}
