import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_demo/data_access/data_access.dart';
import 'package:flutter_demo/model/model.dart';
import 'package:flutter_demo/screens/auth/bloc/auth_bloc.dart';
import 'package:flutter_demo/shared/utils.dart';

part 'instruction_event.dart';

part 'instruction_state.dart';

class InstructionBloc extends Bloc<InstructionEvent, InstructionState> {
  final AuthBloc _authBloc;
  final AbstractRepository _abstractRepository;
  final GlobalKey<NavigatorState> _navigatorKey;

  InstructionBloc(this._authBloc, this._abstractRepository, this._navigatorKey)
      : super(InstructionLoadingTags()) {
    add(LoadInstructionEvent());
  }

  @override
  Stream<InstructionState> mapEventToState(InstructionEvent event) async* {
    if (event is LoadInstructionEvent) {
      yield* _mapLoadInstructionEventToState();
    } else if (event is SubmitInstructionEvent) {
      yield* _mapInstructionSubmitEventToState(
          event.riskTags, event.sectorTags, event.stockTags);
    }
  }

  Stream<InstructionState> _mapLoadInstructionEventToState() async* {
    try {
      final _riskValues = await _abstractRepository.getInstructionRisks();
      final _stockValues = await _abstractRepository.getInstructionStocks();
      final _sectorValues = await _abstractRepository.getInstructionSectors();
      final _riskTags =
          _riskValues.map((e) => InstructionTag(e, false)).toList();
      final _sectorTags =
          _sectorValues.map((e) => InstructionTag(e, false)).toList();
      final _stockTags =
          _stockValues.map((e) => InstructionTag(e, false)).toList();
      if (_riskTags.isEmpty && _sectorTags.isEmpty && _stockTags.isEmpty) {
        yield InstructionEmptyTags();
      } else {
        yield InstructionLoadedTags(
            riskTags: _riskTags,
            sectorTags: _sectorTags,
            stockTags: _stockTags);
      }
    } catch (exception) {
      yield InstructionFailedLoadingTags(exception);
    }
  }

  Stream<InstructionState> _mapInstructionSubmitEventToState(
      List<InstructionTag> selectedRiskTags,
      List<InstructionTag> selectedSectorTags,
      List<InstructionTag> selectedStockTags) async* {
    if (selectedRiskTags.isEmpty &&
        selectedSectorTags.isEmpty &&
        selectedStockTags.isEmpty) {
      showAlertDialog(_navigatorKey.currentState!.overlay!.context,
          'Please select at least one tag to continue');
    } else {
      try {
        final user = User('01', 'test.test@gmail.com', 'Test', 'Test', {
          'risk': selectedRiskTags.map((e) => e.name).toList(),
          'sector': selectedSectorTags.map((e) => e.name).toList(),
          'stock': selectedStockTags.map((e) => e.name).toList(),
        });
        _authBloc.add(DidAuthenticate(user));
      } catch (exception) {
        yield InstructionFailedLoadingTags(exception);
      }
    }
  }
}
