import 'package:quotable/model/quote.dart';
import 'package:quotable/services/base_service.dart';
import 'package:quotable/services/random_service.dart';

class RandomRepository {
  final BaseService _randomService = RandomService();

  Future<Quote> fetchRandom() async {
    dynamic response = await _randomService.getResponse("/random");
    final random = Quote.fromJson(response);
    return random;
  }
}