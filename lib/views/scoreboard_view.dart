import 'package:flutter/material.dart';
import '../theme/zorbico_theme.dart';

class ScoreboardView extends StatefulWidget {
  const ScoreboardView({super.key});

  @override
  State<ScoreboardView> createState() => _ScoreboardViewState();
}

class _ScoreboardViewState extends State<ScoreboardView> {
  final List<Map<String, dynamic>> _players = [
    {'name': 'Player 1 (Mage)', 'score': 28},
    {'name': 'Player 2 (Rogue)', 'score': 34},
    {'name': 'Player 3 (Paladin)', 'score': 42},
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const Text('Tabletop Party Scoreboard', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 14),
        ..._players.map((p) {
          return Container(
            margin: const EdgeInsets.only(bottom: 12),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: ZorbicoTheme.surface,
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: ZorbicoTheme.edge),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(p['name'] as String, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                      Text('Score: ${p['score']}', style: const TextStyle(color: ZorbicoTheme.accent, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
                IconButton.filledTonal(
                  onPressed: () => setState(() => p['score']--),
                  icon: const Icon(Icons.remove),
                  style: IconButton.styleFrom(backgroundColor: ZorbicoTheme.bg),
                ),
                const SizedBox(width: 8),
                IconButton.filledTonal(
                  onPressed: () => setState(() => p['score']++),
                  icon: const Icon(Icons.add),
                  style: IconButton.styleFrom(backgroundColor: ZorbicoTheme.bg),
                ),
              ],
            ),
          );
        }),
      ],
    );
  }
}
