part of 'thoughts_bloc.dart';

abstract class ThoughtsBlocState extends Equatable {
  const ThoughtsBlocState();

  @override
  List<Object> get props => [];
}

class ThoughtsBlocList extends ThoughtsBlocState {
  const ThoughtsBlocList({
    required this.thoughts,
  });

  final List<Thought> thoughts;
}

class AddThoughtDescriptionState extends ThoughtsBlocState {}
