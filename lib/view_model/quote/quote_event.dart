part of 'quote_bloc.dart';

@immutable
abstract class QuoteEvent extends Equatable{

  const QuoteEvent();

  @override
  List<Object?> get props => [];
}

class GetRandom extends QuoteEvent{}

class GetMyQuotesList extends QuoteEvent{}

class GetAuthorsList extends QuoteEvent{
}
