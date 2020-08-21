class ImageModel {
  final String btn1;
  final String btn2;
  final String btn3;
  final String btn4;
  final String image;
  bool isSelectedBtn1;
  bool isSelectedBtn2;
  String title;
  bool isSelected;

  ImageModel(
    this.btn1,
    this.btn2,
    this.btn3,
    this.btn4,
    this.image,
    this.title,
    this.isSelected,
    this.isSelectedBtn1,
    this.isSelectedBtn2,
  );
}

List<ImageModel> image = [
  ImageModel('Yes', 'No', 'See Result', "Dont Care", 'assets/food2.jpeg', 'Parata roll',
      false, false, false),
  ImageModel('Yes', 'No', 'See Result', "Dont Care", 'assets/food3.jpeg', 'Burger',
      false, false, false),
  ImageModel('Yes', 'No', 'See Result', "Dont Care", 'assets/food4.jpeg', 'Salad',
      false, false, false),
  ImageModel('Yes', 'No', 'See Result', "Dont Care", 'assets/food5.jpeg', 'Tower Burger',
      false, false, false),
  ImageModel('Yes', 'No', 'See Result', "Dont Care", 'assets/food6.jpeg', 'Meet',
      false, false, false),
  ImageModel('Yes', 'No', 'See Result', "Dont Care", 'assets/food7.jpeg', 'Pizza',
      false, false, false),
  ImageModel('Yes', 'No', 'See Result', "Dont Care", 'assets/food8.jpeg', 'Spicy Salad',
      false, false, false),
  ImageModel('Yes', 'No', 'See Result', "Dont Care", 'assets/food9.jpeg', 'Salad',
      false, false, false),
  ImageModel('Yes', 'No', 'See Result', "Dont Care", 'assets/food10.jpeg',
      'Spicy Pizza', false, false, false),
  ImageModel('Yes', 'No', 'See Result', "Dont Care", 'assets/food11.jpeg',
      'Bread', false, false, false),
  ImageModel('Yes', 'No', 'See Result', "Dont Care", 'assets/food12.jpg', 'Salad',
      false, false, false),
];
