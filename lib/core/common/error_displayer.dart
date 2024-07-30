import 'package:flutter/material.dart';

class ErrorDisplayer extends StatelessWidget {
  final Future<void> Function() onRefresh;
  final String message;
  const ErrorDisplayer(
      {super.key, required this.onRefresh, required this.message});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: RefreshIndicator(
      color: Colors.white,
      displacement: 10,
      onRefresh: onRefresh,
      child: ListView(children: [
        const SizedBox(
          height: 150,
        ),
        const Icon(
          Icons.error_outline_sharp,
          size: 60,
        ),
        const SizedBox(
          height: 50,
        ),
        Padding(
          padding: const EdgeInsets.all(8),
          child: Text(
            message,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 24,
            ),
          ),
        )
      ]),
    ));
  }
}
