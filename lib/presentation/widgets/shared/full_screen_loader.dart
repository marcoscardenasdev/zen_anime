import 'package:flutter/material.dart';

class FullScreenLoader extends StatelessWidget {
  final List<String> messages;
  const FullScreenLoader({super.key, required this.messages});

  Stream<String> getLoadingMessages() {
    return Stream.periodic(Duration(milliseconds: 1200), (step) {
      return messages[step];
    }).take(messages.length);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          spacing: 10,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StreamBuilder(
              stream: getLoadingMessages(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  const Text('Espere por favor...');
                }

                return Text(snapshot.data ?? 'Espere');
              },
            ),
            CircularProgressIndicator(strokeWidth: 2),
          ],
        ),
      ),
    );
  }
}
