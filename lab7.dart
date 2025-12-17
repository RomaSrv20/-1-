import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Stack + RichText Example')),
        body: Center(
          child: Container(
            width: 300,
            height: 200,
            color: Colors.grey[300],
            child: Stack(
              children: [
                // Positioned RichText з відступами a, b, c
                Positioned(
                  top: 8,      // a = 8px
                  left: 28,    // b = 28px
                  bottom: 68,  // c = 68px
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Hello, ',
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                          text: 'Flutter!',
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.blue,
                              fontStyle: FontStyle.italic),
                        ),
                      ],
                    ),
                  ),
                ),
                // Додатковий елемент для наочності
                Positioned(
                  bottom: 10,
                  right: 10,
                  child: Container(
                    width: 50,
                    height: 50,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
