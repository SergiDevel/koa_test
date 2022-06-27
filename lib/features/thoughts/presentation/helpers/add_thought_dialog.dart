import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:koa_test/UI/widgets/wrapper.dart';
import 'package:koa_test/features/thoughts/domain/models/thought_model.dart';
import 'package:koa_test/features/thoughts/domain/thoughts_list.dart';
import 'package:koa_test/features/thoughts/presentation/pages/thoughts_list_page.dart';
import 'package:koa_test/features/thoughts/presentation/widgets/add_thought_button.dart';
import 'package:koa_test/theme.dart';

Mood? _thoughtMood;

void dialogNavigation(BuildContext context) {
  _thoughtMood = null;
  Navigator.pushAndRemoveUntil<void>(
    context,
    MaterialPageRoute<void>(
      builder: (BuildContext context) => const ThoughtsPage(),
    ),
    ModalRoute.withName('/'),
  );
}

Future<void> customDialog({
  required BuildContext context,
}) async {
  await showDialog<void>(
    barrierDismissible: false,
    context: context,
    barrierColor: blackColor,
    builder: (BuildContext context) {
      return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: blackColor,
        body: Column(
          children: const [
            _HeaderRow(),
            Card(
              child: WidgetWrapper(
                child: _ThoughtForm(),
              ),
            ),
          ],
        ),
      );
    },
  );
}

class _ThoughtForm extends StatefulWidget {
  const _ThoughtForm({
    Key? key,
  }) : super(key: key);

  @override
  State<_ThoughtForm> createState() => _ThoughtFormState();
}

class _ThoughtFormState extends State<_ThoughtForm> {
  final thoughtController = TextEditingController();
  final evidenceController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    thoughtController.dispose();
    evidenceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('How are you feeling'),
          const _MoodSelector(),
          const Text('What is going throw your head right now?'),
          TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
            onEditingComplete: () =>
                SystemChannels.textInput.invokeMethod<void>('TextInput.hide'),
            controller: thoughtController,
            maxLines: 10,
          ),
          const Text('Is there any evidence your thought is true?'),
          TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
            onEditingComplete: () =>
                SystemChannels.textInput.invokeMethod<void>('TextInput.hide'),
            controller: evidenceController,
            maxLines: 10,
          ),
          AddThoughtButton(
            callback: () async {
              if (formKey.currentState!.validate()) {
                thoughtsList.add(
                  Thought(
                    title: thoughtController.text,
                    description: evidenceController.text,
                    mood: _thoughtMood ?? Mood.shiny,
                    createdAt: DateTime.now(),
                  ),
                );
                dialogNavigation(context);
              }
            },
          ),
        ],
      ),
    );
  }
}

class _HeaderRow extends StatelessWidget {
  const _HeaderRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WidgetWrapper(
      child: Row(
        children: [
          const Text(
            'ADD A THOUGHT',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const Spacer(),
          IconButton(
            icon: const Icon(
              Icons.close,
              color: Colors.white,
            ),
            onPressed: () => dialogNavigation(context),
          ),
        ],
      ),
    );
  }
}

class _MoodSelector extends StatefulWidget {
  const _MoodSelector({
    Key? key,
  }) : super(key: key);

  @override
  State<_MoodSelector> createState() => _MoodSelectorState();
}

class _MoodSelectorState extends State<_MoodSelector> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        for (Mood mood in moodMap.keys)
          IconButton(
            color: (_thoughtMood == mood) ? redColor : blackColor,
            onPressed: () => setState(() => _thoughtMood = mood),
            icon: Icon(moodMap[mood]),
          )
      ],
    );
  }
}
