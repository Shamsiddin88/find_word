part of 'game_bloc.dart';

sealed class GameEvent extends Equatable {
  const GameEvent();
}

class LoadQuestions extends GameEvent {
  @override
  List<Object?> get props => [];
}

class NextQuestions extends GameEvent {
  final BuildContext context;
  const NextQuestions(this.context);

  @override
  List<Object?> get props => [];
}

class ClearSelectedLetterEvent extends GameEvent {
  final int index;

  const ClearSelectedLetterEvent(this.index);

  @override
  List<Object?> get props => [index];
}


class CollectEnteredLetter extends GameEvent {
  const CollectEnteredLetter(this.letter);

  final String letter;

  @override
  List<Object?> get props => [letter];
}
class RestartGameEvent extends GameEvent {
  @override
  List<Object?> get props => [];
}
