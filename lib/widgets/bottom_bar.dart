import 'package:coffee_app_ui/screen/cart_page.dart';
import 'package:coffee_app_ui/screen/dashboard_page.dart';
import 'package:coffee_app_ui/utils/color_pallette.dart';
import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/fluent_mdl2.dart';
import 'package:iconify_flutter/icons/heroicons_solid.dart';
import 'package:iconify_flutter/icons/ph.dart';
import 'package:iconify_flutter/icons/ri.dart';

class BottomBar extends StatefulWidget {
  final int selectedIndex;

  const BottomBar({
    super.key,
    required this.selectedIndex,
  });

  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  late int initialIndex;

  @override
  void initState() {
    super.initState();
    initialIndex = widget.selectedIndex;
  }

  void _onItemTapped(int index) {
    setState(() {
      if (index != initialIndex) {
        switch (index) {
          case 0:
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const DashboardPage(),
                ));

            break;
          case 1:
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) =>const CartPage(),
                ));
            break;

          default:
        }
      }
      initialIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 25, right: 25),
      height: 50,
      decoration: const BoxDecoration(
        color: Color(0xFF1A1819),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () => _onItemTapped(0),
            child: Iconify(
              FluentMdl2.home_solid,
              color: initialIndex == 0
                  ? AppColor.coffeeSelected
                  : const Color(0xFF4E4F53),
            ),
          ),
          GestureDetector(
            onTap: () => _onItemTapped(1),
            child: Iconify(
              Ph.handbag_fill,
              color: initialIndex == 1
                  ? AppColor.coffeeSelected
                  : const Color(0xFF4E4F53),
            ),
          ),
          GestureDetector(
            onTap: () => _onItemTapped(2),
            child: Iconify(
              Ri.heart_2_fill,
              color: initialIndex == 2
                  ? AppColor.coffeeSelected
                  : const Color(0xFF4E4F53),
            ),
          ),
          GestureDetector(
            onTap: () => _onItemTapped(3),
            child: Stack(
              children: [
                Iconify(
                  HeroiconsSolid.bell,
                  color: initialIndex == 3
                      ? AppColor.coffeeSelected
                      : const Color(0xFF4E4F53),
                ),
                Positioned(
                  top: 2.0,
                  left: 15,
                  child: Container(
                    height: 7,
                    width: 7,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3.5),
                      color: Colors.red,
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
