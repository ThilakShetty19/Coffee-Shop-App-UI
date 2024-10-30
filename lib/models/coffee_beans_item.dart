// ignore_for_file: public_member_api_docs, sort_constructors_first
class CoffeeBeansItem {
  double? cbRating;
  String? cbItemImg;
  String? cbTitle;
  String? cbSubtitle;
  double? cbPrice;

  CoffeeBeansItem({
    this.cbRating,
    this.cbItemImg,
    this.cbTitle,
    this.cbSubtitle,
    this.cbPrice,
  });

  static List<CoffeeBeansItem> getBeansItem() {
    
    List<CoffeeBeansItem> beansItem = [];

    beansItem.add(CoffeeBeansItem(
      cbItemImg: 'assets/images/coffe_beans.jpg',
      cbTitle: 'Robusta',
      cbSubtitle: 'Medium Roasted',
      cbPrice: 4.35,
      cbRating: 4.2,
    ));
    beansItem.add(CoffeeBeansItem(
      cbItemImg: 'assets/images/arabica.jpg',
      cbTitle: 'Arabica',
      cbSubtitle: 'Roasted',
      cbPrice: 4.15,
      cbRating: 4.5,
    ));
    return beansItem;
  }
}
