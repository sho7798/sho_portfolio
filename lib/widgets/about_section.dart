import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../data/portfolio_data.dart';
import 'section_wrapper.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 768;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 100),
      decoration: const BoxDecoration(gradient: AppTheme.backgroundGradient),
      child: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 1200),
          padding: EdgeInsets.symmetric(horizontal: isMobile ? 24 : 48),
          child: SectionWrapper(
            sectionIndex: 1,
            child: Column(
              children: [
                _buildSectionHeader(),
                const SizedBox(height: 48),
                isMobile
                    ? Column(children: _buildMobileContent())
                    : Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(child: _buildTextContent()),
                          const SizedBox(width: 80),
                          _buildStats(),
                        ],
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSectionHeader() {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          decoration: BoxDecoration(
            color: AppTheme.primary.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(20),
          ),
          child: const Text(
            'ABOUT ME',
            style: TextStyle(
              color: AppTheme.primary,
              fontSize: 12,
              fontWeight: FontWeight.w700,
              letterSpacing: 2,
            ),
          ),
        ),
        const SizedBox(height: 16),
        Text(
          PortfolioData.aboutHeadline,
          style: TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.bold,
            foreground: Paint()..shader = AppTheme.primaryGradient.createShader(
              const Rect.fromLTWH(0, 0, 400, 40),
            ),
          ),
        ),
      ],
    );
  }

  List<Widget> _buildMobileContent() {
    return [_buildTextContent(), const SizedBox(height: 32), _buildStats()];
  }

  Widget _buildTextContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          PortfolioData.aboutBody,
          style: TextStyle(
            fontSize: 16,
            color: AppTheme.textSecondary,
            height: 1.8,
          ),
        ),
        const SizedBox(height: 24),
        Row(
          children: [
            _buildInfoChip(Icons.email, PortfolioData.email),
            const SizedBox(width: 16),
            _buildInfoChip(Icons.location_on, PortfolioData.location),
          ],
        ),
      ],
    );
  }

  Widget _buildInfoChip(IconData icon, String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: AppTheme.card,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppTheme.border),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14, color: AppTheme.primary),
          const SizedBox(width: 6),
          Text(
            text,
            style: const TextStyle(
              color: AppTheme.textSecondary,
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStats() {
    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        gradient: AppTheme.cardGradient,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppTheme.border),
      ),
      child: Column(
        children: [
          _buildStatItem('8+', 'Years Experience'),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 24),
            child: Divider(color: AppTheme.border, height: 1),
          ),
          _buildStatItem('50+', 'Apps Built'),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 24),
            child: Divider(color: AppTheme.border, height: 1),
          ),
          _buildStatItem('2M+', 'Users Reached'),
        ],
      ),
    );
  }

  Widget _buildStatItem(String value, String label) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.bold,
            foreground: Paint()..shader = AppTheme.primaryGradient.createShader(
              const Rect.fromLTWH(0, 0, 100, 40),
            ),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(
            color: AppTheme.textMuted,
            fontSize: 14,
            letterSpacing: 1,
          ),
        ),
      ],
    );
  }
}
