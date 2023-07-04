import 'package:quotable/model/repositories/list_rep.dart';
import 'package:quotable/services/image_service.dart';

import '../my_quote.dart';

class MyQuotesRepository{
  final ListRepository listRepository = ListRepository();
  final ImageService imageService = ImageService();
  List<MyQuote> listMyQuotes = [];

  Future<List<MyQuote>> fetchMyQuotes () async {
    final listQuotes = await listRepository.fetchListQuote();
    final listImage = imageService.getImages();
    int i =1;
    while(i<21){
      listMyQuotes.add(MyQuote(quote: listQuotes[i].content, image: listImage[i]));
      i++;
    }
    return listMyQuotes;
  }
}