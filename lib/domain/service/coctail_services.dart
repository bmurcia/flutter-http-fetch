import 'package:flutter_http_fetch_data/domain/models/coctail_model.dart';
import 'package:flutter_http_fetch_data/domain/repository/coctail_repository.dart';

class CoctailServices {
  final CoctailRepository _coctailRepository = CoctailRepository();

  Future<List<Coctail>> getAllCoctails() async {
    return await _coctailRepository.getAllCoctails();
  }
}