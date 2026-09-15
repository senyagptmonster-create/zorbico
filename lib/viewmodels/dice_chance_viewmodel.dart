import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/player_score_model.dart';

class DiceChanceViewModel extends ChangeNotifier {
  static const _playersKey = 'zorbico_players_v2';

  final List<PlayerScoreItem> _players = [];
  int _lastD6A = 3;
  int _lastD6B = 4;

  List<PlayerScoreItem> get players => List.unmodifiable(_players);
  int get lastSum => _lastD6A + _lastD6B;
  int get d6A => _lastD6A;
  int get d6B => _lastD6B;

  DiceChanceViewModel() {
    _loadPlayers();
  }

  Future<void> _loadPlayers() async {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getString(_playersKey);
    if (raw != null) {
      final List dec = jsonDecode(raw);
      _players.clear();
      _players.addAll(dec.map((e) => PlayerScoreItem.fromJson(e)));
    } else {
      _players.addAll([
        PlayerScoreItem(id: '1', name: 'Player 1 (Host)', score: 14),
        PlayerScoreItem(id: '2', name: 'Player 2 (Challenger)', score: 21),
      ]);
    }
    notifyListeners();
  }

  void rollDice() {
    final rnd = Random();
    _lastD6A = 1 + rnd.nextInt(6);
    _lastD6B = 1 + rnd.nextInt(6);
    notifyListeners();
  }

  void adjustScore(String id, int delta) async {
    final idx = _players.indexWhere((p) => p.id == id);
    if (idx != -1) {
      _players[idx].score += delta;
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(_playersKey, jsonEncode(_players.map((e) => e.toJson()).toList()));
      notifyListeners();
    }
  }

  void addPlayer(String name) async {
    final p = PlayerScoreItem(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      name: name,
      score: 0,
    );
    _players.add(p);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_playersKey, jsonEncode(_players.map((e) => e.toJson()).toList()));
    notifyListeners();
  }

  void deletePlayer(String id) async {
    _players.removeWhere((p) => p.id == id);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_playersKey, jsonEncode(_players.map((e) => e.toJson()).toList()));
    notifyListeners();
  }
}
