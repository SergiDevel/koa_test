part of 'thoughts_bloc.dart';

abstract class ThoughtsBlocEvent extends Equatable {
  const ThoughtsBlocEvent();

  @override
  List<Object> get props => [];
}

class AddThoughtDescription extends ThoughtsBlocEvent {
  const AddThoughtDescription();

  @override
  List<Object> get props => [];
}
