import 'package:flutter/material.dart';
import '../theme/zorbico_theme.dart';

class DiceProbabilityPainter extends CustomPainter {
  final int selectedSum;

  DiceProbabilityPainter({required this.selectedSum});

  @override
  void paint(Canvas canvas, Size size) {
    // 2d6 combinations: 2 through 12
    // Counts: 1, 2, 3, 4, 5, 6, 5, 4, 3, 2, 1 (total 36)
    const counts = [1, 2, 3, 4, 5, 6, 5, 4, 3, 2, 1];
    final barCount = counts.length;
    final totalWidth = size.width - 32;
    final barSpacing = 4.0;
    final barWidth = (totalWidth - (barSpacing * (barCount - 1))) / barCount;
    const maxCount = 6.0;

    for (int i = 0; i < barCount; i++) {
      final sum = i + 2;
      final x = 16.0 + i * (barWidth + barSpacing);
      final heightRatio = counts[i] / maxCount;
      final barH = (size.height - 40.0) * heightRatio;
      final y = size.height - 24.0 - barH;
      final isSelected = sum == selectedSum;

      final barRRect = RRect.fromRectAndRadius(
        Rect.fromLTWH(x, y, barWidth, barH),
        const Radius.circular(4),
      );

      final barPaint = Paint()
        ..color = isSelected
            ? ZorbicoTheme.accentLight
            : (sum == 7
                ? ZorbicoTheme.accent.withValues(alpha: 0.8)
                : ZorbicoTheme.accent.withValues(alpha: 0.35));

      canvas.drawRRect(barRRect, barPaint);

      // Label below bar
      final tp = TextPainter(
        text: TextSpan(
          text: '$sum',
          style: TextStyle(
            color: isSelected ? ZorbicoTheme.accentLight : ZorbicoTheme.muted,
            fontSize: 10,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
        textDirection: TextDirection.ltr,
      )..layout();
      tp.paint(canvas, Offset(x + (barWidth - tp.width) / 2, size.height - 18));
    }
  }

  @override
  bool shouldRepaint(covariant DiceProbabilityPainter oldDelegate) {
    return oldDelegate.selectedSum != selectedSum;
  }
}
