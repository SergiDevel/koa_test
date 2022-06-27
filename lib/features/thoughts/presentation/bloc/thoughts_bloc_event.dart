part of 'thoughts_bloc.dart';

abstract class ThoughtsBlocEvent extends Equatable {
  const ThoughtsBlocEvent();

  @override
  List<Object> get props => [];
}

class AddThought extends ThoughtsBlocEvent {
  const AddThought({required this.thought});

  final Thought thought;

  @override
  List<Object> get props => [thought];
}

class AddThoughtDescription extends ThoughtsBlocEvent {
  const AddThoughtDescription();

  @override
  List<Object> get props => [];
}
