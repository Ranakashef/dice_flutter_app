import 'dart:math';

import 'package:flutter/material.dart';
import 'dice.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dice Challenge',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF9B7EDE),
          brightness: Brightness.dark,
        ),
        scaffoldBackgroundColor: const Color(0xFF171622),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF242235),
          foregroundColor: Colors.white,
          centerTitle: true,
        ),
        useMaterial3: true,
      ),
      home: const DiceScreen(),
    );
  }
}

class DiceScreen extends StatefulWidget {
  const DiceScreen({super.key});

  @override
  State<DiceScreen> createState() => _DiceScreenState();
}

class _DiceScreenState extends State<DiceScreen> {
  final Random _random = Random();

  int _leftDice = 1;
  int _rightDice = 1;
  int _total = 2;
  String _imagePath = 'assets/sad.png';
  String _resultText = 'You Lose';

  void _rollDice() {
    setState(() {
      _leftDice = _random.nextInt(6) + 1;
      _rightDice = _random.nextInt(6) + 1;
      _total = _leftDice + _rightDice;

      if (_total >= 10) {
        _imagePath = 'assets/happy.png';
        _resultText = 'You Win';
      } else {
        _imagePath = 'assets/sad.png';
        _resultText = 'You Lose';
      }
    });
  }

  void _resetDice() {
    setState(() {
      _leftDice = 1;
      _rightDice = 1;
      _total = 2;
      _imagePath = 'assets/sad.png';
      _resultText = 'You Lose';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.casino_outlined),
        title: const Text('Dice Challenge'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const SizedBox(height: 12),
              Text(
                'Total: $_total',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      _imagePath,
                      width: 190,
                      height: 190,
                      fit: BoxFit.contain,
                    ),
                    const SizedBox(height: 12),
                    Text(
                      _resultText,
                      style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                            color: _total >= 10
                                ? const Color(0xFF8EE6B0)
                                : const Color(0xFFFF9AAB),
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Dice(value: _leftDice),
                  Dice(value: _rightDice),
                ],
              ),
              const SizedBox(height: 28),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: _rollDice,
                      icon: const Icon(Icons.casino),
                      label: const Text('Roll'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF9B7EDE),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 15),
                      ),
                    ),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: _resetDice,
                      icon: const Icon(Icons.restart_alt),
                      label: const Text('Reset'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF39364D),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 15),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }
}
