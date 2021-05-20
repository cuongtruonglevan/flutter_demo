part of 'instruction_bloc.dart';

abstract class InstructionEvent extends Equatable {
  const InstructionEvent();
}

class LoadInstructionEvent extends InstructionEvent {
  @override
  List<Object?> get props => [];
}

class SubmitInstructionEvent extends InstructionEvent {
  final List<InstructionTag> riskTags;
  final List<InstructionTag> sectorTags;
  final List<InstructionTag> stockTags;

  SubmitInstructionEvent(this.riskTags, this.sectorTags, this.stockTags);

  @override
  List<Object?> get props => [this.riskTags, this.sectorTags, this.stockTags];
}
