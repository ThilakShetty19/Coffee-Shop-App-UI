import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:coffee_app_ui/utils/color_pallette.dart';

class SizedButton extends StatelessWidget {
  final String title;
  final int index;
  final int selectedIndex;
  final Function(int) onTap;

  const SizedButton({
    super.key,
    required this.title,
    required this.index,
    required this.selectedIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(index),
      child: AnimatedContainer(
        duration: const Duration(seconds: 1),
        curve: Curves.easeIn,
        height: 40,
        width: 100,
        decoration: BoxDecoration(
          color:
              index == selectedIndex ? Colors.black : const Color(0xFF0D0F14),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color:
                index == selectedIndex ? AppColor.coffeeSelected : Colors.black,
            style: BorderStyle.solid,
            width: index == selectedIndex ? 1.0 : 0.2,
          ),
        ),
        child: Center(
          child: Text(
            title,
            style: GoogleFonts.sourceSans3(
              color: index == selectedIndex
                  ? AppColor.coffeeSelected
                  : const Color(0xFFADADAD),
              fontSize: 15.0,
            ),
          ),
        ),
      ),
    );
  }
}
