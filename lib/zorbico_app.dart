import 'package:flutter/material.dart';
import 'theme/zorbico_theme.dart';
import 'views/roller_arena_view.dart';
import 'views/probability_view.dart';
import 'views/scoreboard_view.dart';

class ZorbicoApp extends StatefulWidget {
  const ZorbicoApp({super.key});

  @override
  State<ZorbicoApp> createState() => _ZorbicoAppState();
}

class _ZorbicoAppState extends State<ZorbicoApp> {
  int _selectedNav = 0;

  @override
  Widget build(BuildContext context) {
    Widget content;
    String title;
    switch (_selectedNav) {
      case 0:
        content = const RollerArenaView();
        title = 'Dice Arena';
        break;
      case 1:
        content = const ProbabilityView();
        title = 'Probability Matrix';
        break;
      case 2:
      default:
        content = const ScoreboardView();
        title = 'Party Scoreboard';
        break;
    }

    return MaterialApp(
      title: 'Zorbico Dice',
      debugShowCheckedModeBanner: false,
      theme: ZorbicoTheme.themeData,
      home: Scaffold(
        appBar: AppBar(
          title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
          centerTitle: true,
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: const BoxDecoration(color: ZorbicoTheme.accent),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.black,
                      radius: 24,
                      child: Icon(Icons.casino, color: ZorbicoTheme.accent, size: 28),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Zorbico Arena',
                      style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Polyhedral odds & scores',
                      style: TextStyle(color: Colors.black87, fontSize: 13),
                    ),
                  ],
                ),
              ),
              ListTile(
                leading: const Icon(Icons.casino_outlined),
                title: const Text('Dice Arena'),
                selected: _selectedNav == 0,
                onTap: () {
                  setState(() => _selectedNav = 0);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.bar_chart),
                title: const Text('Probability Matrix'),
                selected: _selectedNav == 1,
                onTap: () {
                  setState(() => _selectedNav = 1);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.scoreboard_outlined),
                title: const Text('Party Scoreboard'),
                selected: _selectedNav == 2,
                onTap: () {
                  setState(() => _selectedNav = 2);
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
        body: content,
      ),
    );
  }
}
