import 'dart:math';
import 'package:flutter/material.dart';
import '../theme/zorbico_theme.dart';

class RollerArenaView extends StatefulWidget {
  const RollerArenaView({super.key});

  @override
  State<RollerArenaView> createState() => _RollerArenaViewState();
}

class _RollerArenaViewState extends State<RollerArenaView> {
  int _selectedSides = 20;
  int _diceCount = 2;
  List<int> _currentRolls = [18, 14];
  final List<String> _history = ['2d20 -> 18, 14 (Sum: 32)', '1d6 -> 5'];
  final Random _rnd = Random();

  void _rollDice() {
    setState(() {
      _currentRolls = List.generate(_diceCount, (_) => _rnd.nextInt(_selectedSides) + 1);
      final sum = _currentRolls.reduce((a, b) => a + b);
      _history.insert(0, '${_diceCount}d$_selectedSides -> ${_currentRolls.join(', ')} (Sum: $sum)');
    });
  }

  @override
  Widget build(BuildContext context) {
    final sum = _currentRolls.isEmpty ? 0 : _currentRolls.reduce((a, b) => a + b);

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          // Dice Polyhedral Selector Chips
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [4, 6, 8, 10, 12, 20, 100].map((sides) {
                final isSel = _selectedSides == sides;
                return Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: ChoiceChip(
                    label: Text('d$sides'),
                    selected: isSel,
                    selectedColor: ZorbicoTheme.accent,
                    labelStyle: TextStyle(
                      color: isSel ? Colors.black : Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    onSelected: (_) => setState(() => _selectedSides = sides),
                  ),
                );
              }).toList(),
            ),
          ),
          const SizedBox(height: 24),
          // Roll Arena Surface Display
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: ZorbicoTheme.surface,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: ZorbicoTheme.edge),
            ),
            child: Column(
              children: [
                Text(
                  '${_diceCount}d$_selectedSides',
                  style: const TextStyle(color: ZorbicoTheme.accentLight, fontWeight: FontWeight.bold, letterSpacing: 1),
                ),
                const SizedBox(height: 16),
                Wrap(
                  spacing: 12,
                  runSpacing: 12,
                  alignment: WrapAlignment.center,
                  children: _currentRolls.map((r) {
                    return Container(
                      width: 64,
                      height: 64,
                      decoration: BoxDecoration(
                        color: ZorbicoTheme.bg,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: ZorbicoTheme.accent, width: 2),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        '$r',
                        style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: ZorbicoTheme.ink),
                      ),
                    );
                  }).toList(),
                ),
                const SizedBox(height: 20),
                Text(
                  'Total Sum: $sum',
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: ZorbicoTheme.ink),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          // Dice Quantity Stepper
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton.filledTonal(
                onPressed: () {
                  if (_diceCount > 1) setState(() => _diceCount--);
                },
                icon: const Icon(Icons.remove),
                style: IconButton.styleFrom(backgroundColor: ZorbicoTheme.surface),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text('$_diceCount Dice', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              ),
              IconButton.filledTonal(
                onPressed: () {
                  if (_diceCount < 6) setState(() => _diceCount++);
                },
                icon: const Icon(Icons.add),
                style: IconButton.styleFrom(backgroundColor: ZorbicoTheme.surface),
              ),
            ],
          ),
          const SizedBox(height: 24),
          // Big Roll Button
          SizedBox(
            width: double.infinity,
            height: 56,
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: ZorbicoTheme.accent,
                foregroundColor: Colors.black,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              ),
              onPressed: _rollDice,
              icon: const Icon(Icons.casino),
              label: const Text('CAST POLYHEDRAL ROLL', style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 1)),
            ),
          ),
          const SizedBox(height: 24),
          // Roll History Log
          const Align(
            alignment: Alignment.centerLeft,
            child: Text('Recent Casts', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          ),
          const SizedBox(height: 8),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: _history.take(4).length,
            separatorBuilder: (context, index) => const SizedBox(height: 8),
            itemBuilder: (context, idx) {
              return Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: ZorbicoTheme.surface,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: ZorbicoTheme.edge),
                ),
                child: Text(_history[idx], style: const TextStyle(color: ZorbicoTheme.muted, fontSize: 13)),
              );
            },
          ),
        ],
      ),
    );
  }
}
