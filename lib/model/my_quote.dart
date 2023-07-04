class MyQuote {
  String? quote;
  String? image;

  MyQuote({this.quote, this.image});


  MyQuote.fromJson(Map<String, dynamic> json) {
    quote = json['content'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['content'] = quote;
    data['image'] = image;
    return data;
  }
}
