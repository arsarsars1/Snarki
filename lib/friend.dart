class Model {
  String name;
  String pic;

  Model(
    this.name,
    this.pic,
  );
}
class Restaurant {
  String name;
  String pic;
  String km;
  String map;

  Restaurant(
      this.name,
      this.pic,
      this.km,
      this.map,
      );
}
List<Model> friend = [
  Model('Abdul Rehman','assets/profile.jpg'),
  Model('Abdul','assets/profile.jpg'),
  Model('Rehman','assets/profile.jpg'),
  Model('Abdul Rehman (A.R.S)','assets/profile.jpg'),
  Model('A.R.S','assets/profile.jpg'),
];

List<Restaurant> restaurant = [
  Restaurant('Mcdonalds','assets/food12.jpg','12km','assets/img1.jpg'),
  Restaurant('Pizza Hut','assets/food10.jpeg','5km','assets/img2.jpg'),
  Restaurant('Subway','assets/food7.jpeg','10km','assets/img3.jpg'),
  Restaurant('Burger Point','assets/food3.jpeg','25km','assets/img4.jpg'),
];
