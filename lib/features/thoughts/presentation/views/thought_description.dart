import 'package:flutter/material.dart';
import 'package:koa_test/UI/widgets/bottom_bar.dart';
import 'package:koa_test/UI/widgets/wrapper.dart';
import 'package:koa_test/features/thoughts/presentation/helpers/add_thought_dialog.dart';
import 'package:koa_test/features/thoughts/presentation/widgets/add_thought_button.dart';
import 'package:koa_test/theme.dart';

const _titleFontSize = 40.0;

class ThoughtDescription extends StatelessWidget {
  const ThoughtDescription({Key? key}) : super(key: key);

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
            child: WidgetWrapper(
              multiplier: 3,
              child: Column(
                children: const [
                  Text(
                    'This is your Thoughts Diary',
                    style: TextStyle(fontSize: _titleFontSize),
                    textAlign: TextAlign.center,
                  ),
                  Spacer(),
                  Text(
                    '''Here you can log your thoughts and reflect on them. You can log both positive and negative thoughts. You should do so once a day.''',
                    textAlign: TextAlign.center,
                  ),
                  Spacer(flex: 4),
                ],
              ),
            ),
          ),
          AddThoughtButton(
            callback: () async {
              await customDialog(
                context: context,
              );
            },
          ),
        ],
      ),
    );
  }
}
