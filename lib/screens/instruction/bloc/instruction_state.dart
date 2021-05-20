part of 'instruction_bloc.dart';

abstract class InstructionState extends Equatable {
  const InstructionState();
}

class InstructionLoadingTags extends InstructionState {
  @override
  List<Object?> get props => [];
}

class InstructionFailedLoadingTags extends InstructionState {
  final dynamic exception;

  InstructionFailedLoadingTags(this.exception);

  @override
  List<Object?> get props => [this.exception];
}

class InstructionLoadedTags extends InstructionState {
  final List<InstructionTag> riskTags;
  final List<InstructionTag> sectorTags;
  final List<InstructionTag> stockTags;

  InstructionLoadedTags(
      {required this.riskTags,
      required this.sectorTags,
      required this.stockTags});

  @override
  List<Object?> get props => [this.riskTags, this.sectorTags, this.stockTags];
}

class InstructionEmptyTags extends InstructionState {
  @override
  List<Object?> get props => [];
}
