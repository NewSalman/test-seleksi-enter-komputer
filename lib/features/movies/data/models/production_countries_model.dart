import 'package:enter_komputer_test/features/movies/domain/entity/production_countries.dart';

class ProductionCountriesModel extends ProductionCountries {
   ProductionCountriesModel.fromJson(Map<String, dynamic> json) {
    iso31661 = json['iso_3166_1'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['iso_3166_1'] = iso31661;
    data['name'] = name;
    return data;
  }
}