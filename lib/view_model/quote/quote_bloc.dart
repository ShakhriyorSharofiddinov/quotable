import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:quotable/model/my_quote.dart';
import 'package:quotable/model/quote.dart';
import 'package:quotable/model/repositories/my_quotes.dart';
import 'package:quotable/model/repositories/random_repositories.dart';

part 'quote_event.dart';

part 'quote_state.dart';

class QuoteBloc extends Bloc<QuoteEvent, QuoteState> {
  QuoteBloc() : super(QuoteInitial()) {
    on<QuoteEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<GetRandom>(_mapGetRandomToState);
    on<GetMyQuotesList>(_mapGetMyQuotesListToState);
  }
}

Future<void> _mapGetRandomToState(
    GetRandom event, Emitter<QuoteState> emit) async {
  try {
    final quote = await RandomRepository().fetchRandom();
    emit(QuoteSuccess(quote));
  } catch (e) {
    emit(QuoteError(e.toString()));
  }
}

Future<void> _mapGetMyQuotesListToState(
    GetMyQuotesList event, Emitter<QuoteState> emit) async {
  try {
    final quotes = await MyQuotesRepository().fetchMyQuotes();
    emit(MyQuoteSuccess(quotes));
  } catch (e) {
    emit(QuoteError(e.toString()));
  }
}
