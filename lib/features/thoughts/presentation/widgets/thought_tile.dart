import 'package:flutter/material.dart';
import 'package:koa_test/UI/widgets/wrapper.dart';
import 'package:koa_test/features/thoughts/domain/models/thought_model.dart';
import 'package:koa_test/features/thoughts/presentation/pages/thought_element_page.dart';
import 'package:koa_test/theme.dart';

const _iconSizeMult = 0.1;
const _iconRowMult = 0.75;
const _iconTextMult = 0.5;

class ThoughtTile extends StatelessWidget {
  const ThoughtTile({Key? key, required this.thought}) : super(key: key);

  final Thought thought;

  @override
  Widget build(BuildContext context) {
    return WidgetWrapper(
      child: Row(
        children: [
          WidgetWrapper(
            child: Icon(
              thought.moodIcon,
              size: MediaQuery.of(context).size.width * _iconSizeMult,
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * _iconRowMult,
            child: Card(
              margin: EdgeInsets.zero,
              child: WidgetWrapper(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        SizedBox(
                          width:
                              MediaQuery.of(context).size.width * _iconTextMult,
                          child: Text(
                            thought.title,
                            maxLines: 5,
                            overflow: TextOverflow.fade,
                          ),
                        ),
                        SizedBox(child: Text(thought.createdAtString)),
                      ],
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.arrow_forward_ios,
                        color: orangeColor,
                      ),
                      onPressed: () {
                        Navigator.of(context).push<void>(
                          MaterialPageRoute(
                            builder: (context) => ThoughtElementPage(
                              thought: thought,
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
