import 'package:flutter/material.dart';
import 'package:koa_test/UI/widgets/wrapper.dart';
import 'package:koa_test/features/thoughts/domain/models/thought_model.dart';
import 'package:koa_test/theme.dart';

const _toolBarHeight = toolbarHeightMultiplier * 2;
const _iconSizeMult = 0.1;
const _half = 0.5;
const _seventy = 0.7;
const _threeHeight = 0.03;
const _questionFontSize = 16.0;
const _dateFontSize = 12.0;

class ThoughtElementPage extends StatelessWidget {
  const ThoughtElementPage({Key? key, required this.thought}) : super(key: key);

  final Thought thought;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: MediaQuery.of(context).size.width * _toolBarHeight,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: orangeColor,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: _TitleAppBar(thought: thought),
      ),
      backgroundColor: Theme.of(context).primaryColor,
      body: WidgetWrapper(
        child: Column(
          children: [
            Card(
              child: WidgetWrapper(
                multiplier: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Is there any evidence your thought is true?',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: _questionFontSize,
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * _threeHeight,
                    ),
                    Text(thought.description),
                    const Divider(),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * _half,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _TitleAppBar extends StatelessWidget {
  const _TitleAppBar({
    Key? key,
    required this.thought,
  }) : super(key: key);

  final Thought thought;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * _seventy,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          WidgetWrapper(
            child: Icon(
              thought.moodIcon,
              color: blackColor,
              size: MediaQuery.of(context).size.width * _iconSizeMult,
            ),
          ),
          Column(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * _half,
                child: Text(
                  thought.title,
                  maxLines: 4,
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * _half,
                child: Text(
                  thought.createdAtString,
                  style: const TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: _dateFontSize,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
