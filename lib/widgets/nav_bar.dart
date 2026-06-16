import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class NavBar extends StatefulWidget {
  final ScrollController scrollController;
  final List<String> sections;
  final void Function(String) onSectionTap;

  const NavBar({
    super.key,
    required this.scrollController,
    required this.sections,
    required this.onSectionTap,
  });

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  bool _isScrolled = false;
  int _activeIndex = 0;

  @override
  void initState() {
    super.initState();
    widget.scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    widget.scrollController.removeListener(_onScroll);
    super.dispose();
  }

  void _onScroll() {
    final offset = widget.scrollController.offset;
    setState(() {
      _isScrolled = offset > 50;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 768;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: _isScrolled ? 64 : 80,
      decoration: BoxDecoration(
        color: _isScrolled
            ? AppTheme.background.withValues(alpha: 0.95)
            : Colors.transparent,
        border: _isScrolled
            ? const Border(
                bottom: BorderSide(color: AppTheme.border, width: 0.5),
              )
            : null,
      ),
      child: Container(
        constraints: const BoxConstraints(maxWidth: 1200),
        child: Row(
          children: [
            const SizedBox(width: 32),
            Text(
              'SH',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                foreground: Paint()
                  ..shader = const LinearGradient(
                    colors: [AppTheme.primary, AppTheme.secondary],
                  ).createShader(const Rect.fromLTWH(0, 0, 50, 30)),
              ),
            ),
            const Spacer(),
            if (isMobile)
              _buildMobileMenu()
            else
              ...List.generate(widget.sections.length, (i) {
                final isActive = _activeIndex == i;
                return GestureDetector(
                  onTap: () {
                    setState(() => _activeIndex = i);
                    widget.onSectionTap(widget.sections[i]);
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 8,
                    ),
                    child: Text(
                      widget.sections[i],
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: isActive
                            ? FontWeight.w600
                            : FontWeight.w400,
                        color: isActive
                            ? AppTheme.primary
                            : AppTheme.textSecondary,
                        letterSpacing: 1,
                      ),
                    ),
                  ),
                );
              }),
            const SizedBox(width: 16),
            _buildContactButton(),
            const SizedBox(width: 32),
          ],
        ),
      ),
    );
  }

  Widget _buildContactButton() {
    return Container(
      decoration: BoxDecoration(
        gradient: AppTheme.primaryGradient,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: AppTheme.primary.withValues(alpha: 0.3),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(8),
          onTap: () => widget.onSectionTap('Contact'),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              'Hire Me',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 13,
                letterSpacing: 0.5,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMobileMenu() {
    return PopupMenuButton<String>(
      icon: const Icon(Icons.menu, color: AppTheme.textPrimary),
      color: AppTheme.surface,
      onSelected: (value) {
        final index = widget.sections.indexOf(value);
        if (index >= 0) {
          setState(() => _activeIndex = index);
          widget.onSectionTap(value);
        }
      },
      itemBuilder: (context) => widget.sections.map((s) {
        return PopupMenuItem(
          value: s,
          child: Text(s, style: const TextStyle(color: AppTheme.textPrimary)),
        );
      }).toList(),
    );
  }
}
