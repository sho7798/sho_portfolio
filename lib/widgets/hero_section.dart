import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../data/portfolio_data.dart';

class HeroSection extends StatefulWidget {
  const HeroSection({super.key});

  @override
  State<HeroSection> createState() => _HeroSectionState();
}

class _HeroSectionState extends State<HeroSection>
    with SingleTickerProviderStateMixin {
  late AnimationController _floatController;
  String _displayedText = '';
  int _charIndex = 0;
  Timer? _typingTimer;
  bool _showCursor = true;

  final List<String> _roles = [
    'Senior Flutter Developer',
    'Cross-Platform Architect',
    'UI/UX Enthusiast',
    'Open Source Contributor',
  ];
  int _roleIndex = 0;

  @override
  void initState() {
    super.initState();
    _floatController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat(reverse: true);

    _startTyping();
    _startCursorBlink();
  }

  @override
  void dispose() {
    _floatController.dispose();
    _typingTimer?.cancel();
    super.dispose();
  }

  void _startTyping() {
    final target = _roles[_roleIndex];
    _charIndex = 0;
    _displayedText = '';
    _typingTimer = Timer.periodic(const Duration(milliseconds: 60), (timer) {
      if (_charIndex < target.length) {
        setState(() {
          _displayedText += target[_charIndex];
          _charIndex++;
        });
      } else {
        timer.cancel();
        Future.delayed(const Duration(seconds: 2), () {
          _startDeleting();
        });
      }
    });
  }

  void _startDeleting() {
    _typingTimer = Timer.periodic(const Duration(milliseconds: 30), (timer) {
      if (_displayedText.isNotEmpty) {
        setState(() {
          _displayedText = _displayedText.substring(0, _displayedText.length - 1);
        });
      } else {
        timer.cancel();
        setState(() {
          _roleIndex = (_roleIndex + 1) % _roles.length;
        });
        Future.delayed(const Duration(milliseconds: 300), _startTyping);
      }
    });
  }

  void _startCursorBlink() {
    Timer.periodic(const Duration(milliseconds: 500), (timer) {
      setState(() => _showCursor = !_showCursor);
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 768;

    return Container(
      width: double.infinity,
      height: 600,
      decoration: const BoxDecoration(gradient: AppTheme.backgroundGradient),
      child: Stack(
        children: [
          Positioned.fill(child: _buildBackgroundParticles()),
          Center(
            child: Container(
              constraints: const BoxConstraints(maxWidth: 1200),
              padding: EdgeInsets.symmetric(horizontal: isMobile ? 24 : 48),
              child: isMobile
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: _buildContent(),
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: _buildContent(),
                        )),
                        const SizedBox(width: 48),
                        _buildAvatar(isMobile),
                      ],
                    ),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildContent() {
    return [
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          gradient: AppTheme.primaryGradient,
          borderRadius: BorderRadius.circular(20),
        ),
        child: const Text(
          'Hello, I\'m',
          style: TextStyle(
            color: Colors.white,
            fontSize: 13,
            fontWeight: FontWeight.w600,
            letterSpacing: 1,
          ),
        ),
      ),
      const SizedBox(height: 24),
      Text(
        PortfolioData.name,
        style: const TextStyle(
          fontSize: 56,
          fontWeight: FontWeight.bold,
          color: AppTheme.textPrimary,
          letterSpacing: -2,
          height: 1.1,
        ),
      ),
      const SizedBox(height: 12),
      Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            _displayedText,
            style: TextStyle(
              fontSize: 22,
              foreground: Paint()..shader = AppTheme.primaryGradient.createShader(
                const Rect.fromLTWH(0, 0, 300, 30),
              ),
              fontWeight: FontWeight.w500,
            ),
          ),
          Container(
            width: 2,
            height: 26,
            color: _showCursor ? AppTheme.secondary : Colors.transparent,
          ),
        ],
      ),
      const SizedBox(height: 20),
      Text(
        PortfolioData.tagline,
        style: const TextStyle(
          fontSize: 16,
          color: AppTheme.textSecondary,
          height: 1.6,
        ),
      ),
      const SizedBox(height: 32),
      Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildGradientButton('View My Work', Icons.arrow_forward),
          const SizedBox(width: 16),
          _buildOutlineButton('Get in Touch'),
        ],
      ),
    ];
  }

  Widget _buildGradientButton(String text, IconData icon) {
    return Container(
      decoration: BoxDecoration(
        gradient: AppTheme.primaryGradient,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: AppTheme.primary.withValues(alpha: 0.3),
            blurRadius: 16,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  text,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(width: 8),
                Icon(icon, color: Colors.white, size: 18),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildOutlineButton(String text) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppTheme.border),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
            child: Text(
              text,
              style: const TextStyle(
                color: AppTheme.textSecondary,
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAvatar(bool isMobile) {
    return AnimatedBuilder(
      animation: _floatController,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, sin(_floatController.value * pi * 2) * 10),
          child: child,
        );
      },
      child: Container(
        width: isMobile ? 200 : 300,
        height: isMobile ? 200 : 300,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: const RadialGradient(
            colors: [AppTheme.primary, AppTheme.secondary, AppTheme.background],
            stops: [0.0, 0.5, 1.0],
          ),
          boxShadow: [
            BoxShadow(
              color: AppTheme.primary.withValues(alpha: 0.2),
              blurRadius: 60,
              spreadRadius: 10,
            ),
          ],
        ),
        child: const Center(
          child: Text(
            'AC',
            style: TextStyle(
              fontSize: 72,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBackgroundParticles() {
    return CustomPaint(
      painter: _ParticlePainter(),
      size: Size.infinite,
    );
  }
}

class _ParticlePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppTheme.primary.withValues(alpha: 0.08)
      ..style = PaintingStyle.fill;

    final random = Random(42);
    for (int i = 0; i < 30; i++) {
      final x = random.nextDouble() * size.width;
      final y = random.nextDouble() * size.height;
      final r = random.nextDouble() * 3 + 1;
      canvas.drawCircle(Offset(x, y), r, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
