import 'package:flutter/material.dart';
import '../ui/zorbico_palette.dart';

class ProbabilityMatrixView extends StatelessWidget {
  const ProbabilityMatrixView({super.key});

  @override
  Widget build(BuildContext context) {
    final dist = [
      {'sum': 2, 'prob': '2.78%', 'ways': '1/36'},
      {'sum': 3, 'prob': '5.56%', 'ways': '2/36'},
      {'sum': 4, 'prob': '8.33%', 'ways': '3/36'},
      {'sum': 5, 'prob': '11.11%', 'ways': '4/36'},
      {'sum': 6, 'prob': '13.89%', 'ways': '5/36'},
      {'sum': 7, 'prob': '16.67%', 'ways': '6/36 (Peak)'},
      {'sum': 8, 'prob': '13.89%', 'ways': '5/36'},
      {'sum': 9, 'prob': '11.11%', 'ways': '4/36'},
      {'sum': 10, 'prob': '8.33%', 'ways': '3/36'},
      {'sum': 11, 'prob': '5.56%', 'ways': '2/36'},
      {'sum': 12, 'prob': '2.78%', 'ways': '1/36'},
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('2d6 Probability Curve')),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: dist.length,
        separatorBuilder: (context, index) => const SizedBox(height: 8),
        itemBuilder: (context, idx) {
          final d = dist[idx];
          final isPeak = d['sum'] == 7;
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: ZorbicoPalette.surface,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: isPeak ? ZorbicoPalette.accent : ZorbicoPalette.edge),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  backgroundColor: isPeak ? ZorbicoPalette.accent : ZorbicoPalette.edge,
                  foregroundColor: isPeak ? Colors.black : ZorbicoPalette.ink,
                  radius: 16,
                  child: Text('${d["sum"]}', style: const TextStyle(fontWeight: FontWeight.bold)),
                ),
                Text(d['ways'] as String, style: const TextStyle(color: ZorbicoPalette.inkMuted, fontSize: 13)),
                Text(
                  d['prob'] as String,
                  style: TextStyle(fontWeight: FontWeight.bold, color: isPeak ? ZorbicoPalette.accent : ZorbicoPalette.ink),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
