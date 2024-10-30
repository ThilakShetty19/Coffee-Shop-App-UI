// ignore_for_file: public_member_api_docs, sort_constructors_first
class CoffeeItem {
  String? id;
  double? rating;
  String? itemImg;
  String? title;
  String? subtitle;
  double? price;
  String? description;
  int quantity;
  CoffeeItem({
    this.id,
    this.rating,
    this.itemImg,
    this.subtitle,
    this.price,
    this.title,
    this.description,
    this.quantity = 1,
  });

  static List<CoffeeItem> getCoffeeList() {
    List<CoffeeItem> coffeeList = [];
    coffeeList.add(
      CoffeeItem(
          id: '001',
          rating: 4.5,
          itemImg: 'assets/images/cappuccino.jpg',
          price: 4.21,
          subtitle: 'With oat milk',
          title: 'Cappuccino',
          description:
              "Cappuccino is an espresso-based coffee drink that is traditionally prepared with steamed milk including a layer of milk foam."),
    );
    coffeeList.add(CoffeeItem(
        id: '002',
        rating: 4.2,
        itemImg: 'assets/images/latte.jpg',
        price: 5.00,
        subtitle: 'With chocoklet',
        title: 'Latte',
        description:
            'A latte or caffè latte is a milk coffee that is a made up of one or two shots of espresso, steamed milk and a final, thin layer of frothed milk on top.'));

    coffeeList.add(
      CoffeeItem(
          id: '003',
          rating: 4.0,
          itemImg: 'assets/images/espresso.jpg',
          price: 4.00,
          subtitle: 'With chocoklet',
          title: 'Espresso',
          description:
              "Espresso is a concentrated form of coffee produced by forcing hot water under high pressure through finely-ground coffee beans."),
    );
    return coffeeList;
  }
}
