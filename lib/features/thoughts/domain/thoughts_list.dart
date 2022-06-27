import 'package:koa_test/features/thoughts/domain/models/thought_model.dart';

/// Singleton for thoughts list.
final thoughtsList = <Thought>[
  Thought(
    title: 'I need to think more what the other person is feeling',
    description: 'Yes, Bill was very rude to me.',
    mood: Mood.rainy,
    createdAt: DateTime.utc(2022, 06, 22, 12),
  ),
  Thought(
    title: 'I have to give importance to a good sleep',
    description: 'It always improves my mood the next day.',
    mood: Mood.rainbow,
    createdAt: DateTime.utc(2022, 06, 27, 12),
  ),
  Thought(
    title: 'I have to consider the the proper time to express myself',
    description: 'Not really, but it is important to think about it.',
    mood: Mood.sunny,
    createdAt: DateTime.utc(2022, 06, 24, 12),
  ),
];
