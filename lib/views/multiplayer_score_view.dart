import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/dice_chance_viewmodel.dart';
import '../ui/zorbico_palette.dart';

class MultiplayerScoreView extends StatelessWidget {
  const MultiplayerScoreView({super.key});

  void _showAddPlayer(BuildContext context) {
    final ctrl = TextEditingController();
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: ZorbicoPalette.surface,
        title: const Text('Add Board Gamer'),
        content: TextField(controller: ctrl, decoration: const InputDecoration(hintText: 'Player Name', border: OutlineInputBorder())),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('Cancel')),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: ZorbicoPalette.accent, foregroundColor: Colors.black),
            onPressed: () {
              if (ctrl.text.trim().isNotEmpty) {
                context.read<DiceChanceViewModel>().addPlayer(ctrl.text.trim());
                Navigator.pop(ctx);
              }
            },
            child: const Text('Add'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<DiceChanceViewModel>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Score Pad'),
        actions: [
          IconButton(icon: const Icon(Icons.person_add_outlined), onPressed: () => _showAddPlayer(context)),
        ],
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: vm.players.length,
        separatorBuilder: (context, index) => const SizedBox(height: 12),
        itemBuilder: (context, idx) {
          final p = vm.players[idx];
          return Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: ZorbicoPalette.surface,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: ZorbicoPalette.edge),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(p.name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                ),
                IconButton(icon: const Icon(Icons.remove_circle_outline), onPressed: () => vm.adjustScore(p.id, -1)),
                Text('${p.score}', style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: ZorbicoPalette.accent)),
                IconButton(icon: const Icon(Icons.add_circle_outline), onPressed: () => vm.adjustScore(p.id, 1)),
                IconButton(icon: const Icon(Icons.delete_outline, size: 20, color: ZorbicoPalette.inkMuted), onPressed: () => vm.deletePlayer(p.id)),
              ],
            ),
          );
        },
      ),
    );
  }
}
