import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quotable/model/my_quote.dart';

import '../model/quote.dart';
import '../model/quotes.dart';
import '../view_model/quote/quote_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _fetchRandom();
  }

  //
  // void randomNum(){
  //   var num = Random();
  //   int a = 1;
  //   while(a<200){
  //    quoteList.add(num.nextInt(500));
  //    a++;
  //   }
  // }

  void _fetchRandom() {
    context.read<QuoteBloc>().add(GetRandom());
  }

  NetworkImage getNewImage() {
    return NetworkImage("https://picsum.photos/700/1280/?blur=1?image=200");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: myBody());
  }

  Future<List<Quote>> getQuote() async {
    List<Quote> quote = [];
    final dio = Dio();

    for (int i = 1; i <= 20; i++) {
      final response = await dio.get("https://api.quotable.io/quotes?page=$i");
      if (response.statusCode == 200) {
        Quotes quotes = Quotes.fromJson(response.data);
        quotes.quotes?.forEach((element) {
          quote.add(element);
        });
      } else {
        print('Request failed with statusasasasasas: ${response.statusCode}.');
      }
    }
    return quote;
  }

  Widget myBody() {
    return BlocBuilder<QuoteBloc, QuoteState>(
      builder: (BuildContext context, state) {
        if (state is QuoteLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is QuoteError) {
          return Center(child: Text(state.message));
        }
        if (state is MyQuoteSuccess) {
          return PageView.builder(
              onPageChanged: (index) {
                _fetchRandom();
              },
              scrollDirection: Axis.vertical,
              controller: PageController(
                initialPage: 0,
                keepPage: true,
                viewportFraction: 1,
              ),
              itemCount: 100,
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    image: NetworkImage(state.quotes[index].image.toString()),
                        fit: BoxFit.cover
                  )),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: Center(
                        child: Text(
                      state.quotes[index].quote ?? "",
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 30,
                        color: Colors.black,
                      ),
                    )),
                  ),
                );
              });
        } else {
          return Container();
        }
      },
    );
  }
}

//FutureBuilder(
//         future: getQuote(),
//         builder: (context, snapshot) {
//           if (!snapshot.hasData) {
//             return const Center(child: CircularProgressIndicator());
//           } else {
//             return PageView.builder(
//                 onPageChanged: (index) {},
//                 scrollDirection: Axis.vertical,
//                 controller: PageController(
//                   initialPage: 0,
//                   keepPage: true,
//                   viewportFraction: 1,
//                 ),
//                 itemCount: snapshot.data?.length,
//                 itemBuilder: (context, index) {
//                   return Container(
//                     decoration: BoxDecoration(
//                       image: DecorationImage(
//                         image: getNewImage(index),
//                         fit: BoxFit.cover
//                       )
//                     ),
//                     child: Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 20.0),
//                       child: Center(
//                           child: Text(
//                             snapshot.data?[index].content ?? "",
//                             textAlign: TextAlign.center,
//                             style: const TextStyle(
//                                 fontSize: 30,
//                                 color: Colors.black,
//                                 ),
//                           )),
//                     ),
//                   );
//                 });
//           }
//         },
//       )
