import 'package:flutter/material.dart';
import '../theme/zorbico_theme.dart';
import '../painters/dice_probability_painter.dart';

class ProbabilityView extends StatefulWidget {
  const ProbabilityView({super.key});

  @override
  State<ProbabilityView> createState() => _ProbabilityViewState();
}

class _ProbabilityViewState extends State<ProbabilityView> {
  int _selectedSum = 7;

  @override
  Widget build(BuildContext context) {
    // 2d6 combinations
    const totalOutcomes = 36;
    final outcomesMap = {
      2: 1, 3: 2, 4: 3, 5: 4, 6: 5, 7: 6,
      8: 5, 9: 4, 10: 3, 11: 2, 12: 1,
    };
    final combos = outcomesMap[_selectedSum] ?? 0;
    final pct = (combos / totalOutcomes * 100).toStringAsFixed(1);

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('2d6 Bell Curve Distribution', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 6),
          const Text('Tap any outcome sum to evaluate combinatorial odds.', style: TextStyle(color: ZorbicoTheme.muted)),
          const SizedBox(height: 20),
          Container(
            height: 200,
            width: double.infinity,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: ZorbicoTheme.surface,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: ZorbicoTheme.edge),
            ),
            child: CustomPaint(
              painter: DiceProbabilityPainter(selectedSum: _selectedSum),
            ),
          ),
          const SizedBox(height: 24),
          // Selected Sum Analysis Card
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: ZorbicoTheme.surface,
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: ZorbicoTheme.edge),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Outcome Sum: $_selectedSum', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                    Text('$pct% Chance', style: const TextStyle(color: ZorbicoTheme.accent, fontWeight: FontWeight.bold, fontSize: 16)),
                  ],
                ),
                const SizedBox(height: 8),
                Text('Combinations: $combos out of 36 possible outcomes', style: const TextStyle(color: ZorbicoTheme.muted, fontSize: 13)),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 8,
            children: List.generate(11, (i) {
              final s = i + 2;
              final isSel = _selectedSum == s;
              return ChoiceChip(
                label: Text('$s'),
                selected: isSel,
                selectedColor: ZorbicoTheme.accent,
                labelStyle: TextStyle(color: isSel ? Colors.black : Colors.white, fontWeight: FontWeight.bold),
                onSelected: (_) => setState(() => _selectedSum = s),
              );
            }),
          ),
        ],
      ),
    );
  }
}
