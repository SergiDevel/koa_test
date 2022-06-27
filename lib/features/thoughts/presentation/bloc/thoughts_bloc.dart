import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:koa_test/features/thoughts/domain/models/thought_model.dart';
import 'package:koa_test/features/thoughts/domain/thoughts_list.dart';

part 'thoughts_bloc_event.dart';
part 'thoughts_bloc_state.dart';

class ThoughtsBloc extends Bloc<ThoughtsBlocEvent, ThoughtsBlocState> {
  ThoughtsBloc() : super(ThoughtsBlocList(thoughts: thoughtsList)) {
    on<AddThoughtDescription>(_addThoughtDescription);
  }
  Future<void> _addThoughtDescription(
    AddThoughtDescription event,
    Emitter emit,
  ) async {
    emit(AddThoughtDescriptionState());
  }
}
