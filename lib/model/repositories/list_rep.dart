import 'package:quotable/model/quote.dart';
import 'package:quotable/services/base_service.dart';
import 'package:quotable/services/list_quote_servise.dart';

import '../quotes.dart';

class ListRepository {
  final BaseService _listService = ListQuoteService();
  List<Quote> quote = [];

  Future<List<Quote>> fetchListQuote() async {
    dynamic response = await _listService.getResponse("/quotes?page=1");
    Quotes quotes = Quotes.fromJson(response.data);
    quotes.quotes?.forEach((element) {
      quote.add(element);
    });
    return quote;
  }
}