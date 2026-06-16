# Portfolio | Flutter Developer

A unique, animated portfolio website built with **Flutter Web** — showcasing skills, experience, and projects for a Flutter developer.

## ✨ Features

- **Animated typing effect** — role titles cycle with a typing cursor
- **Staggered entrance animations** — sections fade and slide in sequentially
- **Animated skill bars** — colored progress bars with percentage counters
- **Filterable project gallery** — filter by category (Fintech, Health, Social, etc.)
- **Experience timeline** — numbered timeline with role highlights
- **Contact form** — validated form with submission feedback
- **Fully responsive** — adapts from desktop to mobile
- **Dark theme** — purple/teal gradient accents throughout

## 🛠️ Built With

- **Flutter** 3.38+ (Web)
- **Dart** 3.10+
- **Material Design 3**

## 📁 Project Structure

```
lib/
  main.dart                  — Entry point with scroll navigation
  theme/app_theme.dart       — Dark theme & color palette
  data/portfolio_data.dart   — All portfolio content
  widgets/
    section_wrapper.dart     — Animated section entrance
    nav_bar.dart             — Sticky scroll-aware navbar
    hero_section.dart        — Hero with typing animation
    about_section.dart       — Bio, contact chips, stats
    skills_section.dart      — Animated skill bars
    experience_section.dart  — Work timeline
    projects_section.dart    — Filterable project cards
    contact_section.dart     — Contact form
    footer_section.dart      — Social links & credits
```

## 🚀 Getting Started

```bash
# Clone the repo
git clone https://github.com/sho7798/sho_portfolio.git

# Install dependencies
flutter pub get

# Run in development
flutter run -d chrome

# Build for production
flutter build web
```

## 🌐 Deployment

The site is pre-configured for **Vercel** with `vercel.json`:

```bash
vercel --prod
```

Or deploy manually via the Vercel dashboard — connect your repo and it will auto-detect the `build/web` output directory.

## 📄 License

MIT
