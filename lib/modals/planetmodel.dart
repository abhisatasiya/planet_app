class PlanetModel {
  int id;
  String name;
  String name1;
  String image;
  String Exploration;
  String gallery1;
  String gallery2;
  String gallery3;
  String gallery4;
  String gallery5;
bool? favourite;
  PlanetModel({
    required this.id,
    required this.name,
    required this.name1,
    required this.image,
    required this.Exploration,
    required this.gallery1,
    required this.gallery2,
    required this.gallery3,
    required this.gallery4,
    required this.gallery5,
    required this.favourite,

  });

  factory PlanetModel.fromMap({required Map data}) {
    return PlanetModel(
      id: data['id'],
      name: data['name'],
      name1: data['name1'],
      image: data['image'],
      Exploration: data['Exploration'],
      gallery1: data['Gallery1'],
      gallery2: data['Gallery2'],
      gallery3: data['Gallery3'],
      gallery4: data['Gallery4'],
      gallery5: data['Gallery5'],
      favourite: data['favourite'],
    );
  }
}
