class CoverModel {

  final String image;
  final String name;

  CoverModel({
    required this.name,
    required this.image,
});


  static List<CoverModel> covers = [

    CoverModel(name: "Black collection", image: "assets/cover/cover3.png"),
    CoverModel(name: "HAE BY HAEKIM", image: "assets/cover/cover2.png"),
    CoverModel(name: "White collection", image: "assets/cover/cover1.png"),

  ];

}