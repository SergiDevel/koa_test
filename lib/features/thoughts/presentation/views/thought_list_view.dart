import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:koa_test/UI/widgets/bottom_bar.dart';
import 'package:koa_test/features/thoughts/domain/models/thought_model.dart';
import 'package:koa_test/features/thoughts/presentation/bloc/thoughts_bloc.dart';
import 'package:koa_test/features/thoughts/presentation/widgets/add_thought_button.dart';
import 'package:koa_test/features/thoughts/presentation/widgets/thought_tile.dart';
import 'package:koa_test/theme.dart';

class ToughtListView extends StatelessWidget {
  const ToughtListView({Key? key, required this.thoughts}) : super(key: key);

  final List<Thought> thoughts;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight:
            MediaQuery.of(context).size.height * toolbarHeightMultiplier,
        title: const Text('THOUGHTS'),
      ),
      bottomNavigationBar: const KoaBottomBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: thoughts.length,
              itemBuilder: (context, index) {
                return ThoughtTile(thought: thoughts[index]);
              },
            ),
          ),
          AddThoughtButton(
            callback: () async {
              context.read<ThoughtsBloc>().add(const AddThoughtDescription());
            },
          ),
        ],
      ),
    );
  }
}
