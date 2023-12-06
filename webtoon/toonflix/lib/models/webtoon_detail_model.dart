class WebtoondetailMobel {
  final String title, about, genre, age;

  WebtoondetailMobel.fromJson(Map<String, dynamic> json)
      : title = json["title"],
        about = json["about"],
        genre = json["genre"],
        age = json["age"];
}
