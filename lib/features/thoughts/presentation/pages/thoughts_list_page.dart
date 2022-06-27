import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:koa_test/features/thoughts/domain/thoughts_list.dart';
import 'package:koa_test/features/thoughts/presentation/bloc/thoughts_bloc.dart';
import 'package:koa_test/features/thoughts/presentation/views/thought_description.dart';
import 'package:koa_test/features/thoughts/presentation/views/thought_list_view.dart';

class ThoughtsPage extends StatelessWidget {
  const ThoughtsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _buildBody(context);
  }
}

/// Builder for the Login Page Body
BlocProvider<ThoughtsBloc> _buildBody(BuildContext context) {
  SystemChannels.textInput.invokeMethod<void>('TextInput.hide');

  return BlocProvider(
    create: (_) => ThoughtsBloc(),
    child: BlocBuilder<ThoughtsBloc, ThoughtsBlocState>(
      builder: (context, state) {
        if (state is ThoughtsBlocList) {
          return ToughtListView(thoughts: thoughtsList);
        } else if (state is AddThoughtDescriptionState) {
          return const ThoughtDescription();
        } else {
          return const Center(
            child: Text(
              'There was an error, please restart the app',
            ),
          );
        }
      },
    ),
  );
}
