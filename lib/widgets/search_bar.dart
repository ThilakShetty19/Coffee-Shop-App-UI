import 'package:coffee_app_ui/utils/color_pallette.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/ri.dart';

class SearchBarPage extends StatefulWidget {
  const SearchBarPage({super.key});

  @override
  State<SearchBarPage> createState() => _SearchBarPageState();
}

class _SearchBarPageState extends State<SearchBarPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: Container(
        padding: const EdgeInsets.all(10),
        height: 50,
        width: MediaQuery.of(context).size.width - 30.0,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColor.searchBarFill),
        child: TextField(
          decoration: InputDecoration(
              filled: true,
              hintText: 'Find your coffee..',
              contentPadding: const EdgeInsets.fromLTRB(10, 2, 5, 12),
              hintStyle: GoogleFonts.sourceSans3(
                color: const Color(0xFF525559),
              ),
              border: InputBorder.none,
              fillColor: AppColor.searchBarFill,
              prefixIcon: const Padding(
                padding: EdgeInsets.only(right: 8, left: 8),
                child: Iconify(
                  Ri.search_2_fill,
                  color: Color(0xFF525559),
                ),
              ),
              prefixIconConstraints:
                  const BoxConstraints(maxHeight: 20, maxWidth: 40),
              prefixIconColor: const Color(0xFF525559)),
          style: GoogleFonts.sourceSans3(color: const Color(0xFF525559)),
        ),
      ),
    );
  }
}
