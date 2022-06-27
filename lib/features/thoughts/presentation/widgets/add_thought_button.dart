import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

const _sixtyHeight = 0.06;

class AddThoughtButton extends StatelessWidget {
  const AddThoughtButton({
    Key? key,
    required this.callback,
    this.width = double.infinity,
  }) : super(key: key);
  final AsyncCallback callback;
  final double width;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: callback,
        child: Container(
          height: MediaQuery.of(context).size.height * _sixtyHeight,
          alignment: Alignment.center,
          width: width,
          child: const Text('ADD A THOUGHT'),
        ),
      ),
    );
  }
}
