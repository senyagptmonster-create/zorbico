import 'package:flutter/material.dart';
import '../ui/zorbico_palette.dart';

class SavedFormulasView extends StatelessWidget {
  const SavedFormulasView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Combinatorics Rules')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: ZorbicoPalette.surface,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: ZorbicoPalette.edge),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Independent Probability Law', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                SizedBox(height: 8),
                Text(
                  'With two distinct 6-sided dice, there exist exactly 36 discrete outcomes. The sum 7 exhibits the highest combinatorial frequency (1+6, 2+5, 3+4, 4+3, 5+2, 6+1).',
                  style: TextStyle(fontSize: 13, color: ZorbicoPalette.inkMuted, height: 1.4),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
