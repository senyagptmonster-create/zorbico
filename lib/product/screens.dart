import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../app/brand.dart';
import '../app/theme.dart';
import 'zorbico_store.dart';
import 'dart:math';

class ProbabilityScreen extends StatelessWidget {
  const ProbabilityScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('2d6 Probability: 16.6% for 7', style: AppTheme.text(cInk)));
  }
}

class ArenaScreen extends StatelessWidget {
  const ArenaScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final store = context.watch<ZorbicoStore>();
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Last Roll: ${store.lastRoll}', style: AppTheme.display(cInk)),
          ElevatedButton(
            onPressed: () { store.setRoll(Random().nextInt(20) + 1); },
            child: const Text('Roll d20'),
          )
        ],
      ),
    );
  }
}

class ScoreboardScreen extends StatelessWidget {
  const ScoreboardScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Player 1: 50 pts', style: AppTheme.text(cInk)));
  }
}

class FormulasScreen extends StatelessWidget {
  const FormulasScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Saved: 4d6 drop lowest', style: AppTheme.text(cInk)));
  }
}
