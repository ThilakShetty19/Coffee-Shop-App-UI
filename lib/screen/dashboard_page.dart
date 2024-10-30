import 'package:coffee_app_ui/utils/assets.dart';
import 'package:coffee_app_ui/models/coffee_beans_item.dart';
import 'package:coffee_app_ui/widgets/bottom_bar.dart';
import 'package:coffee_app_ui/widgets/coffee_beans_tile.dart';
import 'package:coffee_app_ui/widgets/coffee_items_widget.dart';
import 'package:coffee_app_ui/widgets/coffee_types.dart';
import 'package:coffee_app_ui/widgets/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/heroicons_solid.dart';
import '../utils/color_pallette.dart';
import '../models/coffee_item.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final List<String> coffeTypes = [
    'All',
    'Cappuccino',
    'Espresso',
    'Latte',
    'Cortado',
  ];

  String selectedItem = 'All';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.scaffoldBg,
      bottomNavigationBar: const BottomBar(
        selectedIndex: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.fromLTRB(15, 5, 15, 5.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          padding: const EdgeInsets.all(7),
                          height: 42,
                          width: 42,
                          decoration: BoxDecoration(
                            color: const Color(0xFF1F242C),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Iconify(
                            HeroiconsSolid.view_grid,
                            size: 12.0,
                            color: Color(0xFF4D4F52),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          padding: const EdgeInsets.all(7),
                          height: 42,
                          width: 42,
                          decoration: BoxDecoration(
                            image: const DecorationImage(
                                image: AssetImage(AssetImages.avatar),
                                fit: BoxFit.cover),
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      )
                    ]),
              ),
              Container(
                padding: const EdgeInsets.only(left: 15, top: 15),
                width: (MediaQuery.of(context).size.width / 3) * 2 + 25,
                child: Text(
                  'Find the best coffee for you',
                  style: GoogleFonts.sourceSans3(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 40.0),
                ),
              ),
              const SizedBox(height: 20),
              const SearchBarPage(),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(right: 8, top: 10),
                child: Container(
                  color: const Color(0xFF0D0F14),
                  height: 40.0,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      ...coffeTypes.map((e) {
                        return CoffeeTypes(
                          coffee: e,
                          selectedItem: selectedItem,
                          onSelected: (String coffee) {
                            setState(() {
                              selectedItem = coffee;
                            });
                          },
                        );
                      }).toList()
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: (MediaQuery.of(context).size.height / 2) - 0.0,
                width: MediaQuery.of(context).size.width,
                child: ListView(
                  padding: const EdgeInsets.only(top: 5.0),
                  children: [
                    Container(
                      color: const Color(0xFF0D0F14),
                      width: MediaQuery.of(context).size.width - 10,
                      height: 225,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          ...CoffeeItem.getCoffeeList().map((e) {
                            return CoffeeItemsWidget(cItem: e);
                          })
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.only(left: 15, right: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 2),
                            child: Text(
                              'Coffee Beans ',
                              style: GoogleFonts.sourceSans3(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ),
                          ),
                          ...CoffeeBeansItem.getBeansItem().map((e) {
                            return CoffeeBeansTile(cbItem: e);
                          }).toList()
                        ],
                      ),
                    ),
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
