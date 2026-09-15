import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'ui/zorbico_palette.dart';
import 'viewmodels/dice_chance_viewmodel.dart';
import 'views/probability_matrix_view.dart';
import 'views/multiplayer_score_view.dart';
import 'views/dice_rolling_arena_view.dart';
import 'views/saved_formulas_view.dart';

class ZorbicoApp extends StatelessWidget {
  const ZorbicoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => DiceChanceViewModel(),
      child: MaterialApp(
        title: 'Zorbico Dice Roller',
        debugShowCheckedModeBanner: false,
        theme: ZorbicoPalette.theme,
        home: const _ZorbicoShell(),
      ),
    );
  }
}

class _ZorbicoShell extends StatefulWidget {
  const _ZorbicoShell();

  @override
  State<_ZorbicoShell> createState() => _ZorbicoShellState();
}

class _ZorbicoShellState extends State<_ZorbicoShell> {
  int _idx = 0;

  final List<Widget> _pages = const [
    DiceRollingArenaView(),
    ProbabilityMatrixView(),
    MultiplayerScoreView(),
    SavedFormulasView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: ZorbicoPalette.edge),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.casino, color: ZorbicoPalette.accent, size: 40),
                  SizedBox(height: 10),
                  Text('Zorbico Roller', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  Text('Dice Probability & Score Keeper', style: TextStyle(fontSize: 12, color: ZorbicoPalette.inkMuted)),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.casino_outlined),
              title: const Text('Arena'),
              selected: _idx == 0,
              onTap: () { setState(() => _idx = 0); Navigator.pop(context); },
            ),
            ListTile(
              leading: const Icon(Icons.bar_chart),
              title: const Text('Probabilities'),
              selected: _idx == 1,
              onTap: () { setState(() => _idx = 1); Navigator.pop(context); },
            ),
            ListTile(
              leading: const Icon(Icons.scoreboard_outlined),
              title: const Text('Score Pad'),
              selected: _idx == 2,
              onTap: () { setState(() => _idx = 2); Navigator.pop(context); },
            ),
            ListTile(
              leading: const Icon(Icons.functions),
              title: const Text('Theory'),
              selected: _idx == 3,
              onTap: () { setState(() => _idx = 3); Navigator.pop(context); },
            ),
          ],
        ),
      ),
      body: _pages[_idx],
    );
  }
}
