import 'package:coffee_app_ui/screen/dashboard_page.dart';
import 'package:coffee_app_ui/screen/payment_success.dart';
import 'package:coffee_app_ui/utils/color_pallette.dart';
import 'package:coffee_app_ui/widgets/Button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({super.key});

  @override
  _CheckoutPageState createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  String? selectedPaymentMethod;
  final paymentMethods = [
    {'name': 'Amazon Pay', 'logo': 'assets/images/amazonPay.png'},
    {'name': 'PayPal', 'logo': 'assets/images/payPal.png'},
    {'name': 'Google Pay', 'logo': 'assets/images/gPay.png'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.scaffoldBg,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15, 5, 15, 20),
          child: Column(children: [
            Row(
              children: [
                Container(
                  color: Colors.transparent,
                  height: 50,
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const DashboardPage(),
                              ));
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
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 100),
                  child: Text(
                    'Checkout',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            Expanded(
              child: ListView(
                children: [
                  Text(
                    'Delivery Address',
                    style: GoogleFonts.sourceSans3(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8),
                      color: AppColor.searchBarFill,
                    ),
                    padding: const EdgeInsets.all(10),
                    child: const Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(Icons.location_on, size: 25, color: Colors.white),
                        SizedBox(width: 5),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Home',
                              style: TextStyle(color: Colors.white70),
                            ),
                            Text("3'rd cross, JP nagar,",
                                style: TextStyle(color: Colors.white70)),
                            Text(
                              'Bengalore',
                              style: TextStyle(color: Colors.white70),
                            ),
                          ],
                        ),
                        Spacer(),
                        Icon(
                          Icons.edit,
                          color: Colors.white,
                          size: 20,
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 25),
                  Text(
                    'Credit & Debit Card',
                    style: GoogleFonts.sourceSans3(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    height: 50,
                    width: 70,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadiusDirectional.circular(10),
                      color: AppColor.searchBarFill,
                    ),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        children: [
                          Icon(
                            Icons.credit_card_rounded,
                            color: Colors.white,
                          ),
                          SizedBox(width: 5),
                          Text(
                            'Add Card',
                            style:
                                TextStyle(color: Colors.white70, fontSize: 16),
                          ),
                          Spacer(),
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: Colors.white,
                            size: 16,
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'More Payment Options',
                    style: GoogleFonts.sourceSans3(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8),
                      color: AppColor.searchBarFill,
                    ),
                    child: Column(
                      children: [
                        ...paymentMethods.asMap().entries.map((entry) {
                          int idx = entry.key;
                          String methodName = entry.value['name']!;
                          String logoPath = entry.value['logo']!;
                          return Column(
                            children: [
                              Row(
                                children: [
                                  Radio<String>(
                                    value: methodName,
                                    groupValue: selectedPaymentMethod,
                                    activeColor: AppColor.coffeeSelected,
                                    onChanged: (value) {
                                      setState(() {
                                        selectedPaymentMethod = value;
                                      });
                                    },
                                  ),
                                  Image.asset(
                                    logoPath,
                                    height: 24,
                                    width: 24,
                                  ),
                                  const SizedBox(width: 5),
                                  Text(
                                    methodName,
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                              if (idx < paymentMethods.length - 1)
                                const Divider(),
                            ],
                          );
                        }).toList(),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                  Button(
                    title: 'Confirm Order',
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) => const PaymentSuccessDialog(),
                      );
                    },
                  )
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
