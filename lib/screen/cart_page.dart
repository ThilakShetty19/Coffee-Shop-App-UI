import 'package:coffee_app_ui/screen/checkout_page.dart';
import 'package:coffee_app_ui/screen/dashboard_page.dart';
import 'package:coffee_app_ui/widgets/cart_data.dart';
import 'package:coffee_app_ui/widgets/Button.dart';
import 'package:coffee_app_ui/widgets/bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:coffee_app_ui/models/coffee_item.dart';
import 'package:coffee_app_ui/utils/color_pallette.dart';

class CartPage extends StatefulWidget {
  const CartPage({
    Key? key,
  }) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final cartItems = CartData().getItems();

  List<int> get itemCounts => cartItems.map((item) => item.quantity).toList();

  @override
  void initState() {
    super.initState();
  }

  void increase(int index) {
    setState(() {
      CartData().addOrIncreaseItem(cartItems[index]);
    });
  }

  void decrease(int index) {
    setState(() {
      if (itemCounts[index] > 1) {
        CartData().decreaseItem(cartItems[index]);
      }
    });
  }

  double calculateSubtotal() {
    double subtotal = 0.0;
    for (int i = 0; i < cartItems.length; i++) {
      subtotal += cartItems[i].price! * itemCounts[i];
    }
    return subtotal;
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double containerHeight = 120;
    double buttonWidth = screenWidth * 0.3;
    double imageWidth = screenWidth * 0.25;

    double subtotal = calculateSubtotal();
    double taxes = 2.00;
    double discount = 3.00;
    double total = subtotal + taxes - discount;

    return Scaffold(
      bottomNavigationBar: const BottomBar(
        selectedIndex: 1,
      ),
      backgroundColor: AppColor.scaffoldBg,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15, 5, 15, 20),
          child: Column(
            children: [
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
                    padding: EdgeInsets.only(left: 120),
                    child: Text(
                      'Cart',
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
                child: cartItems.isEmpty
                    ? const Center(
                        child: Text(
                          'Your cart is empty',
                          style: TextStyle(color: Colors.white54, fontSize: 18),
                        ),
                      )
                    : ListView.builder(
                        itemCount: cartItems.length,
                        itemBuilder: (context, index) {
                          CoffeeItem item = cartItems[index];
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: Dismissible(
                              key: UniqueKey(),
                              direction: DismissDirection.endToStart,
                              background: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  color: Colors.red,
                                ),
                                child: const Align(
                                  alignment: Alignment.centerRight,
                                  child: Padding(
                                    padding: EdgeInsets.all(20.0),
                                    child: Icon(
                                      Icons.delete,
                                      color: Colors.black,
                                      size: 27,
                                    ),
                                  ),
                                ),
                              ),
                              onDismissed: (direction) {
                                setState(() {
                                  CartData().removeItem(cartItems[index]);
                                  itemCounts.remove(index);
                                });
                              },
                              child: Container(
                                padding: const EdgeInsets.all(10),
                                height: containerHeight,
                                width: screenWidth - 20,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: AppColor.searchBarFill),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      height: containerHeight - 10,
                                      width: imageWidth,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        image: DecorationImage(
                                            image: AssetImage(
                                                item.itemImg.toString()),
                                            fit: BoxFit.cover),
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              item.title!,
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                              item.subtitle!,
                                              style: const TextStyle(
                                                color: Color(0xFFADADAD),
                                              ),
                                            ),
                                            const SizedBox(height: 10),
                                            Text(
                                              '\$ ${item.price}',
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: buttonWidth,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: const Color.fromARGB(
                                            46, 158, 158, 158),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            height: 40,
                                            width: 40,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                color: AppColor.coffeeSelected),
                                            child: IconButton(
                                              onPressed: () {
                                                if (itemCounts[index] > 1) {
                                                  decrease(index);
                                                }
                                              },
                                              padding: EdgeInsets.zero,
                                              icon: const Icon(
                                                Icons.remove_rounded,
                                                color: Colors.black,
                                                size: 30,
                                              ),
                                            ),
                                          ),
                                          Text(
                                            '${itemCounts[index]}',
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 24,
                                            ),
                                          ),
                                          Container(
                                            height: 40,
                                            width: 40,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                color: AppColor.coffeeSelected),
                                            child: IconButton(
                                              onPressed: () {
                                                if (index < itemCounts.length) {
                                                  increase(index);
                                                }
                                              },
                                              padding: EdgeInsets.zero,
                                              icon: const Icon(
                                                Icons.add_rounded,
                                                color: Colors.black,
                                                size: 30,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }),
              ),
              const SizedBox(height: 10),
              cartItems.isNotEmpty
                  ? Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                height: containerHeight - 70,
                                width: screenWidth,
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadiusDirectional.circular(10),
                                  color: AppColor.searchBarFill,
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 24),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Discount Coupon',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 16),
                                      ),
                                      Icon(
                                        Icons.arrow_forward_ios_rounded,
                                        color: Colors.white,
                                        size: 16,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Sub Total',
                              style: TextStyle(color: Colors.white),
                            ),
                            Text(
                              '\$ ${subtotal.toStringAsFixed(2)}',
                              style: const TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Taxes',
                              style: TextStyle(color: Colors.white),
                            ),
                            Text(
                              '\$ ${taxes.toStringAsFixed(2)}',
                              style: const TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Discount',
                              style: TextStyle(color: Colors.white),
                            ),
                            Text(
                              '% ${discount.toStringAsFixed(2)}',
                              style: const TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                        const Divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'TOTAL',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            ),
                            Text(
                              '\$ ${total.toStringAsFixed(2)}',
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 18),
                            ),
                          ],
                        ),
                        const SizedBox(height: 25),
                        Button(
                          title: 'Checkout',
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const CheckoutPage(),
                                ));
                          },
                        ),
                      ],
                    )
                  : Container()
            ],
          ),
        ),
      ),
    );
  }
}
