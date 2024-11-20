
class Coctail {
  final String id;
  final String name;
  final String url;

  Coctail({
    required this.id,
    required this.name,
    required this.url
  });

  factory Coctail.fromJson(Map<String, dynamic> json) {
    return Coctail(
      id: json['idDrink'], 
      name: json['strDrink'], 
      url: json['strDrinkThumb']
    );
  }
}