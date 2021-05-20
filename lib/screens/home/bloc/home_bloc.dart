import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_demo/data_access/data_access.dart';
import 'package:flutter_demo/model/model.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final User user;
  final AbstractRepository abstractRepository;

  HomeBloc(this.user, this.abstractRepository) : super(HomeLoadingStocks()) {
    add(LoadStocksEvent());
  }

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    if (event is LoadStocksEvent) {
      yield* _mapLoadStocksEventToState();
    }
  }

  Stream<HomeState> _mapLoadStocksEventToState() async* {
    try {
      final tickers = await abstractRepository.getStockTickers();
      final filteredTickers = tickers.where((element) {
        final containStock =
            user.instructionMap['stock']!.contains(element.stock);
        final containSector =
            user.instructionMap['sector']!.contains(element.sector);
        return containStock || containSector;
      }).toList();
      if (filteredTickers.isNotEmpty) {
        yield HomeLoadedStocks(filteredTickers);
      } else {
        yield HomeEmptyStocks();
      }
    } catch (exception) {
      yield HomeFailedLoadingStocks(exception);
    }
  }
}
