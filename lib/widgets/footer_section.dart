import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 768;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 40),
      decoration: BoxDecoration(
        color: AppTheme.background,
        border: const Border(
          top: BorderSide(color: AppTheme.border, width: 0.5),
        ),
      ),
      child: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 1200),
          padding: EdgeInsets.symmetric(horizontal: isMobile ? 24 : 48),
          child: isMobile
              ? Column(children: _buildContent(isMobile))
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: _buildContent(isMobile),
                ),
        ),
      ),
    );
  }

  List<Widget> _buildContent(bool isMobile) {
    return [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'SH',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              foreground: Paint()
                ..shader = AppTheme.primaryGradient.createShader(
                  const Rect.fromLTWH(0, 0, 50, 30),
                ),
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Flutter Developer',
            style: TextStyle(color: AppTheme.textMuted, fontSize: 13),
          ),
        ],
      ),
      SizedBox(height: isMobile ? 24 : 0),
      Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildSocialIcon(Icons.code, 'GitHub'),
          const SizedBox(width: 16),
          _buildSocialIcon(Icons.work, 'LinkedIn'),
          const SizedBox(width: 16),
          _buildSocialIcon(Icons.alternate_email, 'Twitter'),
          const SizedBox(width: 16),
          _buildSocialIcon(Icons.article, 'Medium'),
        ],
      ),
      SizedBox(height: isMobile ? 24 : 0),
      const Text(
        '© 2026 Su Hlaing Oo. Built with Flutter.',
        style: TextStyle(color: AppTheme.textMuted, fontSize: 13),
      ),
    ];
  }

  Widget _buildSocialIcon(IconData icon, String tooltip) {
    return Tooltip(
      message: tooltip,
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: AppTheme.card,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: AppTheme.border),
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(10),
            onTap: () {},
            child: Icon(icon, color: AppTheme.textMuted, size: 18),
          ),
        ),
      ),
    );
  }
}
