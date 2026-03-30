import 'package:flutter/material.dart';

class PortfolioBackground extends StatelessWidget {
  const PortfolioBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return const Stack(
      children: [_BaseDarkGradient(), _AnimatedGlows(), _DotGridOverlay()],
    );
  }
}

class _BaseDarkGradient extends StatelessWidget {
  const _BaseDarkGradient();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF0D1117), Color(0xFF0F1923), Color(0xFF0A1A14)],
        ),
      ),
    );
  }
}

class _AnimatedGlows extends StatefulWidget {
  const _AnimatedGlows();

  @override
  State<_AnimatedGlows> createState() => _AnimatedGlowsState();
}

class _AnimatedGlowsState extends State<_AnimatedGlows>
    with TickerProviderStateMixin {
  late final AnimationController _ctrl1;
  late final AnimationController _ctrl2;
  late final AnimationController _ctrl3;

  @override
  void initState() {
    super.initState();
    _ctrl1 = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 8),
    )..repeat(reverse: true);
    _ctrl2 = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 12),
    )..repeat(reverse: true);
    _ctrl3 = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 6),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _ctrl1.dispose();
    _ctrl2.dispose();
    _ctrl3.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: Listenable.merge([_ctrl1, _ctrl2, _ctrl3]),
      builder: (context, _) {
        final size = MediaQuery.of(context).size;
        return CustomPaint(
          size: size,
          painter: _GlowPainter(
            t1: _ctrl1.value,
            t2: _ctrl2.value,
            t3: _ctrl3.value,
          ),
        );
      },
    );
  }
}

class _GlowPainter extends CustomPainter {
  final double t1, t2, t3;
  _GlowPainter({required this.t1, required this.t2, required this.t3});

  @override
  void paint(Canvas canvas, Size size) {
    _drawGlow(
      canvas,
      Offset(
        size.width * 0.05 + t1 * size.width * 0.08,
        size.height * 0.10 + t1 * size.height * 0.10,
      ),
      size.width * 0.55,
      const Color(0xFF00BFA5).withOpacity(0.13),
    );
    _drawGlow(
      canvas,
      Offset(
        size.width * 0.85 - t2 * size.width * 0.06,
        size.height * 0.75 + t2 * size.height * 0.08,
      ),
      size.width * 0.50,
      const Color(0xFF00E676).withOpacity(0.10),
    );
    _drawGlow(
      canvas,
      Offset(
        size.width * 0.50 + t3 * size.width * 0.04,
        size.height * 0.45 - t3 * size.height * 0.05,
      ),
      size.width * 0.35,
      const Color(0xFF1565C0).withOpacity(0.09),
    );
  }

  void _drawGlow(Canvas canvas, Offset center, double radius, Color color) {
    final paint = Paint()
      ..shader = RadialGradient(
        colors: [color, Colors.transparent],
      ).createShader(Rect.fromCircle(center: center, radius: radius));
    canvas.drawCircle(center, radius, paint);
  }

  @override
  bool shouldRepaint(_GlowPainter old) =>
      old.t1 != t1 || old.t2 != t2 || old.t3 != t3;
}

class _DotGridOverlay extends StatelessWidget {
  const _DotGridOverlay();

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: MediaQuery.of(context).size,
      painter: _DotGridPainter(),
    );
  }
}

class _DotGridPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    const spacing = 28.0;
    final paint = Paint()
      ..color = Colors.white.withOpacity(0.03)
      ..style = PaintingStyle.fill;
    for (double x = 0; x < size.width; x += spacing) {
      for (double y = 0; y < size.height; y += spacing) {
        canvas.drawCircle(Offset(x, y), 1.2, paint);
      }
    }
  }

  @override
  bool shouldRepaint(_DotGridPainter _) => false;
}
