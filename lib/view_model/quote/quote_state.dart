part of 'quote_bloc.dart';

@immutable
abstract class  QuoteState extends Equatable {}

class QuoteInitial extends QuoteState {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class QuoteSuccess extends QuoteState{
  final Quote quote;

  QuoteSuccess(this.quote);

  @override
  // TODO: implement props
  List<Object?> get props => [quote];
}

class MyQuoteSuccess extends QuoteState{
  final List<MyQuote> quotes;

  MyQuoteSuccess(this.quotes);

  @override
  // TODO: implement props
  List<Object?> get props => [quotes];
}

class QuoteError extends QuoteState{
  final String message;

  QuoteError(this.message);

  @override
  // TODO: implement props
  List<Object?> get props => [message];
}

class QuoteLoading extends QuoteState{
  QuoteLoading();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

