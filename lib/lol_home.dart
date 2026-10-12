import 'dart:math';

import 'package:flutter/material.dart';

class QuoteHome extends StatefulWidget {
  const QuoteHome({super.key});
  @override
  State<QuoteHome> createState() =>
      _QuoteHomeState();
}

class _QuoteHomeState extends State<QuoteHome> {
  // Список только из текста цитаты и картинки
  final List<Map<String, String>> _quotes = [
    {
      'text': 'Лучший способ предсказать будущее — создать его.',
      'img': 'assets/images/quote1.jpg',
    },
    {
      'text': 'Успех — это способность идти от неудачи к неудаче.',
      'img': 'assets/images/quote2.jpg',
    },
    {
      'text': 'Сложнее всего начать действовать, остальное — упорство.',
      'img': 'assets/images/quote3.jpg',
    },
  ];
  int _index = 0;
  void _nextQuote() {
    setState(() {
      _index = Random().nextInt(_quotes.length);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.purple,
              Colors.orange,
            ],
          ), // Градиент
        ),
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.center,
          children: [
            const Text(
              'ЦИТАТА ДНЯ',
              style: TextStyle(
                fontSize: 32,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 32),
            Image.asset(
              _quotes[_index]['img']!,
              width: 220,
              height: 220,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 30),
            Text(
              '"${_quotes[_index]['text']}"',
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontStyle: FontStyle.italic,
              ),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: _nextQuote,
              child: const Text(
                'Следующая цитата',
                style: TextStyle(
                  color: Colors.purple,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
