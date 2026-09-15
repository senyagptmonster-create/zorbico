import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/dice_chance_viewmodel.dart';
import '../ui/zorbico_palette.dart';

class DiceRollingArenaView extends StatelessWidget {
  const DiceRollingArenaView({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<DiceChanceViewModel>();

    return Scaffold(
      appBar: AppBar(title: const Text('Rolling Arena')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _diceBox(vm.d6A),
                const SizedBox(width: 20),
                _diceBox(vm.d6B),
              ],
            ),
            const SizedBox(height: 28),
            Text(
              'Sum: ${vm.lastSum}',
              style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: ZorbicoPalette.accent),
            ),
            const SizedBox(height: 36),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: ZorbicoPalette.accent,
                foregroundColor: Colors.black,
                padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 16),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              ),
              icon: const Icon(Icons.casino),
              label: const Text('Roll 2d6', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              onPressed: () => vm.rollDice(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _diceBox(int val) {
    return Container(
      width: 90,
      height: 90,
      decoration: BoxDecoration(
        color: ZorbicoPalette.surface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: ZorbicoPalette.edge, width: 2),
      ),
      child: Center(
        child: Text('$val', style: const TextStyle(fontSize: 44, fontWeight: FontWeight.bold, color: ZorbicoPalette.ink)),
      ),
    );
  }
}
