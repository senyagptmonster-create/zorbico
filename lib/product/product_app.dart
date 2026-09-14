import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../app/brand.dart';
import '../app/theme.dart';
import 'screens.dart';
import 'zorbico_store.dart';

class ProductApp extends StatelessWidget {
  const ProductApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ZorbicoStore()..load(),
      child: MaterialApp(
        title: 'Zorbico',
        theme: ThemeData(
          primaryColor: cAccent,
          scaffoldBackgroundColor: cBg,
        ),
        home: const ZorbicoHome(),
      ),
    );
  }
}

class ZorbicoHome extends StatefulWidget {
  const ZorbicoHome({super.key});
  @override
  State<ZorbicoHome> createState() => _ZorbicoHomeState();
}

class _ZorbicoHomeState extends State<ZorbicoHome> {
  int _idx = 0;
  final _screens = [const ProbabilityScreen(), const ArenaScreen(), const ScoreboardScreen(), const FormulasScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cBg,
      appBar: AppBar(
        title: Text('Zorbico', style: AppTheme.display(cInk)),
        backgroundColor: cSurface,
      ),
      drawer: Drawer(
        backgroundColor: cSurface,
        child: ListView(
          children: [
            ListTile(title: Text('Probability Matrix', style: AppTheme.text(cInk)), onTap: () { setState(() { _idx = 0; }); Navigator.pop(context); }),
            ListTile(title: Text('Rolling Arena', style: AppTheme.text(cInk)), onTap: () { setState(() { _idx = 1; }); Navigator.pop(context); }),
            ListTile(title: Text('Scoreboard', style: AppTheme.text(cInk)), onTap: () { setState(() { _idx = 2; }); Navigator.pop(context); }),
            ListTile(title: Text('Formulas', style: AppTheme.text(cInk)), onTap: () { setState(() { _idx = 3; }); Navigator.pop(context); }),
          ],
        ),
      ),
      body: _screens[_idx],
    );
  }
}
