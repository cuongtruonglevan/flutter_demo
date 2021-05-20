part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();
}

class HomeLoadingStocks extends HomeState {
  @override
  List<Object?> get props => [];
}

class HomeFailedLoadingStocks extends HomeState {
  final dynamic exception;

  HomeFailedLoadingStocks(this.exception);

  @override
  List<Object?> get props => [this.exception];
}

class HomeLoadedStocks extends HomeState {
  final List<StockTicker> stockTickers;

  HomeLoadedStocks(this.stockTickers);

  @override
  List<Object?> get props => [this.stockTickers];
}

class HomeEmptyStocks extends HomeState {
  @override
  List<Object?> get props => [];
}
