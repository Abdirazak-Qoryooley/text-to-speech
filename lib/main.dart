import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final FlutterTts flutterTts = FlutterTts();
    final TextEditingController textEditingController = TextEditingController();

    speak(String text) async {
      await flutterTts.setLanguage("En-us");
      await flutterTts.setPitch(1);
      await flutterTts.speak(text);
    }

    return Scaffold(
      backgroundColor: Colors.grey,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: TextField(
                controller: textEditingController,
                decoration: InputDecoration(
                  hintText: 'insert your number',
                ),
              ),
            ),
            ElevatedButton(
                onPressed: () => speak(textEditingController.text),
                child: Text('Jog sii'))
          ],
        ),
      ),
    );
  }
}
