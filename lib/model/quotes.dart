import 'package:quotable/model/quote.dart';

class Quotes {
  int? count;
  int? totalCount;
  int? page;
  int? totalPages;
  int? lastItemIndex;
  List<Quote>? quotes;

  Quotes(
      {this.count,
        this.totalCount,
        this.page,
        this.totalPages,
        this.lastItemIndex,
        this.quotes});

  Quotes.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    totalCount = json['totalCount'];
    page = json['page'];
    totalPages = json['totalPages'];
    lastItemIndex = json['lastItemIndex'];
    if (json['results'] != null) {
      quotes = <Quote>[];
      json['results'].forEach((v) {
        quotes!.add(Quote.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['count'] = count;
    data['totalCount'] = totalCount;
    data['page'] = page;
    data['totalPages'] = totalPages;
    data['lastItemIndex'] = lastItemIndex;
    if (quotes != null) {
      data['results'] = quotes!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}